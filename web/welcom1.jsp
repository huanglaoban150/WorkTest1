<%--
  Created by IntelliJ IDEA.
  User: Jeffery
  Date: 2021/6/8
  Time: 17:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <script src="${pageContext.request.contextPath}/layui/layui.js"></script>
</head>
<body style="overflow-y: hidden">

<div class="layui-bg-gray" style="padding: 30px;">
    <div class="layui-row layui-col-space15">

        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">快速入口</div>

                    <button class="layui-btn layui-btn-danger" style="width: 120px;height: 90px; font-size: 30px"><i
                            class="layui-icon layui-icon-username" style="font-size: 45px; color: #FFFFFF;"></i>
                        <br>

                     ${counts.userCount}
                    </button>
                    <button class="layui-btn layui-btn-warm" style="width: 120px;height: 90px;"><i
                            class="layui-icon layui-icon-username" style="font-size: 50px; color: #FFFFFF;"></i>
                        <br>
                      职位：  ${counts.deptCount}

                    </button>
                    <button class="layui-btn layui-btn-normal" style="width: 120px;height: 90px;"><i
                            class="layui-icon layui-icon-username" style="font-size: 50px; color: #1eff3c;"></i>
                        <br>
                      员工：  ${counts.employeeCount}
                    </button>


                </div>
                <div class="layui-card-body">
                    <button class="layui-btn layui-btn-warm" style="width: 120px;height: 90px; font-size: 30px"><i
                            class="layui-icon layui-icon-username" style="font-size: 45px; color: #FFFFFF;"></i>
                        <br>
                        ${counts.jobCount}
                    </button>
                    <button class="layui-btn layui-btn-normal " style="width: 120px;height: 90px;"><i
                            class="layui-icon layui-icon-username" style="font-size: 50px; color: #FFFFFF;"></i>
                        <br>
                      公告：  ${counts.noticeCount}
                    </button>
                    <button class="layui-btn layui-btn-danger" style="width: 120px;height: 90px;"><i
                            class="layui-icon layui-icon-username" style="font-size: 50px; color: #1E9FFF;"></i>
                        <br>
                      文件数：  ${counts.uploadfileCount}
                    </button>
                </div>
            </div>
        <div class="layui-col-md6">
            <div class="layui-card">
                <div class="layui-card-header">公司简介</div>
                <div class="layui-card-body" style="overflow-style:">
                    <iframe src="weclome.jsp" width="99%" height="88%"></iframe>
                </div>
            </div>
        </div>
        </div>

    </div>

</div>


</div>
</div>

</body>

<!-- 注意：如果你直接复制所有代码到本地，上述 JS 路径需要改成你本地的 -->
<script>
    layui.use(['dropdown', 'util', 'layer'], function () {
        var element = layui.element;
        var layer = layui.layer;
        var active = {
            tabAdd: function (url, id, title) {
                //新增一个Tab项 传入三个参数，分别对应其标题，tab页面的地址，还有一个规定的id，是标签中data-id的属性值
                //关于tabAdd的方法所传入的参数可看layui的开发文档中基础方法部分
                element.tabAdd('demo', {
                    title: title,

                    content: '<iframe data-frameid="' + id
                        + '" scrolling="auto" frameborder="0" src="'
                        + url + '" style="width:100%;height: 730px;"></iframe>',
                    id: id
                    //规定好的id
                })
                element.render('tab');
            },
            tabChange: function (id) {
                //切换到指定Tab项
                element.tabChange('demo', id); //根据传入的id传入到指定的tab项
            },
            tabDelete: function (id) {
                element.tabDelete("demo", id);//删除
            },
            tabDeleteAll: function (ids) {//删除所有
                $.each(ids, function (i, item) {
                    element.tabDelete("demo", item); //ids是一个数组，里面存放了多个id，调用tabDelete方法分别删除
                })
            }
        };
        //当点击有site-demo-active属性的标签时，即左侧菜单栏中内容 ，触发点击事件
        $('.site-demo-active').on(
            'click',
            function () {
                var dataid = $(this);

                //这时会判断右侧.layui-tab-title属性下的有lay-id属性的li的数目，即已经打开的tab项数目
                if ($(".layui-tab-title li[lay-id]").length <= 0) {
                    //如果比零小，则直接打开新的tab项
                    active
                        .tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                } else {
                    //否则判断该tab项是否以及存在

                    var isData = false; //初始化一个标志，为false说明未打开该tab项 为true则说明已有
                    $.each($(".layui-tab-title li[lay-id]"),
                        function () {
                            //如果点击左侧菜单栏所传入的id 在右侧tab项中的lay-id属性可以找到，则说明该tab项已经打开
                            if ($(this).attr("lay-id") == dataid
                                .attr("data-id")) {
                                isData = true;
                            }
                        })
                    if (isData == false) {
                        //标志为false 新增一个tab项
                        active.tabAdd(dataid.attr("data-url"), dataid
                            .attr("data-id"), dataid
                            .attr("data-title"));
                    }
                }
                //最后不管是否新增tab，最后都转到要打开的选项页面上
                active.tabChange(dataid.attr("data-id"));
            });

        //头部事件
        util.event('lay-header-event', {
            //左侧菜单事件
            menuLeft: function(othis){
                layer.msg('展开左侧菜单的操作', {icon: 0});
            }
            ,menuRight: function(){
                layer.open({
                    type: 1
                    ,content: '<div style="padding: 15px;">处理右侧面板的操作</div>'
                    ,area: ['260px', '100%']
                    ,offset: 'rt' //右上角
                    ,anim: 5
                    ,shadeClose: true
                });
            }
        });


    });
</script>
</html>
