<%--
  Created by IntelliJ IDEA.
  User: 14069
  Date: 2021/6/2
  Time: 下午 04:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="./layui/css/layui.css">
    <script src="./layui/layui.js"></script>
</head>
<body>
<table class="layui-hide" id="test" lay-filter="test"></table>

<script type="text/html" id="toolbarDemo">

    <div class="demoTable">
        搜索账号：
        <div class="layui-inline">
            <input class="layui-input" name="id" id="demoReload" autocomplete="off">
        </div>
        <button class="layui-btn" data-type="reload">搜索</button>
    </div>
</script>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-xs" lay-event="edit">查看</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/html" id="roleIDview">
    {{# if(d.roleId=== 1) { }}
    <span class="layui-btn  layui-btn-xs layui-btn-radius layui-btn-normal">普通用户</span>
    {{# } else if(d.roleId== 2) { }}
    <span class="layui-btn layui-btn-xs  layui-btn-radius layui-btn-warm">管理员</span>
    {{# } else { }}
    <span class="layui-btn layui-btn-xs layui-btn-radius layui-btn-danger">超级管理员</span>
    {{# } }}

</script>


<script>
    layui.use(['element','jquery', 'table', 'layer', 'form'], function() {
        // 加载layui模块，使用其推荐的【预先加载】方式，详见官网【模块规范】一节
        var element = layui.element;
        var $ = layui.$;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        table.render({
            elem: '#test'
            ,url:'findUsers'//数据库取值操作
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,height: '550px' //高度最大化减去差值
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'username', title:'用户名', width:'9%', fixed: 'left'}
                ,{field:'number', title:'账号', width:'10%', fixed: 'left'}
                ,{field:'password', title:'密码', width:'10%', edit: 'text'}
                ,{field:'phone', title:'电话', width:'12%'}
                ,{field:'createdate', title:'账号信息变更时间', width:'15%', templet: "<div>{{layui.util.toDateString(d.createdate, 'yyyy-MM-dd HH:mm:ss')}}</div>"}
                ,{field:'remark', title:'备注',  width:'15%'}
                ,{field: 'roleId',title: '权限信息',templet: '#roleIDview',width: '10%'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:'15%'}

            ]]
            , limits: [10,30,60]
            ,page: true
        });
        var $ = layui.$, active = {
            reload: function(){
                var demoReload = $('#demoReload');

                //执行重载
                table.reload('test', {
                    page: {
                        curr: 1 //重新从第 1 页开始
                    }
                    ,where: {
                        key: {
                            number: demoReload.val()
                        }
                    }
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            search = $('#demoReload').val();

            $('.layui-table-fixed tbody tr').each(function(i){
                var id = $(this).children('td').eq(2).children('div').html();
                if(id.indexOf(search)>=0){
                    $(this).show()
                    $('.layui-table-main tbody tr').eq(i).show()
                }else{
                    $('.layui-table-main tbody tr').eq(i).hide()
                    $(this).hide();
                }
            });
        });

        $('.demoTable .layui-btn').on('click', function(){
            var type = $(this).data('type');
            active[type] ? active[type].call(this) : '';
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){
            var data = obj.data;
            //console.log(data)
            if(obj.event === 'del'){
                layer.confirm('您确认删除该员工账号为：'+data.number + " 的成员？", function(index) {
                    // ajax方式删除用户
                    $.ajax({
                        url: 'delUser/' + data.number,
                        type: "DELETE",
                        dataType: 'json',
                        success: function(data) {
                            if (data == 1) {
                                layer.msg('删除成功');
                                table.reload('test');
                            } if (data==3) {
                                layer.msg('删除失败,不能跨权限删除');
                            }if (data==0){
                                layer.msg('非法操作');
                            }
                        },
                        error: function() {
                            console.log("ajax error");
                        }
                    });
                    layer.close(index);
                });
            } else if(obj.event === 'edit'){
                json = JSON.stringify(data);
                layer.open({
                    title: '用户角色详情',
                    type: 2,
                    shade: false,
                    maxmin: true,
                    shade: 0.5,
                    offset: [
                        ($(window).height()-700)
                        ,($(window).width()-900)],
                    area: ['500px','500px'],
                    content: 'UserDetial',
                    zIndex: layer.zIndex,
                    success : function(layero, index){
                        var body = layui.layer.getChildFrame('body', index);
                    },
                    end: function () {
                        $(".layui-laypage-btn")[0].click();
                    }
                });
            }
        });
    });
</script>

</body>
</html>
