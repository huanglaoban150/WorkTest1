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
        搜索职位编号：
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
            ,url:'findJob'//数据库取值操作
            ,toolbar: '#toolbarDemo' //开启头部工具栏，并为其绑定左侧模板
            ,height: '550px' //高度最大化减去差值
            ,title: '用户数据表'
            ,cols: [[
                {type: 'checkbox', fixed: 'left'}
                ,{field:'jid', title:'职位编号',  width:'15%', fixed: 'left'}
                ,{field:'jname', title:'职位名', width:'15%', }
                ,{field:'jremark', title:'备注',  width:'30%'}
                ,{fixed: 'right', title:'操作', toolbar: '#barDemo', width:'18%'}
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
                            jname: demoReload.val()
                        }
                    }
                });
            }
        };
        $('.demoTable .layui-btn').on('click', function(){
            search = $('#demoReload').val();
            console.log(search);
            $('.layui-table-fixed tbody tr').each(function(i){
                var id = $(this).children('td').eq(1).children('div').html();
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
            //console.log(data.number)
            if(obj.event === 'del'){
                layer.confirm('您确认删除该职位：'+data.jname + " 的职位？", function(index) {
                    // ajax方式删除用户
                    $.ajax({
                        url: 'delJob/' + data.jid,
                        type: "DELETE",
                        dataType: 'json',
                        success: function(data) {
                            if (data == 1) {
                                layer.msg('删除成功');
                                table.reload('test');
                            } if (data==3) {
                                layer.msg('抱歉，你为普通员工不能操作，打工人不要想太多了');
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
            }else if(obj.event === 'edit'){
                json = JSON.stringify(data);
                layer.open({
                    title: '职位详情',
                    type: 2,
                    shade: false,
                    maxmin: true,
                    shade: 0.5,
                    offset: [
                        ($(window).height()-700)
                        ,($(window).width()-900)],
                    area: ['500px','500px'],
                    content: 'JobDetial',
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
