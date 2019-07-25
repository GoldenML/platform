<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/5/21
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>写文章</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="ckeditor/ckeditor.js"></script>
        <script type="text/javascript">
            window.onload = function()
            {
                    CKEDITOR.replace( 'description',{
                        height:470
                });
            };
        </script>
        <style>
            ::-webkit-input-placeholder{
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%--导航条--%>
        <div class="navbar navbar-default" style="margin-bottom: 0px">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">TIPlatform</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="teaSuccess.jsp">个人中心</a>
                        </li>
                        <li>
                            <a href="teaLogin.jsp">安全退出</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
        <%--/导航条--%>
        <p id = "articleId" style="display: none;"></p>
        <div  class="container">
            <div align="center" style="margin-top: 10px">
                <input id="title" style="height: 40px;font-size: 20px;width: 400px" type="text" placeholder="输入标题" />
            </div>
            <div style="margin-top: 10px">
                <textarea  name="description" id="description"/></textarea>
            </div>
            <div style="float:right;margin-top: 10px;margin-bottom: 10px">
                <%--<input id="save" type="button" class="btn btn-primary" value="保存草稿">--%>
                <input id="upload" type="button" class="btn btn-primary" value="上传">
            </div>
        </div>
    </body>
        <script>
            var tno  = ${sessionScope.tea.tno};
            var tname  = "${sessionScope.tea.tname}";
            $(function(){
                $("#save").click(function () {
                    var title = $("#title").val();
                    var content = CKEDITOR.instances.description.getData();
                    if(title == "" || content == ""){
                        alert("标题和内容不能为空！");
                    }else {
                        var status = 0;
                        var datas = {
                            tno: tno,
                            tname: tname,
                            title: title,
                            content: content,
                            status: status
                        };
                        $.ajax({
                            url: "ArticleController/insert",
                            data: datas,
                            type: "post",
                            dataType: "json",
                            success: function (data) {
                                if (data.code == 1) {
                                    $("#articleId").html(data.id);
                                    alert("保存草稿成功");
                                }
                            }
                        })
                    }
                })
                $("#upload").click(function () {
                    var title = $("#title").val();
                    var content = CKEDITOR.instances.description.getData();
                    if(title == "" || content == ""){
                        alert("标题和内容不能为空！");
                    }else {
                        var articleId = $("#articleId").html();
                        console.log(articleId);
                        console.log(111);
                        console.log(articleId.typeof);
                        console.log(undefined ==  articleId.typeof);
                        console.log(articleId.typeof != undefined);
                        console.log(articleId != null);
                        // if (articleId != null ) {
                            var datas = {
                                tno: tno,
                                tname: tname,
                                articleId: articleId,
                                title: title,
                                content: content
                            };
                            $.ajax({
                                url: "ArticleController/upload",
                                data: datas,
                                type: "post",
                                dataType: "json",
                                success: function (data) {
                                    if (data.code == 1) {
                                        $("#articleId").html(data.id);
                                        alert("上传成功!");
                                    }
                                }
                            })
                    //     } else {
                    //         var status = 1;
                    //         var datas = {
                    //             tno: tno,
                    //             tname: tname,
                    //             title: title,
                    //             content: content,
                    //             status: status
                    //         };
                    //         $.ajax({
                    //             url: "ArticleController/insert",
                    //             data: datas,
                    //             type: "post",
                    //             dataType: "json",
                    //             success: function (data) {
                    //                 if (data.code == 1) {
                    //                     $("#articleId").html(data.id);
                    //                     alert("上传成功");
                    //                 }
                    //             }
                    //         })
                    //     }
                     }
                })
            })
        </script>
</html>
