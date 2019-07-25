<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/15
  Time: 12:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="head.jsp"%>
<html>
    <head>
        <title>Title</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <style>
            body{
                background: lightseagreen;
            }
        </style>
    </head>
    <body>

        <div align="center">
            <br /><br /><br /><br /><br />
            <h1>注册成功</h1>
            <h2>您的id为：${applicationScope.sno}</h2>
        </div>

    </body>
</html>
