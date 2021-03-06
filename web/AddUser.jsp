<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
    <style>
        .login_p1{
            color:#000000;
            font-size: 25px;
            font-weight: bold;
        }
    </style>
</head>
<body style="margin-top: 70px;margin-left: 350px;margin-right: 15px;margin-bottom: 10px;align-items: center" >
<div class="registry_div layui-bg-white">
    <form class="layui-form layui-form-pane" action="" id="demo1">

        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 70px;">
                <i class="layui-icon layui-icon-username" style="font-size: 20px; color: #FFB800;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="number" lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 70px;">
                <i class="layui-icon layui-icon-password" style="font-size: 20px; color: #FFB800;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="password"  lay-verify="required|confirmPass" placeholder="请输入密码" autocomplete="off" class="layui-input">
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

        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 70px;">
                <i class="layui-icon layui-icon-email" style="font-size: 20px; color: #FFB800;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="email" lay-verify="required|mail" placeholder="请输入邮箱" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item login_top">
            <label class="layui-form-label" style="width: 70px;">
                <i class="layui-icon layui-icon-cellphone-fine" style="font-size: 20px; color: #FFB800;"></i>
            </label>
            <div class="layui-input-inline">
                <input type="text" name="phone" lay-verify="required|phone" placeholder="请输入手机号" autocomplete="off" class="layui-input">
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
            //用ajax完成后台数据交换 $.post(url.json,function (data)
            $.post('addUser',json,function (data){
                if (data==1)
                    layer.msg("添加成功",{icon: 1});
                if (data==2)
                    layer.msg("添加失败失败，用户账号存在或者手机号码已经被注册",{icon:5});
                if (data==3)
                    layer.msg("权限不足，无法进行操作",{icon:5});
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
