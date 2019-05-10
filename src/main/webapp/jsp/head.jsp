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
        <title>Title</title>
        <link type="text/css" rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="../js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
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
                            <li><a href="./register.jsp">注册</a></li>
                        </ul>
                    </div>
                </div>
                </div>
            </nav>


        <%--<div align="center" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">--%>
            <%--<div class="modal-dialog" role="document" >--%>
                <%--<div class="modal-content" style="height: 300px;width: 300px;">--%>
                    <%--<div class="modal-header">--%>
                        <%--<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>--%>
                        <%--<h4 class="modal-title" id="myModalLabel">登录</h4>--%>
                    <%--</div>--%>
                    <%--<div class="modal-body" align="left">--%>
                        <%--<form>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="user_id"><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>  用户名：</label>--%>
                                <%--<input class="form-control" autofocus required placeholder="Username" type="text" name="user_id" id="user_id" value="" />--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<label for="user_passwd"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>  密码：</label>--%>
                                <%--<input class="form-control" required placeholder="Password" type="password" name="user_passwd" id="user_passwd" value="" />--%>
                            <%--</div>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                    <%--<div  class="" align="center">--%>
                        <%--<button type="button" id="login" class="btn btn-primary">登录</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </body>
    <%--<script type="text/javascript">--%>
        <%--$(function () {--%>
            <%--$("#login").click(function () {--%>
                <%--var sno = $("#user_id").val();--%>
                <%--var passwd = $("#user_passwd").val();--%>
                <%--var datas = {--%>
                  <%--sno:sno,--%>
                  <%--passwd:passwd--%>
                <%--};--%>
                <%--$.ajax({--%>
                    <%--type:"post",--%>
                    <%--url:"../StuController/login",--%>
                    <%--data:datas,--%>
                    <%--dataType:'json',--%>
                    <%--crossDomain: true,--%>
                    <%--success:function (data) {--%>
                        <%--if(data.sno){--%>
                            <%--console.log(111);--%>
                            <%--window.location.href = "loginSuccess.jsp";--%>
                        <%--}else{--%>
                            <%--window.location.href = "loginFalse.jsp";--%>
                        <%--}--%>
                    <%--}--%>
                <%--})--%>
            <%--})--%>
        <%--})--%>
    <%--</script>--%>
</html>
