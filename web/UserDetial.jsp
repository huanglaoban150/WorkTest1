<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>用户角色审批</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
    <style>
        #city_1 select{
            height: 36px;
            line-height: 1.3;
            line-height: 38px;
            border-width: 1px;
            border-style: solid;
            background-color: #fff;
            border-radius: 2px;
            border-color: #e4dddd;
            width:445px;
        }
        .cityLable{
            position: relative;
            left: -106px;
            top: 35px;
        }
        input{
            width:200px;
        }
    </style>
</head>
<body>
<div class="ok-body">
    <!--form表单-->
    <form class="layui-form ok-form">
        <div class="layui-form-item">
            <label class="layui-form-label">昵称</label>
            <div class="layui-input-block">
                <input type="text" name="username" lay-verify="required" placeholder="请输入昵称"  class="layui-input username" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">账号</label>
            <div class="layui-input-block">
                <input type="text" name="number" placeholder="请输入账号" readonly="readonly"class="layui-input number" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <input type="text" name="password" placeholder="请输入账号密码" lay-verify="required" class="layui-input password" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">电话号码</label>
            <div class="layui-input-block">
                <input type="text" name="phone" placeholder="请输入电话号码" lay-verify="required|phone"  class="layui-input phone" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="remark" placeholder="请输入备注信息" class="layui-input remark" >

            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label"><span class="color-red">* </span>身份管理：</label>
            <div class="layui-input-inline">
                <select id="roleId"  name="roleId"class="layui-input roleId">
                    <option value="">请选择</option>
                    <option value="1">普通用户</option>
                    <option value="2">管理员</option>
                    <option value="3">超级管理员</option>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="edit">提交</button>
            </div>
        </div>
    </form>
</div>
<!--js逻辑-->
<script type="text/javascript" src="/layui/layui.js"></script>
<script src="js/jquery-1.8.2.min.js"></script>
<script>

    $(function () {
        var parent_json = eval('('+parent.json+')');
        console.log(parent_json);
        $(".username").val(parent_json.username);
        $(".number").val(parent_json.number);
        $(".password").val(parent_json.password);
        $(".phone").val(parent_json.phone);
        $(".remark").val(parent_json.remark);
        var select = 'dd[lay-value=' + parent_json.roleId + ']';
        $('#roleId').siblings("div.layui-form-select").find('dl').find(select).click();
        $('#roleId').find("option:selected").val();

    });


    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;
        var $ = layui.jquery;

        form.verify({
            confirmPass:function (value) {
                if ($('input[name=password]').val()!=value)
                    return '两次输入密码不一样，请检查'
            }
        });

        form.on('submit(edit)', function(data){
            //   layer.alert(JSON.stringify(data.field), {
            //      title: '最终的提交信息'
            //   })
            var checkcodeText=data.field.checkcode;
            var json={"checkcode":checkcodeText,"json":JSON.stringify(data.field)}//接收到的数据
            console.log(json);
            //用ajax完成后台数据交换 $.post(url.json,function (data)
            $.post('updateUser',json,function (data){
                if (data==2)
                    layer.msg("修改失败,查看手机号码是否重复",{icon:5});
                if (data==1)
                    layer.msg("修改成功",{icon: 1});
                if (data==3)
                    layer.msg("权限不足",{icon:5});
            });

            return false;
        });
    })

</script>
</body>
</html>