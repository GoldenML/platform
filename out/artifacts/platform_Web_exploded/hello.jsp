<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/4/15
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>教育互动平台</title>
</head>
<body>
    跳转成功
    <label class="input-placeholder" id="password-tips" for="password" data-bind="visible: password().length == 0">密码</label>
    <div class="input-outer"><div class="password-raw" data-bind="text: password, visible: show_password()" style="display: none;"></div><input autocomplete="off" type="password" id="password" class="password error" maxlength="16" data-bind="textInput: password, event: {blur:checkPassword,focus:onPasswordFocus}, css:{error:typeof passwordStatus() === 'string'}, hasFocus:passwordFocus" tabindex="4"></div>
</body>
</html>
