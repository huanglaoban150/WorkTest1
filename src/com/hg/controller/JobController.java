package com.hg.controller;

import com.alibaba.fastjson.JSON;
import com.hg.pojo.*;
import com.hg.service.CountsService;
import com.hg.service.EmployeeService;
import com.hg.service.JobService;
import com.hg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class JobController {

    @Autowired
    private UserService userService;
    @Autowired
    private CountsService countsService;
    @Autowired
    private JobService jobService;

    @RequestMapping( value = "findJob" ,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String findEmployee(Integer page, Integer limit, HttpServletRequest request ){//layui自带的参数
        System.out.println("当前页数："+page+",条数："+limit);
        int start=(page-1)*limit;
        UsersPage usersPage=new UsersPage();
        usersPage.setStart(start);
        usersPage.setLimit(limit);

        List<Job> list= jobService.findByJob(usersPage);


        //list.forEach(li-> System.out.println(li));
        //构造json数据传递输出
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        //获得数据总数
        HttpSession session=request.getSession();
        Counts counts =(Counts) session.getAttribute("counts");
        int userCount = counts.getJobCount();//获得用户信息表中的所有数据条数
        map.put("count",userCount);
        map.put("data",list);

        //讲map集合封装成json
        String json= JSON.toJSONString(map);
        return json;

    }

    //删除职位
    @RequestMapping(value = "delJob/{id}", method = RequestMethod.DELETE)
    @ResponseBody
    private String deleteById(@PathVariable("id") int id, HttpServletRequest servletRequest) {
        HttpSession session = servletRequest.getSession();
        String name=(String) session.getAttribute("username1");
        int userroleid=userService.findRoleId(name);
        //System.out.println("the name is========"+userroleid);

        String data="0";

        if (userroleid>=2) {
            int result = jobService.deleteByJobId(id);
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

    //添加职位
    @RequestMapping("/addJob")
    @ResponseBody
    public String addJob(String json,HttpServletRequest servletRequest){
        HttpSession session = servletRequest.getSession();
        String name=(String) session.getAttribute("username1");
        int userroleid=userService.findRoleId(name);
        String data="0";

        try {
            if (userroleid>=2) {
                Job job = JSON.parseObject(json, Job.class);
                System.out.println("json====="+job);
                int i = jobService.addJob(job);
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
    //更新职位信息
    @RequestMapping(value = "updateJob",produces = "application/json; charset=utf-8")
    @ResponseBody
    public String updateUser(String json,String checkcode,HttpServletRequest servletRequest) {
        HttpSession session = servletRequest.getSession();
        String name = (String) session.getAttribute("username1");
        int userroleid = userService.findRoleId(name);
        String data = "0";
        try {
            if (userroleid >= 2) {
                Job job = JSON.parseObject(json, Job.class);
                System.out.println("json=====user"+job);
                int i = jobService.updateJob(job);
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
