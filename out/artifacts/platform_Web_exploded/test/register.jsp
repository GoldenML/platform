<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/20
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>test_register</title>
    </head>
    <body>
    <form  method="post" action="../StuController/insertStu">
        <table class="table-condensed">
            <tr>
                <td style="color: black;"><span class="glyphicon glyp glyphicon-user" aria-hidden="true"></span>姓名：</td>
            </tr>
            <tr>
                <td > <input name="name" class="form-control" />  </td>
            </tr>
            <tr>
                <td style="color: black;"><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span> 电话号码：</td>
            </tr>
            <tr>
                <td> <input name="phone" class="form-control" />  </td>
            </tr>
            <tr>
                <td style="color: black;"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>密码：</td>
            </tr>
            <tr>
                <td> <input type="password" id="passwd" name="passwd" class="form-control" />  </td>
            </tr>
            <tr>
                <td style="color: black;"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span>重复密码：</td>
            </tr>
            <tr>
                <td> <input type="password" id="repeat_passwd" name="repeat_passwd" class="form-control"  onkeyup="validate()" /> <span id="tishi"></span> </td>
            </tr>
            <tr>
                <td style="color: black;">文化程度：
                    <select>
                    <option value ="0">本科</option>
                    <option value ="1">高中</option>
                    <option value="2">初中</option>
                    <option value="3">Audi</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td align="center" >
                    <br/>
                    <input type="submit" class="btn btn-info btn-block" value="注册" />
                </td>
            </tr>
        </table>
    </form>
    </body>
    <script>
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
    </script>
</html>
