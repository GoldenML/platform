<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/5/8
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <style type="text/css">
            #box,#box2,#box3,#box4{padding:10px;border:1px solid green;}
        </style>
        <style type="text/css">
            .ul{list-style:none;width:40px;height:40px}
            .li{width:40px;height:40px}
            .img26{width:30px;height:30px;text-align:center;margin-left:5px;cursor: pointer;}
            .p{text-align: center;}
        </style>
        <script>
            $(function () {
                for (var i = 0; i <= $(".p").length; i++) {
                    var len = $(".p").length;
                    console.log(len);
                    var ran = Math.floor(Math.random() * 1000 + 1);
                    console.log(ran);
                    $('.p').eq(i).text(ran);

                }
                $("img").click(function () {
                    var num = $(this).next().text();
                    num++;
                    $(this).next().text(num);
                    console.log($(".likes").html());
                });
            });
        </script>
        <title>无标题文档</title>
    </head>
    <body>
    <div class="inner">
        <p>hello</p>
        <div class="content">
            <table>
                <tbody>
                    <tr>
                </tbody>
            </table>
        </div>

    </div>
    </body>
<script>
    var hello = $("#hello").val();
</script>
</html>
