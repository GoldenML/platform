<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/22
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">
<html>
    <head>
        <title>Title</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <style>
            .navbar{
                background-color: white;
                color: yellow;
            }
        </style>
    </head>
    <body>
    <%--导航条--%>
        <div class="navbar navbar-default" style="margin-bottom: 0px">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">TIPlatform</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">${sessionScope.nickname}</a>
                        </li>
                        <li>
                            <a href="index.jsp">安全退出</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="container" style="margin-top: 10px">
                <div align="center" class="list-group col-lg-2" style="margin-top: 10px;margin-bottom: 0px;margin-left: 20px" >
                    <a href="#" class="list-group-item active">教师管理</a>
                    <a href="#" class="list-group-item">公告管理<span class="badge"></span></a>
                    <%--<a href="#" class="list-group-item">学生留言</a>--%>
                    <%--<a href="#" class="list-group-item">我的文章</a>--%>
                    <%--<a href="#" class="list-group-item">在线聊天</a>--%>
                    <%--<a href="#" class="list-group-item">公告发布</a>--%>
                </div>
                <div  class="col-lg-8" style="margin-top: 10px">
                    <%--教师管理--%>
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#home" aria-controls="home" role="tab" data-toggle="tab">信息展示</a>
                            </li>
                            <li role="presentation">
                                <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">添加教师</a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <select style="margin-top: 10px;display: none;" id="selectTea">
                                    <option value="0">大学老师</option>
                                    <option value="1">高中老师</option>
                                    <option value="2">初中老师</option>
                                    <option value="3">小学老师</option>
                                </select>
                                <br /><br />
                                <table class="table">
                                    <tr>
                                        <th>教师号</th>
                                        <th>姓名</th>
                                        <th>手机号</th>
                                        <th>邮箱</th>
                                        <th>家庭地址</th>
                                        <th>操作</th>
                                    </tr>
                                    <tbody id="showTeacher">
                                    </tbody>
                                </table>
                                <div style="display: inline-block;float:left; padding-top: 10px;">
                                    <label style="color: darkgrey">
                                        当前第
                                        <span id="teaCurrentPage">1</span> 页，共有
                                        <span id="teaTotlePageSize">0</span>页，共
                                        <span id="teaTotleCount">0</span>条
                                    </label>
                                </div>
                                <nav aria-label="...">
                                    <ul class="pager">
                                        <li><a href="javascript:void(0);" onclick="tea_previous()">上一页</a></li>
                                        <li><a href="javascript:void(0);" onclick="tea_next()">下一页</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div role="tabpanel" class="tab-pane col-lg-6" id="profile">
                                <table style="margin-top: 30px;margin-left: 30px;border-collapse: separate;border-spacing: 5px 10px;">
                                    <tr >
                                        <td><label>姓名：</label></td>
                                        <td>
                                            <div>
                                                <input class="form-control" id="tname" type="text"/>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr >
                                        <td>
                                            <label>手机号：</label>
                                        </td>
                                        <td>
                                            <div>
                                                <input type="text" id="tphone" class="form-control" onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/>
                                            </div>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label>家庭地址：</label>
                                        </td>
                                        <td>
                                            <div>
                                                <input type="text" id="taddress" class="form-control"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>邮箱：</label>
                                        </td>
                                        <td>
                                            <div>
                                                <input type="email" id="temail" class="form-control"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>所属学院：</label>
                                        </td>
                                        <td>
                                            <select id="getAca" class="form-control">
                                                <option value = 0>所有学院</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>所属专业：</label>
                                        </td>
                                        <td>
                                            <select id="getMajor" class="form-control">
                                                <option value=0>所有专业</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr align="center" >
                                        <td colspan="2">
                                            <input class="btn btn-primary" id="addTeacher" type="button" value="添加教师"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                        <%--教师管理结束--%>
                    <%--公告管理--%>
                    <div>
                        <select id="selectStatus">
                            <option value = 0>未处理</option>
                            <option value = 1>已处理</option>
                        </select>
                        <div style="margin-top: 10px">
                            <table class="table">
                                <tr>
                                    <td>教师号</td>
                                    <td>姓名</td>
                                    <td>公告内容</td>
                                    <td>发布日期</td>
                                    <td>处理状态</td>
                                    <td>操作</td>
                                </tr>
                                <tbody id="announce" style="">
                                </tbody>
                            </table>
                            <div style="display: inline-block;float:left; padding-top: 10px;">
                                <label style="color: darkgrey">
                                    当前第
                                    <span id="announceCurrentPage">1</span> 页，共有
                                    <span id="announceTotlePageSize">0</span>页，共
                                    <span id="announceTotleCount">0</span>条
                                </label>
                            </div>
                            <nav aria-label="...">
                                <ul class="pager">
                                    <li><a href="javascript:void(0);" onclick="announce_previous()">上一页</a></li>
                                    <li><a href="javascript:void(0);" onclick="announce_next()">下一页</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <%--公告管理结束--%>
                </div>
            </div>
        </div>
    <%--//正文--%>
    </body>
    <script>
        $(".col-lg-8").children("div:gt(0)").hide();
        $(".col-lg-2").find("a").attr("href", "javascript:void(0);").click(function () {
            $(".col-lg-2").find(".active").removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $(".col-lg-8").children("div").hide();
            $(".col-lg-8").children("div").eq(index).show();
        });

        $(function(){
            $.ajax({
                type:"get",
                url:"AcaController/findAllAca",
                dataType:"json",
                success:function(data){
                    for(var i=0;i<data.length;i++){
                        var iteam=data[i];
                        $("#getAca").each(function(){
                            $(this).append("<option value='"+iteam.id+"'>"+iteam.name+"</option>");
                        });
                    }
                }
            });
        });

        $("#getAca:eq(0)").change(function(){
            var aca_id = $(this).val();
            var datas={
                aca_id:aca_id
            };
            $.ajax({
                url:"MajorController/findAllMajor",
                type:"get",
                data:datas,
                dataType:"json",
                success:function(data){
                    $("#getMajor").empty();
                    $("#getMajor").append("<option value='-1'> 请选择</option>");
                    console.log(data.length);
                    for(var i=0;i<data.length;i++){
                        var iteam=data[i];
                        $("#getMajor").append("<option value="+iteam.id+">  "+iteam.name+" </option>");
                    }
                }
            })
        })

        $(function () {
            $("#addTeacher").click(function () {
                var tname = $("#tname").val();
                var tphone = $("#tphone").val();
                var taddress = $("#taddress").val();
                var temail = $("#temail").val();
                var major_id = $("#getMajor").val();
                var datas = {
                    tname: tname,
                    tphone: tphone,
                    taddress: taddress,
                    temail: temail,
                    major_id: major_id
                };

                $.ajax({
                    type: "post",
                    url: "SysController/addTeacher",
                    data: datas,
                    dataType: "json",
                    success: function (data) {
                        if (data.code == 1) {
                            alert("添加成功");
                        }
                    }
                })
            })
        })



    </script>
    <script type="text/javascript" language="javascript" src="js/admin/teaShow.js" ></script>
    <script type="text/javascript" language="javascript" src="js/admin/announce.js" ></script>
</html>
