<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/22
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="refresh" content="3">
<html>
    <head>
        <title>Title</title>
        <link type="text/css" rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="../js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                            <a href="#">${sessionScope.tea.name}</a>
                        </li>
                        <li>
                            <a href="../jsp/index.jsp">安全退出</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <%--//导航条--%>
        <%--正文--%>
        <div>
            <div align="center" class="list-group col-lg-2" style="margin-top: 10px;margin-bottom: 0px;margin-left: 20px" >
                <a href="#" class="list-group-item active">上传课件</a>
                <a href="#" class="list-group-item">修改信息</a>
                <a href="#" class="list-group-item">留言板</a>
            </div>
            <div class="col-lg-8" style="margin-top: 10px">
                <div>
                    <form action="UploadFile.ashx" method="post" enctype="multipart/form-data">
                        <input type="file" name="fileUpload" />
                        <br />
                        <input type="submit" value="上传文件" />
                    </form>
                </div>
                <div>
                    <form>
                        <label>手机号：</label>
                        <div>
                            <input type="text" value="${sessionScope.tea.phone}">
                        </div>
                        <label>年龄：</label>
                        <div>
                            <input type="text" value="${sessionScope.tea.age}">
                        </div>
                        <label>性别：</label>
                        <div>
                            <input type="text" value="${sessionScope.tea.gender}">
                        </div>
                        <label>邮箱：</label>
                        <div>
                            <input type="text" value="">
                        </div>
                        <label>家庭地址：</label>
                        <div>
                            <input type="text" value="">
                        </div>
                        <br />
                        <div>
                            <input type="button" class="btn btn-primary" value="修改">
                        </div>
                    </form>
                </div>
            </div>

        </div>

        <%--//正文--%>
    </body>
    <script>
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
    </script>
</html>
