<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/5/16
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" errorPage="index.jsp" language="java" %>
<html>
    <head>
        <title>教学互动平台</title>
        <link type="text/css" rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" language="javascript"  src="js/student/get_aca_major_tea.js"></script>
        <link type="text/css" rel="stylesheet" href="css/stu/lunbo.css" />
        <script type="text/javascript" language="javascript"  src="js/student/head.js"></script>
        <script type="text/javascript" language="javascript"  src="js/student/showArticle.js"></script>
    </head>
    <body>
        <div class="navbar navbar-default" style="margin-bottom: 0px">

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
                    <ul class="nav navbar-nav">
                        <li id="index" class="active"><a href="javascript:void(0)" onclick="showIndex()">首页 <span class="sr-only">(current)</span></a></li>
                        <li id="course" class=""><a href="javascript:void(0)" onclick="showCourseware()">课件</a></li>
                        <li id="article" class=""><a href="javascript:void(0)" onclick="showArticle()">文章</a></li>
                        <%--<li id="video"><a href="javascript:void(0)" onclick="showVideo()">视频</a></li>--%>

                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="student.jsp">个人中心</a>
                        </li>
                        <li>
                            <a href="index.jsp">安全退出</a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div style="margin-top: 0px" class="jumbotron">
            <h1 style="margin-left: 100px;font-family: 楷体;">Welcome to you</h1>
        </div>
        <div style="" class="container" id="indexPage">
            <div class="box1 col-lg-offset-0" id="box">
                <div class="inner">
                    <!--轮播图-->
                    <ul id="ul2">
                        <li><a href="#"><img src="images/1.png" alt=""></a></li>
                        <li><a href="#"><img src="images/2.png" alt=""></a></li>
                        <li><a href="#"><img src="images/3.png" alt=""></a></li>
                        <li><a href="#"><img src="images/4.jpg" alt=""></a></li>
                        <li><a href="#"><img src="images/5.jpg" alt=""></a></li>

                    </ul>

                    <ol class="bar">

                    </ol>
                    <!--左右焦点-->
                    <div id="arr">
                    <span id="left">
                        <
                    </span>
                        <span id="right">
                        >
                    </span>
                    </div>

                </div>
            </div>
            <div class="box2 col-lg-offset-6">
                <p style="font-size: 20px">公告栏</p>
                <ul style="list-style:none;font-size: 18px;margin: 10px" id="lookAnnouce" >
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                    <%--<li><a href="">3号需要查重3号需要查重3号需要查重-张三<span style="float:right;">2019-06-02</span></a></li>--%>
                </ul>
            </div>
            <script>
                /**
                 *
                 * @param id  传入元素的id
                 * @returns {HTMLElement | null}  返回标签对象，方便获取元素
                 */
                function my$(id) {
                    return document.getElementById(id);
                }

                //获取各元素，方便操作
                var box=my$("box");
                var inner=box.children[0];
                var ulObj=inner.children[0];
                var list=ulObj.children;
                var olObj=inner.children[1];
                var arr=my$("arr");
                var imgWidth=inner.offsetWidth;
                var right=my$("right");
                var pic=0;
                //根据li个数，创建小按钮
                for(var i=0;i<list.length;i++){
                    var liObj=document.createElement("li");

                    olObj.appendChild(liObj);
                    liObj.innerText=(i+1);
                    liObj.setAttribute("index",i);

                    //为按钮注册mouseover事件
                    liObj.onmouseover=function () {
                        //先清除所有按钮的样式

                        for (var j=0;j<olObj.children.length;j++){
                            olObj.children[j].removeAttribute("class");
                        }
                        this.className="current";
                        pic=this.getAttribute("index");
                        animate(ulObj,-pic*imgWidth);
                    }

                }


                //设置ol中第一个li有背景颜色
                olObj.children[0].className = "current";
                //克隆一个ul中第一个li,加入到ul中的最后=====克隆
                ulObj.appendChild(ulObj.children[0].cloneNode(true));

                var timeId=setInterval(onmouseclickHandle,3000);
                //左右焦点实现点击切换图片功能
                box.onmouseover=function () {
                    arr.style.display="block";
                    clearInterval(timeId);
                };
                box.onmouseout=function () {
                    arr.style.display="none";
                    timeId=setInterval(onmouseclickHandle,3000);
                };

                right.onclick=onmouseclickHandle;
                function onmouseclickHandle() {
                    //如果pic的值是5,恰巧是ul中li的个数-1的值,此时页面显示第六个图片,而用户会认为这是第一个图,
                    //所以,如果用户再次点击按钮,用户应该看到第二个图片
                    if (pic == list.length - 1) {
                        //如何从第6个图,跳转到第一个图
                        pic = 0;//先设置pic=0
                        ulObj.style.left = 0 + "px";//把ul的位置还原成开始的默认位置
                    }
                    pic++;//立刻设置pic加1,那么此时用户就会看到第二个图片了
                    animate(ulObj, -pic * imgWidth);//pic从0的值加1之后,pic的值是1,然后ul移动出去一个图片
                    //如果pic==5说明,此时显示第6个图(内容是第一张图片),第一个小按钮有颜色,
                    if (pic == list.length - 1) {
                        //第五个按钮颜色干掉
                        olObj.children[olObj.children.length - 1].className = "";
                        //第一个按钮颜色设置上
                        olObj.children[0].className = "current";
                    } else {
                        //干掉所有的小按钮的背景颜色
                        for (var i = 0; i < olObj.children.length; i++) {
                            olObj.children[i].removeAttribute("class");
                        }
                        olObj.children[pic].className = "current";
                    }
                }
                left.onclick=function () {
                    if (pic==0){
                        pic=list.length-1;
                        ulObj.style.left=-pic*imgWidth+"px";
                    }
                    pic--;
                    animate(ulObj,-pic*imgWidth);
                    for (var i = 0; i < olObj.children.length; i++) {
                        olObj.children[i].removeAttribute("class");
                    }
                    //当前的pic索引对应的按钮设置颜色
                    olObj.children[pic].className = "current";
                };

                //设置任意的一个元素,移动到指定的目标位置
                function animate(element, target) {
                    clearInterval(element.timeId);
                    //定时器的id值存储到对象的一个属性中
                    element.timeId = setInterval(function () {
                        //获取元素的当前的位置,数字类型
                        var current = element.offsetLeft;
                        //每次移动的距离
                        var step = 10;
                        step = current < target ? step : -step;
                        //当前移动到位置
                        current += step;
                        if (Math.abs(current - target) > Math.abs(step)) {
                            element.style.left = current + "px";
                        } else {
                            //清理定时器
                            clearInterval(element.timeId);
                            //直接到达目标
                            element.style.left = target + "px";
                        }
                    }, 10);
                }
            </script>
        </div>
        <div style="margin-top: 20px; display: none;" class="container " id = "courseware" >
            <table class="table ">
                <tr>
                    <td class="col-lg-2">
                        <select id="getAca" class="form-control">
                            <option value = 0>请选择</option>
                        </select>
                    </td>
                    <td class="col-lg-2">
                        <select id="getMajor" class="form-control">
                            <option value=0>请选择</option>
                        </select>
                    </td>
                    <td class="col-lg-2">
                        <select id="getTeacher" class="form-control">
                            <option value=0>请选择</option>
                        </select>
                    </td>
                </tr>
            </table>
            <table class="table">
                <tr>
                    <td>文件名</td>
                    <td>老师</td>
                    <td>上传日期</td>
                    <td>操作</td>
                </tr>
                <tbody id="lookfile">
                </tbody>
            </table>
            <div style="display: inline-block;float:left; padding-top: 10px;">
                <label style="color: darkgrey">
                    当前第
                    <span id="currentPage2">1</span> 页，共有
                    <span id="totlePageSize2">0</span>页，共
                    <span id="totleCount2">0</span>条
                </label>
            </div>
            <nav id="page" aria-label="...">
                <ul class="pager">
                    <li><a href="javascript:void(0);"onclick="js_previous2()">上一页</a></li>
                    <li><a href="javascript:void(0);"onclick="js_next2()">下一页</a></li>
                </ul>
            </nav>
            <nav id="page2" aria-label="..." style="display: none;">
                <ul class="pager">
                    <li><a href="javascript:void(0);"onclick="js_previous2(aca_id,'../TeaFileController/findAcaAllFile')">上一页</a></li>
                    <li><a href="javascript:void(0);"onclick="js_next2(aca_id,'../TeaFileController/findAcaAllFile')">下一页</a></li>
                </ul>
            </nav>
            <nav id="page3" aria-label="..." style="display: none;">
                <ul class="pager">
                    <li><a href="javascript:void(0);"onclick="js_previous2(major_id,'../TeaFileController/findMajorAllFile')">上一页</a></li>
                    <li><a href="javascript:void(0);"onclick="js_next2(major_id,'../TeaFileController/findMajorAllFile')">下一页</a></li>
                </ul>
            </nav>
            <nav id="page4" aria-label="..." style="display: none;">
                <ul class="pager">
                    <li><a href="javascript:void(0);"onclick="js_previous2(tno,'../TeaFileController/findTeaAllFile')">上一页</a></li>
                    <li><a href="javascript:void(0);"onclick="js_next2(tno,'../TeaFileController/findTeaAllFile')">下一页</a></li>
                </ul>
            </nav>

        </div>
        <div style="margin-top: 20px; display: none;" class="container " id = "display_article">
            <%--<table class="table ">--%>
                <%--<tr>--%>
                    <%--<td class="col-lg-2">--%>
                        <%--<select id="getAca2" class="form-control">--%>
                            <%--<option value = 0>请选择</option>--%>
                        <%--</select>--%>
                    <%--</td>--%>
                    <%--<td class="col-lg-2">--%>
                        <%--<select id="getMajor2" class="form-control">--%>
                            <%--<option value=0>请选择</option>--%>
                        <%--</select>--%>
                    <%--</td>--%>
                    <%--<td class="col-lg-2">--%>
                        <%--<select id="getTeacher2" class="form-control">--%>
                            <%--<option value=0>请选择</option>--%>
                        <%--</select>--%>
                    <%--</td>--%>
                <%--</tr>--%>
            <%--</table>--%>
            <table class="table">
                <tr>
                    <td>标题</td>
                    <td>老师</td>
                    <td>上传日期</td>
                    <td>浏览数</td>
                </tr>
                <tbody id="lookArticle">
                </tbody>
            </table>
            <div style="display: inline-block;float:left; padding-top: 10px;">
                <label style="color: darkgrey">
                    当前第
                    <span id="currentPage">1</span> 页，共有
                    <span id="totlePageSize">0</span>页，共
                    <span id="totleCount">0</span>条
                </label>
            </div>
            <nav aria-label="...">
                <ul class="pager">
                    <li><a href="javascript:void(0);"onclick="js_previous()">上一页</a></li>
                    <li><a href="javascript:void(0);"onclick="js_next()">下一页</a></li>
                </ul>
            </nav>
        </div>
    </body>
    <script type="text/javascript">
        var sno = ${sessionScope.stu.sno};
        var aca_id = $("#getAca").val();
        var major_id = $("#getMajor").val();
        var tno = $("#getTeacher").val();

        $.ajax({
            url:"AnnouncementController/indexAnnounce",
            type:"get",
            dataType:"json",
            success:function (data) {
                $("#lookAnnouce").empty();
                var datass = data.list;
                var datass2 = data.list2;
                for(var i = 0;i<datass.length;i++){
                    var rowdata = datass[i];
                    var rowdata2 = datass2[i];
                    $("#lookAnnouce").append("<li>"+
                        "<a href='#'>"+rowdata.content+"----"+rowdata2.tname+"<span style='float: right;'>"+rowdata.time+"</span>"+"</a>"+
                        "</li>");
                }
            }
        })


    </script>
    <script type="text/javascript" language="javascript"  src="js/student/showFile.js"></script>
</html>
