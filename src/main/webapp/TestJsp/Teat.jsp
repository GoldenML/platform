<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/5/21
  Time: 10:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <script src="../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function()
        {
            CKEDITOR.replace( 'description');
        };
    </script>
</head>
<body>
<textarea name="description" id="description"/></textarea>
</body>
</html>

