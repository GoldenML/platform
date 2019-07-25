<%--
  Created by IntelliJ IDEA.
  User: Golden
  Date: 2019/5/11
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
        <link type="text/css" rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
        <script type="text/javascript" language="javascript" src="../js/jquery-2.1.0.js" ></script>
        <script type="text/javascript" language="javascript" src="../js/jquery.pagination.js" ></script>
        <script type="text/javascript" language="javascript" src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/pagination.css" type="text/css" media="all" />
    </head>
    <body>
    <%--显示查询数据div--%>
    <div class="main"></div>
    <%--分页div--%>
    <dvi id="page">
        <div style="float: left;width: 50%; margin: 0 0 10px 25px">
            显示第 <span id= "startPageNumber"> 1</span> 到第<span id= "endPageNumber"> 10</span> 条记录，总共 <span id="taTalDataNumber"></span> 条记录  每页显示
            <select id ="selectPage" onchange="select()" style="width: 9%">
                <option value="3" selected>3</option>
                <option value="6">6</option>
                <option value="14">14</option>
                <option value="100">100</option>
            </select>
            条记录
        </div>
        <%--分页控件div--%>
        <div class="M-box" style="float: right"></div>
    </dvi>
    </body>
    <script>
        var fileData;
        function showDataNumber(currentPage){
            var endNumber =currentPage * $("#selectPage").val();
            $("#endPageNumber").text(" "+endNumber);
            var startNumber = (currentPage-1)*$("#selectPage").val()+1
            $("#startPageNumber").text(" "+startNumber);
            if(fileData == null ){
                $("#taTalDataNumber").text(" "+0);
            }else{
                $("#taTalDataNumber").text(" "+fileData.length);
            }
        }

        function getPageData(currentPage){
            if (typeof (fileData) != "undefined" &&  fileData != null) {
                //计算每页数据起始和终止数据编号
                var pageNumber = $("#selectPage").val()
                var maxLength = currentPage * pageNumber - 1;
                var minLength = currentPage * pageNumber - pageNumber;
                var pageData = [];
                for (var i = minLength; i < fileData.length; i++) {
                    if (maxLength < i) {
                        break;
                    } else {
                        pageData.push(fileData[i]);
                    }
                }
                htmlData(pageData);
            }else{
                //把空数据传到页面中去
                htmlData(fileData);
            }
        }

        function htmlData(fileDataS){
            $(".main").html("");
            if(fileDataS == null){
                $(".main").html("");
                $('.M-box').hide();
            }else{
                $('.M-box').show();
                $.each(fileDataS,function (index,file){
                    var html =
                        ' 留言老师 '+file.tname+
                        ' 下载次数 '+file.slm_time +
                        ' 留言内容 '+file.slm_context
                    $(".main").append(html);
                });
            }
        }

        function page() {
            if (typeof (fileData) != "undefined" &&  fileData != null) {
                var totalData = fileData.length;
                var showData = $("#selectPage").val();
                if(showData > totalData){
                    showData = totalData;
                }
                $('.M-box').pagination({
                    totalData: totalData,
                    showData: showData,
                    coping: true,
                    callback: function (index) {
                        //改变显示开始和结束数据编号
                        showDataNumber(index.getCurrent());
                        getPageData(index.getCurrent());
                    }
                });
            }
        }

        function select(){
            $("#endPageNumber").text(" "+$("#selectPage").val())
            initSelect();
        }
        /**
         * 初始化选择每页显示数据
         */
        function initSelect(){
            showDataNumber(1);
            getPageData(1);
            page();
        }

        $.ajax({
            url: '',
            type: 'POST',
            data:'',
            dataType: "json",
            success:function (data){
                fileData =data;
                console.log(fileData);
                showDataNumber(1);//初始化每页到开始到结束数据编号
                getPageData(1);//初始化第一页的数据
                page();//初始化分页
            }
        });

    </script>
</html>
