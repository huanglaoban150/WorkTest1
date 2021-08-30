package com.hg.controller;

import com.alibaba.fastjson.JSON;
import com.hg.pojo.Counts;
import com.hg.pojo.Dept;
import com.hg.pojo.UsersPage;
import com.hg.service.DeptService;
import com.hg.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class DeptController {

   @Autowired
    private DeptService deptService;

    @RequestMapping( value = "findDept" ,produces = "application/json; charset=utf-8")
    @ResponseBody
    public String findDept(Integer page, Integer limit, HttpServletRequest request ){//layui自带的参数
        System.out.println("当前页数："+page+",条数："+limit);
        int start=(page-1)*limit;
        UsersPage usersPage=new UsersPage();
        usersPage.setStart(start);
        usersPage.setLimit(limit);

        List<Dept> list= deptService.findByDept(usersPage);

        // list.forEach(li-> System.out.println(li));
        //构造json数据传递输出
        Map<String,Object> map=new HashMap<>();
        map.put("code",0);
        map.put("msg","");
        //获得数据总数
        HttpSession session=request.getSession();
        Counts counts =(Counts) session.getAttribute("counts");
        int userCount = counts.getDeptCount();//获得用户信息表中的所有数据条数
        map.put("count",userCount);
        map.put("data",list);

        //讲map集合封装成json
        String json= JSON.toJSONString(map);
        return json;

    }
}
