package com.hg.controller;

import com.alibaba.fastjson.JSON;
import com.hg.pojo.*;
import com.hg.service.CountsService;
import com.hg.service.UserService;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;


@Controller
public class UserController {
    @Autowired
    private CountsService countsService;
    @Autowired
    private UserService userService;

    @RequestMapping("/login")
    public String login(String username,String password,String checkcode,HttpServletRequest request) {
        HttpSession session = request.getSession();
        String loginInfo = "验证码错误";
        try {
            String checkcodeSession = (String) session.getAttribute("checkcodeSession");
            if (checkcode.equalsIgnoreCase(checkcodeSession)) {
                //验证码正确之后把用户信息提交到Service
                User user = userService.login(username, password);
                if (user != null) {
                    //登录成功，存入session
                    //查询各个表中数据
                    Counts counts = countsService.selectCounts();
                    session.setAttribute("counts", counts);
                    session.setAttribute("username1", username);
                    session.setAttribute("user", user);
                    session.setAttribute("password1",password);
                    // String name=(String) session.getAttribute("username");
                    // System.out.println("the name is++++++++++++"+name);
                    return "main";
                } else {
                    loginInfo = "用户名或密码错误！";
                }
            }
        }catch (Exception e) {
            //当session为空时候，会进行错误输出，catch捕获错误并且返回
            return "index";
        }
        //失败后不进行跳转，给提示
        request.setAttribute("username2", username);
        request.setAttribute("password", password);
        request.setAttribute("loginInfo", loginInfo);
        return "index";
    }
    @RequestMapping("/PasswordUpdate")
    @ResponseBody
    public String PasswordUpdate(String json,HttpServletRequest servletRequest){
        String data="2";
        HttpSession session = servletRequest.getSession();
        String name=(String) session.getAttribute("username1");
        String password=(String)session.getAttribute("password1");
        User2 user= JSON.parseObject(json,User2.class);
        user.setNumber(name);
        if (password.equals(user.getOldpassword()))
        {
            int i=userService.updatePassword(user);
            session.setAttribute("password1",user.getPassword());
            data="1";
        }
        else {
            data="2";
        }
        return data;
    }


    //用户退出
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.invalidate();
        session.setMaxInactiveInterval(0);//有效期改为0
        return "index";
    }

    //用户注册
    @RequestMapping("/registerUser")
    @ResponseBody
    public String register(String json,String checkcode,HttpServletRequest servletRequest){
        Random random=new Random();
        HttpSession session = servletRequest.getSession();
        String checkcodeSession = (String)session.getAttribute("checkcodeSession");
        String data="0";
        try {
            if  (checkcode.equalsIgnoreCase(checkcodeSession)) {
                User user= JSON.parseObject(json,User.class);
                user.setRoleId(1);
                user.setUsername("用户"+random.nextInt(100));
                user.setCreatedate(new Date());
               // System.out.println("json====="+user);
                int i=userService.register(user);
                if(i>0){
                    data="1";
                }else{
                    data="2";

                }
            }
        }catch (Exception e){
            data="2";
            e.printStackTrace();
        }finally {
            return  data;
        }
      /*  if (checkcode.equalsIgnoreCase(checkcodeSession)){//验证码正确输出信息
            System.out.println("json====="+json);
            return "1";

        }else
        {
            return "0";
        }*/

    }


    //删除用户
    @RequestMapping(value = "delUser/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    private String deleteById(@PathVariable("id") String id,HttpServletRequest servletRequest) {
        HttpSession session = servletRequest.getSession();
        String name=(String) session.getAttribute("username1");
        int userroleid=userService.findRoleId(name);

        //System.out.println("the name is========"+userroleid);
        int roleid=userService.findRoleId(id);
        String data="0";
       // System.out.println("the roleid is=========="+roleid);
        if (userroleid>roleid) {
            int result = userService.deleteById(id);
            //System.out.println("The id is====="+id);
            Map<String, Object> map = new HashMap<String, Object>();
            if (result > 0) {
                data = "1";
            } else {
                data = "0";
            }
        }else {
            data="3";
        }
        return data;
    }

//查找用户
    @RequestMapping( value = "findUsers" ,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String findUsers(Integer page,Integer limit,HttpServletRequest request ) {//layui自带的参数
       // System.out.println("当前页数：" + page + ",条数：" + limit);
        int start = (page - 1) * limit;
        UsersPage usersPage = new UsersPage();
        usersPage.setStart(start);
        usersPage.setLimit(limit);

        HttpSession session = request.getSession();
        String name=(String) session.getAttribute("username1");
        int userroleid=userService.findRoleId(name);
        Map<String, Object> map = new HashMap<>();

        if (userroleid>=2) {
            List<User> list = userService.findByUsers(usersPage);
            list.forEach(li -> System.out.println(li));
            //构造json数据传递输出
             map = new HashMap<>();
            map.put("code", 0);
            map.put("msg", "");
            //获得数据总数
            Counts counts = (Counts) session.getAttribute("counts");
            int userCount = counts.getUserCount();//获得用户信息表中的所有数据条数
            map.put("count", userCount);
            map.put("data", list);
        }

        if (userroleid<=1) {
            List<User1> list = userService.findByUsers1(usersPage);
            //list.forEach(li -> System.out.println(li));
            //构造json数据传递输出
            map = new HashMap<>();
            map.put("code", 0);
            map.put("msg", "");
            //获得数据总数
            Counts counts = (Counts) session.getAttribute("counts");
            int userCount = counts.getUserCount();//获得用户信息表中的所有数据条数
            map.put("count", userCount);
            map.put("data", list);
        }

        //讲map集合封装成json
        String json = JSON.toJSONString(map);
        return json;

    }
//添加用户
@RequestMapping("/addUser")
@ResponseBody
public String addUser(String json,String checkcode,HttpServletRequest servletRequest){
    Random random=new Random();
    HttpSession session = servletRequest.getSession();
    String name=(String) session.getAttribute("username1");
    int userroleid=userService.findRoleId(name);
    String data="0";

    try {
            if (userroleid>=2) {
                User user = JSON.parseObject(json, User.class);
                user.setRoleId(1);
                user.setUsername("用户" + random.nextInt(100));
                user.setCreatedate(new Date());
               System.out.println("json=====user"+user);
                int i = userService.addUser(user);
                if (i > 0) {
                    data = "1";
                } else {
                    data = "2";

                }
            }else {
                data="3";
            }
    }catch (Exception e){
        data="2";
        e.printStackTrace();
    }finally {
        return  data;
    }
      /*  if (checkcode.equalsIgnoreCase(checkcodeSession)){//验证码正确输出信息
            System.out.println("json====="+json);
            return "1";

        }else
        {
            return "0";
        }*/

    }

    @RequestMapping("/updateUser")
    @ResponseBody
    public String updateUser(String json,String checkcode,HttpServletRequest servletRequest) {
        HttpSession session = servletRequest.getSession();
        String name = (String) session.getAttribute("username1");
        int userroleid = userService.findRoleId(name);
        String data = "0";
        try {
            if (userroleid >= 2) {
                User user = JSON.parseObject(json, User.class);
                  //System.out.println("json=====user"+user);
                int i = userService.updateUser(user);
                if (i > 0) {
                    data = "1";
                } else {
                    data = "2";

                }
            } else {
                data = "3";
            }
        } catch (Exception e) {
            data = "2";
            e.printStackTrace();
        } finally {
            return data;
        }
    }
}

