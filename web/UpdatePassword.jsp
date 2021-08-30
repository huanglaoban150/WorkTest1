<%--
  Created by IntelliJ IDEA.
  User: 14069
  Date: 2021/8/30
  Time: 上午 09:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./js/jquery.min.js"></script>
    <script src="./layui/layui.js"></script>
</head>
<body style="margin-top: 10px;margin-left: 100px;margin-right: 15px;margin-bottom: 10px;align-items: center" >
<div class="registry_div layui-bg-white">
    <form class="layui-form layui-form-pane" action="" id="demo1">

        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 70px;">
                <i class="layui-icon layui-icon-username" style="font-size: 20px; color: #FFB800;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="oldpassword" lay-verify="required" placeholder="请输入旧密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 70px;">
                <i class="layui-icon layui-icon-password" style="font-size: 20px; color: #FFB800;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password"  lay-verify="required|confirmPass" placeholder="请输入新密码" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 70px;">
                <i class="layui-icon layui-icon-ok" style="font-size: 20px; color: #FFB800;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" placeholder="请确认密码" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="login_p1" >
            <div class=""  style="width: 380px" >
                <button data-method="notice" class="layui-btn layui-btn-fluid layui-bg-blue" lay-submit="" lay-filter="demo1" style="margin-left: 120px;width: 60px;">确定</button>
            </div>
        </div>

    </form>
</div>
</body>
<script>
    layui.use(['form', 'layedit', 'laydate','layer','jquery'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,$=layui.jquery
            ,laydate = layui.laydate;

        form.verify({
            confirmPass:function (value) {
                if ($('input[name=password]').val()!=value)
                    return '两次输入密码不一样，请检查'
            }
        });


        //监听提交
        form.on('submit(demo1)', function(data){
            //   layer.alert(JSON.stringify(data.field), {
            //      title: '最终的提交信息'
            //   })
            var checkcodeText=data.field.checkcode;

            var json={"checkcode":checkcodeText,"json":JSON.stringify(data.field)}//接收到的数据
            console.log(json);
            //用ajax完成后台数据交换 $.post(url.json,function (data)
            $.post('PasswordUpdate',json,function (data){
                if (data==0)
                    layer.msg("验证码错误",{icon:5});
                if (data==1)
                    layer.msg("修改成功",{icon: 1});
                if (data==2)
                    layer.msg("修改失败，旧密码不正确",{icon:5});
            });

            return false;
        });
        //表单取值
        layui.$('#LAY-component-form-getval').on('click', function(){
            var data = form.val('example');
            alert(JSON.stringify(data));
        });

    });
</script>
</html>
