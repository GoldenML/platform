<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/5/5
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zxx">
    <head>
        <title>Latest Login Form Responsive Widget Template :: w3layouts</title>
        <!-- Meta tag Keywords -->
        <link type="text/css" rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="../js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />
        <meta name="keywords" content="Latest Login Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements" />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <!-- Meta tag Keywords -->

        <!-- css files -->
        <link rel="stylesheet" href="../css/tea/style.css" type="text/css" media="all" />
        <!-- Style-CSS -->
        <link href="../css/tea/font-awesome.min.css" rel="stylesheet">
        <!-- Font-Awesome-Icons-CSS -->
        <!-- //css files -->

        <!-- web-fonts -->
        <link href="//fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
              rel="stylesheet">
        <!-- //web-fonts -->
    </head>

    <body>
        <div class="main-bg">
            <!-- title -->
            <h1>Latest Login Form</h1>
            <!-- //title -->
            <!-- content -->
            <div class="sub-main-w3">
                <div class="bg-content-w3pvt">
                    <div class="top-content-style">
                        <img src="../img/user.jpg" alt="" />
                    </div>
                    <form>
                        <p class="legend">Login Here<span class="fa fa-hand-o-down"></span></p>
                        <div class="input">
                            <input type="text" placeholder="账号" id="teano" name="teano" required />
                            <span class="glyphicon glyphicon-user"></span>
                        </div>
                        <div class="input">
                            <input type="password" id="passwd" placeholder="Password" name="passwd" required />
                            <span class="fa fa-unlock"></span>
                        </div>
                        <button type="button" id="login" class="btn submit">
                            <span class="fa fa-sign-in"></span>
                        </button>
                    </form>
                    <a href="#" class="bottom-text-w3ls">Forgot Password?</a>
                </div>
            </div>
            <!-- //content -->
            <!-- copyright -->
            <div class="copyright">
                <h2>&copy; 2019 Latest Login Form. All rights reserved | Design by
                    <a href="http://w3layouts.com" target="_blank">W3layouts</a>
                </h2>
            </div>
            <!-- //copyright -->
        </div>
    </body>
    <script type="text/javascript">
        $(function () {
            $("#login").click(function () {
                var teano = $("#teano").val();
                var passwd = $("#passwd").val();
                var datas = {
                    teano:teano,
                    passwd:passwd
                };
                $.ajax({
                    type:"post",
                    url:"../TeaController/login",
                    data:datas,
                    dataType:'json',
                    crossDomain: true,
                    success:function (data) {
                        if(data.code==2){
                            window.location.href = "teaSuccess.jsp";
                        }else{
                            alert("用户名或密码错误！");
                        }
                    }
                })
            })
        })
    </script>
</html>
