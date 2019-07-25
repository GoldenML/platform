<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/5/22
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>查看文章</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="navbar navbar-default">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="stu_index.jsp">TIPlatform</a>
                </div>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="student.jsp">个人中心</a>
                        </li>
                        <li>
                            <a href="javascript:void(0)" onclick="quit()">安全退出</a>
                        </li>

                    </ul>
                </div>
            </div>

        </div>
        <div class="container col-lg-8 col-lg-offset-2">
            <div align="center">
                <h2 id="title">标题</h2>
            </div>
            <div >
                作者:<span id="author"></span>

            </div>
            <div>
                上传日期:<span id="uploadDate"></span>
            </div>
            <div >
                浏览数：<span id="lookNumber"></span>
            </div>
            <div id="content" style="margin-top: 20px">
                文章正文
            </div>
            <div style="float:right;margin-top: 50px">
                <input id="zan" type="button" value="赞">
                <input id="cai" type="button" value="踩">
                <input id="coll" type="button" value="收藏">
            </div>
            <%--评论回复--%>
            <div style="margin-top: 50px">
                <span>评论展示</span>
            </div>
            <div class="col-lg-12">
                <span id="lou"></span>
                <div id = "showReply">

                </div>

                <textarea style="margin-top: 10px" class="col-lg-12" id="replyK"></textarea>
                <button id="reply2" class="btn-primary" onclick="replyComments(<%=request.getParameter("id")%>)" style="float:right;margin-top: 10px;">回复</button>
            </div>
            <%--评论回复结束--%>
        </div>
    </body>
<script>
    <%--function quit() {--%>
        <%--${sessionScope.remove("stu")};--%>
        <%--window.location.href="index.jsp";--%>
    <%--}--%>
    // 回复文章
    var sno = ${sessionScope.stu.sno};
    var id = <%=request.getParameter("id")%>;
    showAllReply();
    function showAllReply(){
        $.ajax({
            url:"ReplyArticleController/findById",
            data:{"id":id},
            type:"post",
            dataType:"json",
            success:function (data) {
                $("#showReply").empty();
                //一级评论
                var list = data.list;
                //二级评论
                var listList = data.listList;
                //一级名称
                var list2 = data.list2;
                //二级名称
                var list4 = data.list4;
                for(var i = 0;i<list.length;i++){

                    var rowdata = list[i];
                    var rowdata2 = list2[i];
                    if(data.code == 1 ){
                        $("#showReply").append("<span>"+(i+1)+"楼"+"</span>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"<span>"+rowdata2.sname+":"+"</span>"+rowdata.content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rowdata.time
                            +"<a href='javascript:void(0)' onclick=reply('"+rowdata2.sname+"',"+rowdata.id+","+rowdata.no+")>回复"+"</a>"+"<br />"
                        );
                    }else{
                        $("#lou").html(i+"楼");
                        $("#showReply").append("<span>"+i+"楼"+"</span>"+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"<span>"+rowdata2.tname+":"+"</span>"+rowdata.content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rowdata.time
                            +"<a href='javascript:void(0)' onclick=reply('"+rowdata2.tname+"',"+rowdata.id+","+rowdata.no+")>回复"+"</a>"+"<br />"
                        );
                    }
                    var list3 = listList[i];
                    for(var j = 0;j<list3.length;j++){
                        var rowdata3 = list3[j];
                        var rowdata4 = list4[j];
                        if(data.code2 == 1){
                            $("#showReply").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"<span>"+rowdata3.peoToPeo+":"+"</span>"+rowdata3.content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rowdata3.time
                                +"<a href='javascript:void(0)' onclick=reply('"+rowdata4.sname+"',"+rowdata.id+","+rowdata3.no+")>回复"+"</a>"+"<br />"
                            );
                        }else{
                            $("#showReply").append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+"<span>"+rowdata3.peoToPeo+":"+"</span>"+rowdata3.content+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+rowdata3.time
                                +"<a href='javascript:void(0)' onclick=reply('"+rowdata4.tname+"',"+rowdata.id+","+rowdata3.no+")>回复"+"</a>"+"<br />"
                            );
                        }

                    }
                    $("#showReply").append("<hr />");
                }

            }
        })
    }

    function replyComments(id){
        if($("#replyK").val()==""){
            alert("评论不能为空");
        }else {
            $.ajax({
                url: "ReplyArticleController/insert",
                data: {"articleId": id, "no": sno, "content": $("#replyK").val()},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.code == 1) {
                        alert("评论成功");
                        $("#replyK").val("");
                        showAllReply();
                    }
                }
            })
        }
    }
    function replyComments(id,sourceId,sourceNo){
        if($("#replyK").val()==""){
            alert("评论不能为空");
        }else {
            $.ajax({
                url: "ReplyArticleController/insert",
                data: {"articleId": id, "no": sno,"sourceId":sourceId,"sourceNo":sourceNo, "content": $("#replyK").val()},
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data.code == 1) {
                        alert("评论成功");
                        $("#replyK").val("");
                        showAllReply();
                    }
                }
            })
        }
    };
    function reply(name,sourceId,sourceNo){
        $("#replyK").text("@"+name+" ");
        $("#reply2").removeAttr("onclick");
        $("#reply2").click(function () {
            $("#reply2").onclick = replyComments(id,sourceId,sourceNo);
        })
    }
    // 回复文章结束
    $(function () {
        var sno = ${sessionScope.stu.sno};


        var datas = {
            id : id
        };
        $.ajax({
            url : "ArticleController/addLookNum",
            data : datas,
            type : "post",
            dataType : "json",
            success:function (data){
                var datass = data.article4;
                $("#lookNumber").html(datass.lookNumber);
            }
        })
        $.ajax({
            url : "ArticleController/findById",
            data : datas,
            type : "post",
            dataType : "json",
            success:function (data) {
                var datass = data.article2;
                $("#title").html(datass.title);
                $("#author").html(datass.tname);
                $("#uploadDate").html(datass.uploadDate);
                $("#content").html(datass.content);
                $("#zan").val("赞"+datass.praiseNumber);
                $("#cai").val("踩"+datass.badNumber);
                $("#coll").val("收藏"+datass.collNumber);
                $("#lookNumber").val("收藏"+datass.lookNumber);
            }
        })

        $("#zan").click(function () {
            var datas = {
                id : id,
                sno : sno,
            };
            $.ajax({
                url : "ArticleController/addPraiseNum",
                data : datas,
                type : "post",
                dataType : "json",
                success:function (data) {
                    if(data.code == 1){
                        alert("已经踩，无法赞");
                    }else {
                        var datass = data.article3;
                        $("#zan").val("赞" + datass.praiseNumber);
                    }
                }
            })
        })
        $("#cai").click(function () {
            var datas = {
                id : id,
                sno : sno,
            };
            $.ajax({
                url : "ArticleController/addBadNum",
                data : datas,
                type : "post",
                dataType : "json",
                success:function (data) {
                    if(data.code == 1){
                        alert("已经赞，无法踩");
                    }else {
                        var datass = data.article3;
                        $("#cai").val("踩" + datass.badNumber);
                    }
                }
            })
        })
        $("#coll").click(function () {
            var datas = {
                article_id : id,
                sno : sno,
            };
            $.ajax({
                url : "ArticleController/addCollNum",
                data : datas,
                type : "post",
                dataType : "json",
                success:function (data) {
                    if(data.code == 1){
                        alert("收藏成功！");
                    }else{
                        alert("取消收藏！")
                    }
                    var datass = data.article5;
                    $("#coll").val("收藏" + datass.collNumber);

                }
            })
        })
    })
</script>
</html>
