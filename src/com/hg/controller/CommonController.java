package com.hg.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CommonController {

    @RequestMapping("index")
    public String index(){
        return "index";
    }
    @RequestMapping("Myinformation")
    public String Myinformation(){
        return "Myinformation";
    }
    @RequestMapping("UserView")
    public String UserView(){
        return "UserView";
    }
    @RequestMapping("updatepassword")
    public String updatePassword(){
        return "UpdatePassword";
    }
    @RequestMapping("AddUser")
    public String AddUser(){
        return "AddUser";
    }
    @RequestMapping("UserDetial")
    public String UserDetial(){
        return "UserDetial";
    }
    @RequestMapping("selectDept")
    public String selectDept(){
        return "selectDept";
    }
    @RequestMapping("JobView")
    public String JobView(){
        return "JobView";
    }
    @RequestMapping("AddJob")
    public String AddJob(){
        return "AddJob";
    }
    @RequestMapping("JobDetial")
    public String JobDetial(){
        return "JobDetial";
    }
    @RequestMapping("selectEmployee")
    public String selectEmployee(){
        return "selectEmployee";
    }

}
