<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/15
  Time: 21:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>登录</title>
        <link type="text/css" rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="../js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                    <a class="navbar-brand" href="#">TIPlatform</a>
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
                    <a href="#" class="list-group-item">讨论小组</a>
                    <a href="#" class="list-group-item">我的文件</a>
                    <a href="#" class="list-group-item">我的留言</a>
                    <a href="#" class="list-group-item">我的收藏</a>
                    <a href="#" class="list-group-item">学术讨论</a>
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
                                <table >
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
                                        <td align="center">
                                            <input type="button" id="alter_information" value="修改信息"/>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <div role="tabpanel" class="tab-pane col-lg-4"  id="profile">
                                <form>
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
                <%--讨论小组--%>
                    <div>

                    </div>
                <%--/讨论小组--%>
                <%--我的文件--%>
                    <div>
                        <input type="file" value="上传文件">
                    </div>
                <%--/我的文件--%>
                <%--我的留言--%>
                    <div>
                        <p>留言记录</p>
                        <table>
                            <tr>
                                <th>留言老师</th>
                                <th>留言内容</th>
                                <th>留言时间</th>
                            </tr>
                        </table>
                        <p style="float: right">我要留言</p>
                    </div>
                <%--/我的留言--%>
            </div>
        </div>
    </body>
    <script>
        $(function() {
            $(".col-lg-10").children("div:gt(0)").hide();
            $(".col-lg-2").find("a").attr("href", "javascript:void(0);").click(function () {
            $(".col-lg-2").find(".active").removeClass("active");
            $(this).addClass("active");
            var index = $(this).index();
            $(".col-lg-10").children("div").hide();
            $(".col-lg-10").children("div").eq(index).show();
            });
        })
        $(function () {
            $("#alter_information").click(function () {
                var sno = ${sessionScope.stu.sno};
                var sname = $("#sname").val();
                var sphone = $("#sphone").val();
                var sgender = $("#sgender").val();
                var sage = $("#sage").val();
                var semail = $("#semail").val();
                var saddress = $("#saddress").val();
                var sbirth = $("#sbirth").val();
                var sintro = $("#sintro").val();

                var datas={
                    sno:sno,
                    sname: sname,
                    sphone:sphone,
                    saddress:saddress,
                    sgender:sgender,
                    semail:semail,
                    sbirth:sbirth,
                    sintro:sintro,
                    sage:sage
                };

                $.ajax({
                    type:"post",
                    url:"../StuController/alter_information",
                    data:datas,
                    dataType:'json',
                    success:function (data) {
                        if(data.code==1)
                            alert("修改成功！");
                        else
                            alert("修改失败");
                    }
                })
            })
        })
        //修改密码
        $(function () {
            $("#alter").click(function () {
                var old_passwd = $("#old_passwd").val();
                var new_passwd = $("#new_passwd").val();
                var repeat_passwd = $("#repeat_passwd").val();
                var sno = ${sessionScope.stu.sno};
                if(new_passwd == null || new_passwd ==""){
                    alert("密码不能为空");
                }else if(new_passwd != repeat_passwd){
                    alert("两次密码不一致");
                }else{
                    var datas = {
                        old_passwd:old_passwd,
                        new_passwd:new_passwd,
                        sno:sno
                    };
                    $.ajax({
                        type:"post",
                        url:"../StuController/alter_passwd",
                        data:datas,
                        dataType:'json',
                        success:function (data) {
                            if(data.code==1)
                                alert("修改成功！");
                            else if(data.code==2)
                                alert("原密码错误");
                            else
                                alert("修改失败");
                        }
                    })
                }
            })
        })
    </script>
</html>
