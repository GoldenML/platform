<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/15
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="login_k.jsp"></jsp:include>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>教学互动平台</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <style>
        </style>
    </head>
    <body>
            <nav class="navbar navbar-default navbar-inverse">
                <div class="container">
                <div class="container-fluid">
                    <!--手机页面展示的样式-->
                    <div class="navbar-header">

                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-education" aria-hidden="true"></span></a>

                    </div>

                    <!--导航条内容-->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="javascript:void(0);" class="small-box-footer" data-toggle="modal" data-target="#myModal">登录</a></li>
                            <li><a href="register.jsp">注册</a></li>
                        </ul>
                    </div>
                </div>
                </div>
            </nav>



    </body>

</html>
