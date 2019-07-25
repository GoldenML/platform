<%@ page import="com.yao.ssm.po.Stu" %><%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/15
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="index.jsp" language="java" %>
<html>
    <head>
        <title>个人中心</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" charset="utf-8" src="js/student/get_aca_major_tea.js"></script>
        <script type="text/javascript" language="javascript" charset="utf-8" src="js/student/get_aca_major_tea2.js"></script>

        <script type="text/javascript" language="javascript" src="js/student/alter_password.js"  ></script>
        <script type="text/javascript" language="javascript" src="js/student/head.js"  ></script>
        <style>

        </style>
    </head>
    <body>
        <div class="navbar navbar-default">

            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="stu_index.jsp">TIPlatform</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#">${sessionScope.stu.sname}</a>
                        </li>
                        <li>
                            <a href="index.jsp">安全退出</a>
                        </li>

                    </ul>
                </div>
            </div>

        </div>

        <div class="container">
            <div class="col-lg-2 col-md-2">
                <div class="list-group " align="center">
                    <a href="#" class="list-group-item active">
                        个人空间
                    </a>
                    <a href="#" class="list-group-item">在线聊天</a>
                    <%--<a href="#" class="list-group-item">我的文件</a>--%>
                    <a href="#" class="list-group-item">我的留言</a>
                    <a href="#" class="list-group-item">我的收藏</a>
                    <%--<a href="#" class="list-group-item">学术讨论</a>--%>
                </div>
            </div>
            <div class="col-lg-10 col-md-10" >
                <%--个人空间--%>
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#home" aria-controls="home" role="tab"
                                   data-toggle="tab">个人信息</a>
                            </li>
                            <li role="presentation">
                                <a href="#profile" aria-controls="profile" role="tab"
                                   data-toggle="tab">修改密码</a>
                            </li>
                        </ul>
                        <div class="tab-content ">
                            <div role="tabpanel" class="tab-pane active col-lg-4" id="home" >
                                <table style="margin-top: 20px;margin-left: 30px;border-collapse: separate;border-spacing: 5px 10px;">
                                    <tr>
                                        <th colspan="2" align="center">个人信息</th>
                                    </tr>
                                    <tr>
                                        <td>姓名：</td>
                                        <td><input class="form-control" id="sname" type="text" value="${sessionScope.stu.sname}"/></td>
                                    </tr>
                                    <tr>
                                        <td>手机号：</td>
                                        <td><input class="form-control" id="sphone" type="text" value="${sessionScope.stu.sphone}"/></td>
                                    </tr>
                                    <tr>
                                        <td>性别：</td>
                                        <td><input class="form-control" id="sgender" type="text" value="${sessionScope.stu.sgender}"/></td>
                                    </tr>
                                    <tr>
                                        <td>年龄：</td>
                                        <td><input class="form-control" id="sage" type="text" value="${sessionScope.stu.sage}"/></td>
                                    </tr>
                                    <tr>
                                        <td>生日：</td>
                                        <td><input class="form-control" id="sbirth" type="date" value="${sessionScope.stu.sbirth}"/></td>
                                    </tr>
                                    <tr>
                                        <td>邮箱：</td>
                                        <td><input class="form-control" id="semail" type="email" value="${sessionScope.stuAdd.semail}"/></td>
                                    </tr>
                                    <tr>
                                        <td>地址：</td>
                                        <td><input class="form-control" id="saddress" type="text" value="${sessionScope.stuAdd.saddress}"/></td>
                                    </tr>
                                    <tr>
                                        <td>个人介绍：</td>
                                        <td><input class="form-control" id="sintro" type="text" value="${sessionScope.stuAdd.sintro}"></td>
                                    </tr>
                                    <tr>
                                        <td style="" colspan="2" align="center">
                                            <input  type="button" class="btn btn-info" id="alter_information" value="修改信息"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div role="tabpanel" class="tab-pane col-lg-4"  id="profile">
                                <form >
                                    <div>原密码：</div>
                                    <div><input class="form-control" type="password" id="old_passwd" name="old_passwd"/></div>
                                    <div>新密码：</div>
                                    <div><input class="form-control" type="password" id="new_passwd" name="new_passwd"/></div>
                                    <div>再输入一次：</div>
                                    <div><input class="form-control" type="password" id="repeat_passwd" name="repeat_passwd"/></div>
                                    <br />
                                    <div><input type="button" class="btn btn-info" id="alter" value="修改"/></div>
                                </form>
                            </div>
                        </div>
                    </div>
                <%--/个人空间--%>
                <%--我的聊天--%>
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#chat" aria-controls="home" role="tab"
                                   data-toggle="tab">我的聊天</a>
                            </li>
                            <%--<li role="presentation">--%>
                                <%--<a href="#chatRecord" id="judge" aria-controls="profile" role="tab"--%>
                                   <%--data-toggle="tab">聊天记录</a>--%>
                            <%--</li>--%>
                        </ul>
                        <div class="tab-content ">
                            <div role="tabpanel" class="tab-pane active " id="chat" >
                                <div class="create" style="display: block">
                                    <table style="margin-top: 20px;margin-left: 30px;border-collapse: separate;border-spacing: 5px 10px;">
                                        <tr>
                                            <td><label>选择学院：</label></td>
                                            <td>
                                                <select id="getAca2" class="form-control">
                                                    <option value = 0>请选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>所属专业：</label>
                                            </td>
                                            <td>
                                                <select id="getMajor2" class="form-control">
                                                    <option value=0>请选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>选择老师：</label>
                                            </td>
                                            <td>
                                                <select id="getTeacher2" class="form-control">
                                                    <option value=0>请选择</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><button class="btn btn-primary"  onclick="initWebSocket($('#getTeacher2').val())">确定</button></td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="chatRoom" style="display: none;">
                                    <label class="roomName"></label>
                                    <input type="button" style="margin-left: 400px;" value="退出聊天室" onclick="closeWs()" /><br>
                                    <%--<div class="msg_board"></div>--%>
                                    <div style="margin-top: 10px;width: 600px; height: 240px; overflow-y: auto; border: 1px solid #333;" class="msg_board"></div>
                                    <input style="margin-top: 10px;" id="input_msg" size="73" maxlength="40">
                                    <input type="button" value="发送" onclick="send_msg()" />
                                </div>
                            </div>

                            <%--<div role="tabpanel" class="tab-pane "  id="chatRecord" style="margin-top: 10px">--%>
                                <%--<script>--%>
                                    <%--$("#judge").click(function () {--%>
                                        <%--var ccc = document.getElementById("chatK").className;--%>
                                        <%--if (ccc == "ccc"){--%>

                                        <%--}else{--%>
                                            <%--alert("请先选择老师！");--%>
                                        <%--}--%>
                                    <%--})--%>
                                <%--</script>--%>
                            <%--</div>--%>
                        </div>
                    </div>
                <%--/我的聊天--%>
                <%--我的文件--%>
                    <%--<div>--%>
                        <%--<input type="file" value="上传文件">--%>
                    <%--</div>--%>
                <%--/我的文件--%>
                <%--我的留言--%>
                    <div>
                        <ul class="nav nav-tabs" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#record" aria-controls="home" role="tab"
                                   data-toggle="tab">留言记录</a>
                            </li>
                            <li role="presentation">
                                <a href="#mymessage" aria-controls="profile" role="tab"
                                   data-toggle="tab">我要留言</a>
                            </li>
                        </ul>
                        <div class="tab-content ">
                            <div role="tabpanel" class="tab-pane active " id="record" >
                                <table  style="text-align: center; margin-top: 15px;" class="table" >
                                    <tr>
                                        <td>
                                            老师姓名
                                        </td>
                                        <td>
                                            留言内容
                                        </td>
                                        <td>
                                            留言日期
                                        </td>
                                        <td>
                                            未回复/已回复
                                        </td>
                                        <td>
                                            操作
                                        </td>
                                    </tr>
                                    <tbody id="insert_mes">
                                    </tbody>
                                </table>
                                <div style="display: inline-block;float:left; padding-top: 10px;">
                                    <label style="color: darkgrey">
                                        当前第
                                        <span id="currentPage">1</span> 页，共有
                                        <span id="totlePageSize">0</span>页，共
                                        <span id="totleCount">0</span>条
                                    </label>
                                </div>
                                <nav aria-label="...">
                                    <ul class="pager">
                                        <li><a href="javascript:void(0);"onclick="js_previous()">上一页</a></li>
                                        <li><a href="javascript:void(0);"onclick="js_next()">下一页</a></li>
                                    </ul>
                                </nav>
                            </div>
                            <div role="tabpanel" class="tab-pane "  id="mymessage" style="margin-top: 10px">
                                <table style="margin-top: 20px;margin-left: 30px;border-collapse: separate;border-spacing: 5px 10px;">
                                    <tr>
                                        <td><label>选择学院：</label></td>
                                        <td>
                                            <select id="getAca" class="form-control">
                                                <option value = 0>请选择</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>所属专业：</label>
                                        </td>
                                        <td>
                                            <select id="getMajor" class="form-control">
                                                <option value=0>请选择</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>选择老师：</label>
                                        </td>
                                        <td>
                                            <select id="getTeacher" class="form-control">
                                                <option value=0>请选择</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>
                                <textarea id="content" class="col-lg-12" style="height: 200px;margin-top: 10px" ></textarea>
                                <input id="slm" class="btn btn-info" style="float:right;margin-top: 10px" type="button" value="留言">
                            </div>
                        </div>
                    </div>
                <%--/我的留言--%>
                <%--我的收藏--%>
                    <div>
                        <table class="table">
                            <tr>
                                <td>文件名</td>
                                <td>老师</td>
                                <td>上传日期</td>
                                <td>操作</td>
                            </tr>
                            <tbody id="lookCollect">
                            </tbody>
                        </table>
                        <div style="display: inline-block;float:left; padding-top: 10px;">
                            <label style="color: darkgrey">
                                当前第
                                <span id="colCurrentPage">1</span> 页，共有
                                <span id="colTotlePageSize">0</span>页，共
                                <span id="colTotleCount">0</span>条
                            </label>
                        </div>
                        <nav id="page" aria-label="...">
                            <ul class="pager">
                                <li><a href="javascript:void(0);"onclick="col_previous()">上一页</a></li>
                                <li><a href="javascript:void(0);"onclick="col_next()">下一页</a></li>
                            </ul>
                        </nav>
                    </div>
                <%--/我的收藏--%>
            </div>
        </div>
        <p style="display: none;" class="teaName"></p>
        <%--回复模态框--%>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">留言板</h4>
                    </div>
                    <div class="modal-body">
                        <div id="box">
                            <p class="stuName" />
                            <div>
                                <span class = "myContent" />
                            </div>
                        </div>
                        <div>
                            <a  style="float:right;" href="javascript:void(0)" onclick="showTextarea()" >回复</a>
                            <br />
                            <textarea  id="textarea" class="hide form-control" style="display: none;"></textarea>
                            <br />
                            <input id="reply" style="display: none;" type="button" value="回复">
                        </div>

                        <%--<div>--%>
                            <%--<textarea style="dislay: none;"/>--%>
                        <%--</div>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <%--<button type="button" class="btn btn-primary"></button>--%>
                    </div>
                </div>
            </div>
        </div>
        <p style="display: none;" class="slm_id">
        <%--/回复模态框--%>
    </body>
    <script>
        var sno = ${sessionScope.stu.sno};
        var ssname = "${sessionScope.stu.sname}";
        $(".col-lg-10").children("div:gt(0)").hide();
        $(".col-lg-2").find("a").attr("href", "javascript:void(0);").click(function () {
            $(".col-lg-2").find(".active").removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $(".col-lg-10").children("div").hide();
            $(".col-lg-10").children("div").eq(index).show();
        });
        function showTextarea() {
            var className = document.getElementById("textarea").className;
            if(className == "hide form-control"){
                $("#textarea").show();
                document.getElementById("textarea").className = "appear form-control";
                $("#reply").show();
            }
            else{
                $("#textarea").hide();
                document.getElementById("textarea").className = "hide form-control";
                $("#reply").hide();
            }
        }
        //回复消息
        $(function () {
            $("#reply").click(function () {
                var slm_id = $(".slm_id").html();
                var slm_content = $("#textarea").val();
                var datas = {
                    id : slm_id,
                    slm_content : slm_content,
                    sno : sno
                };
                $.ajax({
                    url : "SleaveMessageController/insert",
                    data:datas,
                    type : "post",
                    dataType : "json",
                    success:function (data) {
                        if(data.code == 1){
                            alert("回复成功");
                            lookContent(slm_id);
                        }
                    }
                })
            })
        })
        //收藏消息
        {
            var pageSize = 10;
            var datas = {
                sno: sno,
                currentPage: 1,
                pageSize: pageSize
            };
            var url = "ArticleController/findBySno";
            showCol(url, datas);

            function showCol(url, datas) {
                $.ajax({
                    url: url,
                    type: "post",
                    data: datas,
                    dataType: "json",
                    success: function (data) {
                        $("#lookCollect").empty();
                        var currentPage = data.currentPage;
                        var totlePageSize = data.totlePageSize;
                        var count = data.count;
                        var datas = data.list;
                        $("#colCurrentPage").html(currentPage);
                        $("#colTotlePageSize").html(totlePageSize);
                        $("#colTotleCount").html(count);

                        for (var i = 0; i < datas.length; i++) {
                            var rowdata = datas[i];
                            $("#lookCollect").append("	<tr>" +
                                "<td>" +"<a href='stu_lookArticle.jsp?id="+rowdata.id+"'>"+rowdata.title+"</a>"+ "</td>" +
                                "<td>" + rowdata.tname + "</td>" +
                                "<td>" + rowdata.uploadDate + "</td>" +
                                "<td>" + "<a href='javascript:void(0)' onclick='cancelCol(" + rowdata.id + ")'>" + "取消收藏" + "</a>" + "</td>" +
                                "</tr>");
                        }
                    }
                })
            }

            function cancelCol(id) {
                var datass = {
                    sno: sno,
                    article_id: id,
                }
                $.ajax({
                    url: "ArticleController/cancelCol",
                    type: "post",
                    data: datass,
                    dataType: "json",
                    success: function (data) {
                        if (data.code == 1) {
                            alert("取消成功！");
                            showCol(url, datas);
                        }
                    }
                })
            }
        }

        function col_previous() {
            var currentPage = $("#colCurrentPage").html();
            if(currentPage == 1){
                alert("已经是第一页");
            }else{
                currentPage = parseInt(currentPage) - 1;
                var datas={
                    sno:sno,
                    currentPage:currentPage,
                    pageSize : pageSize
                };
                showCol(url,datas);

            }
        }
        function col_next() {
            var currentPage = $("#colCurrentPage").html();
            var totlePageSize = $("#colTotlePageSize").html();
            if(currentPage == totlePageSize){
                alert("已经是最后一页");
            }else{
                currentPage = parseInt(currentPage) + 1;
                var datas={
                    sno:sno,
                    currentPage:currentPage,
                    pageSize : pageSize
                };
                showCol(url,datas);
            }
        }
    </script>
    <script type="text/javascript" language="javascript" src="js/student/message.js"  ></script>
    <script type="text/javascript" language="javascript" charset="utf-8" src="js/student/chat2.js"></script>
</html>
