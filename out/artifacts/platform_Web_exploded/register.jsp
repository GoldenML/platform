<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/11
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<jsp:include page="login_k.jsp"></jsp:include>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>注册用户</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <style>
            body{
                background: linear-gradient(45deg,lightblue 0,lightgreen 100%);
            }
            .jumbotron{
                margin-top: 0px;
                height:180px;
                background: linear-gradient(45deg,lightblue 50%,lightcyan 50%);
                color: dodgerblue;
                margin-bottom: 0px;
            }
            .navbar{
                margin-bottom: 0px;
            }

            div{
                white-space:nowrap;
            }
        </style>
    </head>
    <body>
    <%--<%--%>
        <%--int pre_id = 12345;--%>
        <%--int id = (int)Math.floor(Math.random() * 100000);--%>
        <%--String real_id = pre_id + "" + id ;--%>
        <%--request.setAttribute("id",real_id);--%>
    <%--%>--%>
    <%--&lt;%&ndash;巨幕&ndash;%&gt;--%>
    <%--<div class="jumbotron">--%>

        <%--<h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;缘起缘灭，花开花谢，物极必反，祸福相依</h1>--%>
    <%--</div>--%>
    <%--内容主体--%>
    <div  class="">
        <div class="col-lg-4 col-lg-offset-0 " style="margin-left: -15px;margin-top: 0px;background-attachment:fixed " >
            <img src="img/mn.jpg" width="500px" height="700px" />
            <%--<h2 style="color: black;">&nbsp;&nbsp;&nbsp;网站简介</h2>--%>
            <%--<div style="color: black;">--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;不知从哪天起，办公室里的人陆陆续续都备了各种各样的小瓶子，每人桌子上都养了绿萝。绿萝好养，直接泡到水里就可以了，省了找土栽培的麻烦。--%>
<%--<br/>--%>
                <%--&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;需要一块石头只是这些绿萝完成了繁殖到每个办公桌上的任务之后，就再没有什么起色了。绿萝在水里慢慢生了根后，几乎就不再长了，只是维持着生命似的，让人时时担心着，生怕哪片叶子黄了。就这样，还是有人把绿萝养死了。大家不解，只说办公室可能缺少阳光和氧气。--%>
                <%--<br/>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;有一天去盥（guàn）洗室，隔壁办公室的女同事正在给绿萝换水。她的绿萝长得绿油油的，密密的一丛，每一片叶子都精神得很，不像我们办公室的绿萝，又蔫又稀。--%>
                <%--<br/>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;“你在土里种着？”我问，因为那是一个蓝花瓷的浅花盆。“没有，也种在水里。”她说。--%>
                <%--<br/>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我很疑惑，水里也能长得这么好？女同事说：我放了几块石头进去，它的根就使劲往下扎，把石头紧紧地缠住。要是光有水，它的根就没什么可抓的，在水里飘呀飘的，就长不好了。--%>
                <%--<br/>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;原来是石头！--%>
                <%--<br/>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;事情总是机缘巧合，到了晚上，女儿开始背课文：谁有你的根底艰难贫苦啊，你从那紫色的岩上挺起了腰;即使是裸露着的根须，也把山岩紧紧地拥抱……是张万舒的《黄山松》，直到今天，我才真正理解：没有土可以，但不能没有一块石头。贫瘠并不可怕，可怕的是没有依托。--%>
                <%--<br/>--%>
                <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;正如一个人，贫穷并不可怕，可怕的是没有精神的固守。--%>
            <%--</div>--%>
        </div>
        <%--注册框体--%>
        <div class="col-lg-6 col-lg-md-5     col-lg-offset-1" id="div_con">
            <div>
                <h2><a  style="float: right" href="javascript:void(0);" class="small-box-footer" data-toggle="modal" data-target="#myModal">登录</a></h2>
            </div>
            <br />
            <br />
            <h1>欢迎注册</h1>
            <br />
            <div class="col-lg-offset-2 col-lg-md-5">
                <form>
                    <div>
                         <input maxlength="10" name="nickname" id="sname" class="form-control" placeholder="姓名" style="height:60px;"/>
                    </div>
                    <br />
                    <div>
                        <input maxlength="11" name="phone" id="sphone" class="form-control" placeholder="手机号" style="height:60px;"  onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();"/>
                    </div>
                    <br />
                    <div>
                        <input maxlength="16" type="password" id="passwd" name="passwd" class="form-control" placeholder="密码（最多16位）" style="height:60px;"/>  </td>
                    </div>
                    <br />

                    <div>
                        <input maxlength="16" autocomplete="off" type="password" id="repeat_passwd" name="repeat_passwd" class="form-control" placeholder="重复密码" style="height:60px;"  onkeyup="validate()" /> <br/><span id="tishi"></span>
                    </div>
                    <br />
                    <div style="font-size: 20px;display: none;" >
                        文化程度：
                        <select id="gno">
                            <option value = 10>本科</option>
                            <option value = 20>高中</option>
                            <option value = 30>初中</option>
                            <option value = 40>小学</option>
                        </select>
                    </div>
                    <br />
                    <div>
                        <p align="center" >
                            <br/>
                            <input type="button" id="zhuce" class="btn btn-info btn-block" value="注册"  />
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
    </body>
    <script type="text/javascript">
        <%--密码比较--%>
        function validate() {
            var pwd1 = document.getElementById("passwd").value;
            var pwd2 = document.getElementById("repeat_passwd").value;

            <!-- 对比两次输入的密码 -->
            if(pwd1 == pwd2)
            {
                document.getElementById("tishi").innerHTML="<font color='green'>√</font>";
                document.getElementById("button").disabled = false;
            }
            else {
                document.getElementById("tishi").innerHTML="<font color='red'>两次密码不相同</font>";
                document.getElementById("button").disabled = true;
            }
        }
        // 注册
        $(function () {
            $("#zhuce").click(function () {
                var sname = $("#sname").val();
                var sphone = $("#sphone").val();
                var passwd = $("#passwd").val();
                var repeat_passwd = $("#repeat_passwd").val();
                var gno = $("#gno").val();
                <%--var sno = ${requestScope.id};--%>
                var datas = {
                    sname:sname,
                    sphone:sphone,
                    passwd:passwd,
                    gno:gno,
                    // sno:sno
                };
                if(passwd == null || passwd == ""){
                    alert("密码不能为空");
                }
                else if(passwd==repeat_passwd)
                    $.ajax({
                        type:"post",
                        url:"StuController/insertStu",
                        data:datas,
                        dataType:'json',
                        success:function (data) {
                            if(data.code==1){
                                alert("此手机号已被注册");
                            }else{
                                window.location.href = "registerSuccess.jsp";
                            }
                        }
                    })
                else{
                    alert("密码不一致");
                }
            })
        })
    </script>
</html>
