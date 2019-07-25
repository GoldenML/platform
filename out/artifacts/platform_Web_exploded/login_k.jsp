<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/22
  Time: 10:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
    <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <style>
        .modal-content{
            background-image: url("img/3.jpg");
        }
    </style>
</head>
<body>
<div align="center" class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document" >
        <div class="modal-content" style="height: 300px;width: 300px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">登录</h4>
            </div>
            <div class="modal-body" align="left">
                <form>
                    <div class="form-group">
                        <label for="user_id"><span class="glyphicon glyphicon-user" aria-hidden="true" ></span>  账号：</label>
                        <input maxlength="10" class="form-control" autofocus required placeholder="UserNo" type="text" name="user_id" id="user_id" value="" />
                    </div>
                    <div class="form-group">
                        <label for="user_passwd"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>  密码：</label>
                        <input maxlength="16" class="form-control" required placeholder="Password" type="password" name="user_passwd" id="user_passwd" value="" />
                    </div>
                </form>
            </div>
            <div  class="" align="center">
                <button type="button" id="login" class="btn btn-primary">登录</button>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $("#login").click(function () {
            var sno = $("#user_id").val();
            var passwd = $("#user_passwd").val();
            var datas = {
                sno:sno,
                passwd:passwd
            };
            $.ajax({
                type:"get",
                url:"StuController/login",
                data:datas,
                dataType:'json',
                crossDomain: true,
                success:function (data) {
                    if(data.code==1){
                        window.location.href = "stu_index.jsp";
                    }else{
                        alert("账号或密码错误！");
                    }
                }
            })
        })
    })
</script>
</html>
