package com.hg.until;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CheckCode", value = "/CheckCode")
public class CheckCode extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LineCaptcha lineCaptcha= CaptchaUtil.createLineCaptcha(200,100,4,15);
        lineCaptcha.write(response.getOutputStream());

        HttpSession session=request.getSession();
        String checkcodeSession=lineCaptcha.getCode();
        session.setAttribute("checkcodeSession",checkcodeSession);

        System.out.println("生成的验证码："+checkcodeSession);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
