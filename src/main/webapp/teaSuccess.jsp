<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/22
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<meta http-equiv="refresh" content="3">--%>
<html>
    <head>
        <title>Title</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript" charset="utf-8" src="js/teacher/message.js" ></script>
        <script type="text/javascript" language="javascript" charset="utf-8" src="js/teacher/alter_information.js" ></script>
        <style>
            .list-group-item{
                background-color: lightgrey;
            }
            input[type="datetime-local"]:before{
                content:attr(placeholder);
            }
            input[type="datetime-local"].full:before{
                content:""!important;
            }
        </style>
    </head>
    <body>
        <%--导航条--%>
        <div style="" class="navbar navbar-default" style="margin-bottom: 0px">
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
                            <a href="#">${sessionScope.tea.tname}</a>
                        </li>
                        <li>
                            <a href="teaLogin.jsp">安全退出</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <%--//导航条--%>
        <%--正文--%>
        <div class="container">
            <%--左侧栏--%>
            <div align="center" class="list-group col-lg-2" style="margin-top: 10px;margin-bottom: 0px;margin-left: 20px" >
                <a href="#" class="list-group-item active">上传课件</a>
                <a href="#" class="list-group-item">修改信息</a>
                <a href="#" class="list-group-item">学生留言</a>
                <a href="#" class="list-group-item">我的文章</a>
                <a href="#" class="list-group-item">在线聊天</a>
                <a href="#" class="list-group-item">公告发布</a>
            </div>
                <%--左侧栏结束--%>

            <%--右侧功能--%>
            <div class="col-lg-8" style="margin-top: 10px">
                <%--上传课件--%>
                <div>
                    <form id="form"   enctype="multipart/form-data">
                        <input type="file" name="filename" />
                    </form>
                    <input id="upload_file" type="button" value="上传文件" />
                    <table class="table" style="margin-top: 15px">
                        <tr>
                            <td>文件名</td>
                            <td>上传日期</td>
                            <td>下载数</td>
                            <td>操作</td>
                        </tr>
                        <tbody id="Allfile">

                        </tbody>
                    </table>
                    <div style="display: inline-block;float:left; padding-top: 10px;">
                        <label style="color: darkgrey">
                            当前第
                            <span id="currentPage2">1</span> 页，共有
                            <span id="totlePageSize2">0</span>页，共
                            <span id="totleCount2">0</span>条
                        </label>
                    </div>
                    <nav aria-label="...">
                        <ul class="pager">
                            <li><a href="javascript:void(0);"onclick="js_previous2()">上一页</a></li>
                            <li><a href="javascript:void(0);"onclick="js_next2()">下一页</a></li>
                        </ul>
                    </nav>
                </div>
                    <%--上传课件结束--%>
<%------------------------------------------------------------------------------------------------------------%>
                <%--修改信息--%>
                <div>
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#home" aria-controls="home" role="tab"
                               data-toggle="tab">个人信息</a>
                        </li>
                        <li role="presentation">
                            <a href="#alter_password" aria-controls="profile" role="tab"
                               data-toggle="tab">修改密码</a>
                        </li>
                    </ul>
                    <div class="tab-content ">
                        <div role="tabpanel" class="tab-pane active col-lg-6" id="home" >
                            <table style="margin-top: 20px;margin-left: 30px;border-collapse: separate;border-spacing: 5px 10px;">
                                <tr>
                                    <th colspan="2" align="center">个人信息</th>
                                </tr>
                                <tr>
                                    <td>手机号：</td>
                                    <td><input class="form-control" id="tphone" type="text" value="${sessionScope.tea.tphone}"/></td>
                                </tr>
                                <tr>
                                    <td>性别：</td>
                                    <td><input class="form-control" id="tgender" type="text" value="${sessionScope.tea.tgender}"/></td>
                                </tr>
                                <tr>
                                    <td>年龄：</td>
                                    <td><input class="form-control" id="tage" type="text" value="${sessionScope.tea.tage}"/></td>
                                </tr>
                                <tr>
                                    <td>生日：</td>
                                    <td><input class="form-control" id="tbirth" type="date" value="${sessionScope.tea.tbirth}"/></td>
                                </tr>
                                <tr>
                                    <td>邮箱：</td>
                                    <td><input class="form-control" id="temail" type="email" value="${sessionScope.teaAdd.temail}"/></td>
                                </tr>
                                <tr>
                                    <td>地址：</td>
                                    <td><input class="form-control" id="taddress" type="text" value="${sessionScope.teaAdd.taddress}"/></td>
                                </tr>
                                <tr>
                                    <td>个人介绍：</td>
                                    <td><input class="form-control" id="tintro" type="text" value="${sessionScope.teaAdd.tintro}"></td>
                                </tr>
                                <tr>
                                    <td style="" colspan="2" align="center">
                                        <input  type="button" class="btn btn-info" id="alter_information2" value="修改信息"/>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div role="tabpanel" class="tab-pane col-lg-4"  id="alter_password">
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
                    <%--修改信息结束--%>
<%------------------------------------------------------------------------------------------------------------------%>
                <%--学生留言--%>
                <div>
                    <table  style="text-align: center; margin-top: 15px;" class="table" >
                        <tr>
                            <td>
                                学生姓名
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
                    <%--学生留言结束--%>
<%---------------------------------------------------------------------------------------------------------------%>
                <%--我的文章--%>
                <div>
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#record" aria-controls="home" role="tab"
                               data-toggle="tab">我的文章</a>
                        </li>
                    </ul>

                    <div class="tab-content ">
                        <div role="tabpanel" class="tab-pane active " id="record" >
                            <a href="tea_write_article.jsp" style="margin-top: 20px" class="btn btn-primary" >写文章</a>
                            <table  style="text-align: center; margin-top: 15px;" class="table" >
                                <tr>
                                    <td>
                                        标题
                                    </td>
                                    <td>
                                        文章作者
                                    </td>
                                    <td>
                                        上传日期
                                    </td>
                                    <td>
                                        赞
                                    </td>
                                    <td>
                                        踩
                                    </td>
                                    <td>
                                        收藏
                                    </td>
                                    <%--<td>--%>
                                        <%--浏览--%>
                                    <%--</td>--%>
                                    <td>
                                        操作
                                    </td>
                                </tr>
                                <tbody id="show_article">
                                </tbody>
                            </table>
                            <div style="display: inline-block;float:left; padding-top: 10px;">
                                <label style="color: darkgrey">
                                    当前第
                                    <span id="currentPage3">1</span> 页，共有
                                    <span id="totlePageSize3">0</span>页，共
                                    <span id="totleCount3">0</span>条
                                </label>
                            </div>
                            <nav aria-label="...">
                                <ul class="pager">
                                    <li><a href="javascript:void(0);"onclick="js_previous3()">上一页</a></li>
                                    <li><a href="javascript:void(0);"onclick="js_next3()">下一页</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
                    <%--我的文章结束--%>
<%-------------------------------------------------------------------------------------------------------------%>
                <%--在线聊天--%>
                <div>
                    <%--<div>--%>
                        <%--<input type="datetime-local" step="01" name="user_date" />--%>
                    <%--</div>--%>
                    <div style="margin-top: 10px">
                        <%--<div style="width: 600px; height: 240px; overflow-y: auto; border: 1px solid #333;" id="show"></div>--%>
                        <%--<br />--%>
                        <%--<input type="text" size="80" id="msg" name="msg" placeholder="输入聊天内容" />--%>
                        <%--<input type="button" value="发送" id="sendBn" name="sendBn" />--%>
                        <div class="create">
                            <label>房间名</label>
                            <input id="input_roomName" size="10" maxlength="10">
                            <input type="button"  value="创建聊天室" onclick="initWebSocket()" />
                        </div>
                        <div class="chatRoom" style="display: none;">
                            <label class="roomName"></label>
                            <input type="button" style="margin-left: 400px;" value="解散聊天室" onclick="closeWs()" /><br>
                            <%--<div class="msg_board"></div>--%>
                            <div style="margin-top: 10px;width: 600px; height: 240px; overflow-y: auto; border: 1px solid #333;" class="msg_board"></div>
                            <input style="margin-top: 10px;" id="input_msg" size="73" maxlength="40">
                            <input type="button" value="发送" onclick="send_msg()" />
                        </div>
                    </div>
                </div>
                    <%--在线聊天结束--%>
<%------------------------------------------------------------------------------------------------------------------%>
                <%--公告发布--%>
                <div>
                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active">
                            <a href="#myAnnouce" aria-controls="myAnnouce" role="tab"
                               data-toggle="tab">我的公告</a>
                        </li>
                        <li role="presentation">
                            <a href="#wAnnouce" aria-controls="wAnnouce" role="tab"
                               data-toggle="tab">写公告</a>
                        </li>
                    </ul>
                    <div class="tab-content ">
                        <%--我的公告--%>
                        <div role="tabpanel" class="tab-pane active" id="myAnnouce" >
                            <table class="table" style="margin-top: 10px">
                                <tr>
                                    <td>发布内容</td>
                                    <td>发布日期</td>
                                    <td>处理状态</td>
                                    <td>发布状态</td>
                                    <td>操作</td>
                                </tr>
                                <tbody id="announcement">
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
                        <%--我的公告结束--%>
                        <%--发布--%>
                        <div role="tabpanel" class="tab-pane col-lg-6" id="wAnnouce" >
                            <textarea id="annouceContent" style="width: 700px;height: 200px;margin-top: 10px"></textarea>
                            <input id="fabu" class="btn-primary" style="margin-top: 10px;margin-left: 660px" type="button" value="发布" />
                        </div>
                        <%--发布结束--%>
                    </div>
                </div>
                    <%--/公告发布--%>
<%----------------------------------------------------------------------------------------------------------------------%>
            </div>
                <%--右侧功能结束--%>

        </div>
<%----------------------------------------------------------------------------------------------------------------%>
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
            <%--/回复模态框结束--%>
        <%--//正文--%>
    </body>
    <script type="text/javascript">
        var tno = ${sessionScope.tea.tno};
        var ssname = "${sessionScope.tea.tname}";
// =============================================================================================================
//         左右侧
        $(function() {
            $(".col-lg-8").children("div:gt(0)").hide();
            $(".col-lg-2").find("a").attr("href", "javascript:void(0);").click(function () {
                $(".col-lg-2").find(".active").removeClass("active");
                $(this).addClass("active");
                var index = $(this).index();
                $(".col-lg-8").children("div").hide();
                $(".col-lg-8").children("div").eq(index).show();
            });
        })
// ===========================================================================================================
        //回复显示
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
            //回复显示结束
// =============================================================================================================
        //回复留言
        $(function () {
            $("#reply").click(function () {
                var slm_id = $(".slm_id").html();
                var tlm_content = $("#textarea").val();
                var datas = {
                    sleaveMessageId : slm_id,
                    tlmContent : tlm_content,
                    tno : tno
                };
                $.ajax({
                    url : "TleaveMessageController/insert",
                    data:datas,
                    type : "post",
                    dataType : "json",
                    success:function(data) {
                        if(data.code == 1){
                            alert("回复成功");
                            lookContent(slm_id);
                        }

                    }
                })
            })
        })
            //回复留言结束
// =============================================================================================================
        // 文件管理
        $(function () {

            $("#upload_file").click(function () {
                <%
                    application.setAttribute("tea",session.getAttribute("tea"));
                %>
                var formData = new FormData($("#form")[0]);
                $.ajax({
                    url:"TeaFileController/insert",
                    type:"post",
                    data:formData,
                    cache: false,
                    processData: false,
                    contentType: false,
                    dataType:"json",
                    success:function (data) {
                        if(data.code == 1){
                            alert("上传成功!");
                            var datas={
                                currentPage:1,
                                pageSize : pageSize,
                                id:tno
                            };
                            showFile(datas,url);
                        }
                        else {
                            alert("上传失败!");
                        }
                    }
                })
            })


        })
            //文件管理结束

    </script>
    <script type="text/javascript" language="javascript" charset="utf-8" src="js/teacher/tea_file.js" ></script>
    <script type="text/javascript" language="javascript" charset="utf-8" src="js/teacher/article.js" ></script>
    <script type="text/javascript" language="javascript" charset="utf-8" src="js/teacher/chat2.js" ></script>
    <script type="text/javascript" language="javascript" charset="utf-8" src="js/teacher/announce.js" ></script>
</html>
