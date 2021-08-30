<%--
  Created by IntelliJ IDEA.
  User: 14069
  Date: 2021/5/31
  Time: 下午 04:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>管理系统</title>
  </head>
  <link rel="stylesheet" href="./layui/css/layui.css">
  <script src="./js/jquery.min.js"></script>
  <script src="./layui/layui.js"></script>
  <body>
  <div class="layui-layout layui-layout-admin  layui-bg-cyan ">
    <div class="layui-header  layui-bg-cyan ">
      <div class="layui-logo layui-hide-xs layui-bg-cyan"style="font-weight: bold;font-style: italic">人力资源管理系统 </div>
      <!-- 头部区域（可配合layui 已有的水平导航） -->
      <div  style="padding-left: 200px;position:fixed; padding-top: 8px"><img src="./imgs/log1.png" style="width: 40px" >  <i class="layui-icon layui-icon-time" style="font-size: 15px; color: red;padding-left: 340px;padding-top: 30px" ></i></div>
      <div style="text-align: center;padding-top: 15px"><li id="timeText"></li></div>
      <ul class="layui-nav layui-layout-right ">
        <li class="layui-nav-item layui-hide layui-show-md-inline-block">
          <a href="javascript:;">
            <img src="./imgs/test.jpg" class="layui-nav-img">
            ${user.username},你好
            <dl class="layui-nav-child">
              <dd><a href="javascript:" lay-header-event="information" lay-unselect>基本信息</a></dd>
              <dd><a href="javascript:" lay-header-event="updatePassword" lay-unselect>修改密码</a></dd>
              <dd><a href="${pageContext.request.contextPath}/logout">退出</a></dd>
            </dl>
          </a>
        </li>

        <li class="layui-nav-item  " lay-header-event="menuRight" lay-unselect>
          <a href="javascript:;">
            <i class="layui-icon layui-icon-more-vertical"></i>
          </a>
        </li>
      </ul>
    </div>


    <div class="layui-side layui-bg-black">
      <div class="layui-side-scroll">
        <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-username" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;用户管理</a>
            <dl class="layui-nav-child">
             <dd style="text-align: center"><a href="javascript:;"
                                               data-url="UserView"
                                               data-id="selectUser"
                                               data-title="查询用户"
                                               class="site-demo-active"
             ><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;查询用户</a></dd>
              <dd style="text-align: center"><a href="javascript:;"
                                                data-url="AddUser"
                                                data-id="addUser"
                                                data-title="添加用户"
                                                class="site-demo-active"
              ><i class="layui-icon layui-icon-add-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;添加用户</a></dd>

            </dl>
          </li>
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-group" style="font-size: 13px; color: #1E9FFF;"></i>&nbsp;部门管理</a>
            <dl class="layui-nav-child">
              <dd style="text-align: center"><a href="javascript:;"
                                                data-url="selectDept"
                                                data-id="selectDept"
                                                data-title="查询部门"
                                                class="site-demo-active"
              ><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;部门查询</a></dd>
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-add-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;添加部门</a></dd>

            </dl>
          </li>
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-template" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;职位管理</a>
            <dl class="layui-nav-child">
              <dd style="text-align: center"><a href="javascript:;"
                                                data-url="JobView"
                                                data-id="selectjob"
                                                data-title="职位查询"
                                                class="site-demo-active"
              ><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;职位查询</a></dd>
              <dd style="text-align: center"><a href="javascript:;"
                                                   data-url="AddJob"
                                                   data-id="addJob"
                                                   data-title="添加职位"
                                                   class="site-demo-active"
            ><i class="layui-icon layui-icon-add-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;添加职位</a></dd>

            </dl>
          </li>
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-form" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;员工管理</a>
            <dl class="layui-nav-child">
              <dd style="text-align: center"><a href="javascript:;"
                                                data-url="selectEmployee"
                                                data-id="selectEmpolyee"
                                                data-title="查询员工"
                                                class="site-demo-active"
              ><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;员工查询</a></dd>
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-add-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;添加员工</a></dd>

            </dl>
          </li>
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-table" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;角色管理</a>
            <dl class="layui-nav-child">
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;角色查询</a></dd>
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-add-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;添加角色</a></dd>

            </dl>
          </li>
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-chart-screen" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;部门管理</a>
            <dl class="layui-nav-child">
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;部门查询</a></dd>
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-add-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;添加部门</a></dd>

            </dl>
          </li>
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-notice" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;公告管理</a>
            <dl class="layui-nav-child">
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;公告查询</a></dd>
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-add-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;添加公告</a></dd>

            </dl>
          </li>
          <li class="layui-nav-item ">
            <a class="" href="javascript:;"><i class="layui-icon layui-icon-link" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;下载中心</a>
            <dl class="layui-nav-child">
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-download-circle" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;文件下载</a></dd>
              <dd style="text-align: center"><a href="javascript:;"><i class="layui-icon layui-icon-search" style="font-size: 15px; color: #1E9FFF;"></i>&nbsp;文件查询</a></dd>

            </dl>
          </li>
        </ul>
      </div>
    </div>

    <div class="layui-body">
      <!-- 内容主体区域 -->
      <div class="layui-tab layui-tab-card" lay-filter="demo" lay-allowclose="true" style="color:#000;">
        <ul class="layui-tab-title">
          <li class="layui-this" style="color: black">首页欢迎</li>

        </ul>
        <div class="layui-tab-content" style="">
          <div class="layui-tab-item layui-show" style="color: #00FFFF">
           <iframe src="welcom1.jsp" style="width: 99%;height: 550px"></iframe>
          </div>


        </div>
      </div>


    </div>

    <div class="layui-footer">
      <!-- 底部固定区域 -->

    </div>
  </div>

  <script>
    $(function (){
    var mytime=setInterval(function (){
      gettime();
    },1000);
    });
    function gettime(){
      var data =new Date();
      var y = data.getFullYear();
      var m= (data.getMonth()+1)<10?"0"+(data.getMonth()+1):(data.getMonth()+1);
      var d = (data.getDate())<10?"0"+data.getDay():data.getDate();
      var H= (data.getHours())<10?"0"+data.getHours():data.getHours();
      var min=(data.getMinutes())<10?"0"+data.getMinutes():data.getMinutes();
      var s = (data.getSeconds())<10?"0"+data.getSeconds():data.getSeconds();

      var times  = y+"年 "+m+"月 "+d+"日 "+H+":"+min+":"+s+"  星期"+"天一二三四五六".charAt(data.getDay());
      $("#timeText").html(times);

    }


    //JS
    layui.use(['element', 'layer', 'util','jquery'], function(){
      var element = layui.element
              , layer = layui.layer
              , util = layui.util
              , $ = layui.jquery;
      //头部事件
      util.event('lay-header-event', {
        //左侧菜单事件
        menuLeft: function (othis) {
          layer.msg('展开左侧菜单的操作', {icon: 0});
        }
        , menuRight: function () {
          layer.open({
            type: 1,
            title: " <img src='imgs/log1.jpg' alt='' style='height: 40px;width: 60px'>华广简介"
            , content: '<iframe src="welcom1.jsp" width="240px" height="100%"></iframe>'
            , area: ['260px', '100%']
            , offset: 'rt' //右上角
            , anim: 1
            , shadeClose: true
          });
        },

      });

      //触发事件
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
        }, updatePassword:function (){
          layer.open({
            type: 2
            ,title:'修改密码'
            ,content: 'updatepassword'
            ,offset: [
                ($(window).height()-700)
                ,($(window).width()-900)]
                ,area: ['500px','500px']
            ,anim: 5
            ,shadeClose: true
          });
      },information:function (){
          layer.open({
            type: 2
            ,title:'基础信息'
            ,content: 'Myinformation'
            ,offset: [
              ($(window).height()-700)
              ,($(window).width()-900)]
            ,area: ['500px','500px']
            ,anim: 5
            ,shadeClose: true
          });
        }
      });
    });

  </script>

  </body>
</html>
