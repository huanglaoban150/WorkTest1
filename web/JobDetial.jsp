<!DOCTYPE html>
<html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <title>职位详细</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<div class="ok-body">
    <!--form表单-->
    <form class="layui-form ok-form">
        <div class="layui-form-item">
            <label class="layui-form-label">职位编号</label>
            <div class="layui-input-block">
                <input type="text" name="jid" lay-verify="required" readonly="readonly" placeholder="请输入职位编号"  class="layui-input jid" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">职位名称</label>
            <div class="layui-input-block">
                <input type="text" name="jname" lay-verify="required" placeholder="请输入职位名"  class="layui-input jname" >
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-block">
                <input type="text" name="jremark" placeholder="请输入职位备注" class="layui-input jremark" >
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
<script type="text/javascript" src="layui/layui.js"></script>
<script src="js/jquery-1.8.2.min.js"></script>
<script>

    $(function () {
        var parent_json = eval('('+parent.json+')');
        $(".jid").val(parent_json.jid);
        $(".jname").val(parent_json.jname);
        $(".jremark").val(parent_json.jremark);

    });


    layui.use(['element', 'form', 'jquery'], function () {
        var element = layui.element;
        var table = layui.table;
        var form = layui.form;
        var $ = layui.jquery;


        form.on('submit(edit)', function(data){
            //   layer.alert(JSON.stringify(data.field), {
            //      title: '最终的提交信息'
            //   })
            var checkcodeText=data.field.checkcode;
            var json={"checkcode":checkcodeText,"json":JSON.stringify(data.field)}//接收到的数据
            console.log(json);
            //用ajax完成后台数据交换 $.post(url.json,function (data)
            $.post('updateJob',json,function (data){
                if (data==2)
                    layer.msg("修改失败",{icon:5});
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