<%--
  Created by IntelliJ IDEA.
  User: 14069
  Date: 2021/6/2
  Time: 下午 06:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录-人力资源管理后台</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <link rel="stylesheet" type="text/css" href="css/supersized.css">
    <script src="./layui/layui.js"></script>
    <script language="javascript"></script>
    <style>
        .login_div{

            margin-top: 230px;
            margin-left: 800px;
            width: 400px;
            height: 400px;
            background-color: #FFFFFF;
            border-radius:40px;
        }
        .login_p1{
            margin-top: 30px;
            color: #b5b85f;
            font-size: 26px;
            font-weight:bold ;
            text-align: center;

        }
    </style>
</head>
<body style="overflow-y: hidden">
<div id="supersized"></div>
<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
<script type="text/javascript" src="js/supersized-init.js"></script>
<script type="text/javascript" src="js/supersized.3.2.7.min.js"></script>
<div class="login_div">
    <div class="login_p1" >后台管理</div>
    <form class="layui-form layui-form-pane" action="login" id="demo1"type=""method="post">
        <div class="layui-form-item" style="text-align: center;margin-top: 20px;margin-left: 47px">
            <label class="layui-form-label"> <i class="layui-icon layui-icon-user" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;账号：&nbsp;</label>
            <div class="layui-input-inline">
                <input type="text" name="username" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input"  value="${username2}">
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;margin-top: 20px;margin-left: 47px">
            <label class="layui-form-label"><i class="layui-icon layui-icon-key" style="font-size: 18px; color: #1E9FFF;"></i>&nbsp;密码：&nbsp;</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input" value="${password}" >
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;margin-top: 20px;margin-left: 47px;">
            <label class="layui-form-label"><i class="layui-icon layui-icon-chat" style="font-size: 18px; color: #1E9FFF;"></i>验证码：&nbsp;</label>
            <div class="layui-input-inline">
                <input type="text" name="checkcode" lay-verify="required" placeholder="请输入验证码" autocomplete="off" class="layui-input" style="width: 110px">

                <img src="CheckCode" id="imgcode" width="120" height="43"   style="margin-left: 119px;margin-top: -40px;"  onClick="myReload()"  />

            </div>


        </div>
        <div class="layui-form-item" style="margin-top: 40px">
            <label class="layui-input-inline">
                <button class="layui-btn"  id="btn-submit" lay-submit="" lay-filter="demo1"style="margin-left: 80px;width: 140%">登录</button>
            </label>
        </div>
    </form>

    <div class="layui-form-item" id="layerDemo" >
        <label class="layui-input-inline">
            <button data-method="notice" class="layui-btn" style="width: 140%;margin-left: 80px" >注册</button>
        </label>
    </div>

</div>


</div>
</body>
<script>
    function myReload() {
        document.getElementById("imgcode").src = document
            .getElementById("imgcode").src + "?nocache=" + new Date().getTime();
    }



    layui.use(['form', 'layedit', 'laydate','layer','jquery'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,$=layui.jquery
            ,laydate = layui.laydate;

        //获取登录数据对话框
        var login="${loginInfo}";
        if (login!=""){

            layer.msg(login,{icon:5});
        }


        var active = {
            notice: function(){
                //示范一个公告层
                layer.open({
                    type: 2
                    ,title: "注册用户" //不显示标题栏
                    ,closeBtn: true
                    ,area: ['500px','500px']
                    ,shade: 0.5
                    ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                    ,btn: ['取消']
                    ,offset: [
                        ($(window).height()-800)
                        ,($(window).width()-900)
                    ]
                    ,btnAlign: 'c'
                    ,moveType: 1 //拖拽模式，0或者1
                    ,content: 'register.html'

                });
            }

        };

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });



        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });

</script>



</html>
