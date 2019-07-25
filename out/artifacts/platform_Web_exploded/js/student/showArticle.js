var pageSize = 10;
var datas={
    currentPage:1,
    pageSize : pageSize
};
$(function () {
    var tno = $("#getTeacher2").val();
    $.ajax({
        type: "get",
        url: "AcaController/findAllAca",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                var iteam = data[i];
                $("#getAca2").each(function () {
                    $(this).append("<option value='" + iteam.id + "'>" + iteam.name + "</option>");
                });
            }
        }
    });
    $("#getAca2:eq(0)").change(function () {
        var aca_id = $(this).val();
        //获取学院所有专业
        var datas = {
            aca_id: aca_id
        };
        $.ajax({
            url: "MajorController/findAllMajor",
            type: "get",
            data: datas,
            dataType: "json",
            success: function (data) {
                $("#getMajor2").empty();
                $("#getMajor2").append("<option value='-1'> 请选择</option>");
                $("#getTeacher2").empty();
                $("#getTeacher2").append("<option value='-1'> 请选择</option>");
                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    var iteam = data[i];
                    $("#getMajor2").append("<option value=" + iteam.id + ">  " + iteam.name + " </option>");
                }
            }
        })
    })
    $("#getMajor2:eq(0)").change(function () {
        var major_id = $(this).val();

        //获取专业所有老师
        var datas = {
            major_id: major_id
        };
        $.ajax({
            url: "TeaController/findAllTeacher",
            type: "get",
            data: datas,
            dataType: "json",
            success: function (data) {
                $("#getTeacher2").empty();
                $("#getTeacher2").append("<option value='-1'> 请选择</option>");
                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    var iteam = data[i];
                    $("#getTeacher2").append("<option value=" + iteam.tno + ">  " + iteam.tname + " </option>");
                }
            }
        })
    })
})

$.ajax({
    url : "ArticleController/findAllArticle",
    data : datas,
    type : "post",
    dataType : "json",
    success:function (data) {
        var currentPage = data.currentPage;
        var totlePageSize=data.totlePageSize;
        var count=data.count;
        var datas=	data.list;
        $("#currentPage").html(currentPage);
        $("#totlePageSize").html(totlePageSize);
        $("#totleCount").html(count);
        for(var i=0;i<datas.length;i++){
            var rowdata=datas[i];
            $("#lookArticle").append("	<tr>"+
                "<td>"+"<a href='stu_lookArticle.jsp?id="+rowdata.id+"'>"+rowdata.title+"</a>"+"</td>"+
                "<td>"+rowdata.tname+"</td>"+
                "<td>"+rowdata.uploadDate  +"</td>"+
                "<td>"+rowdata.lookNumber +"</td>"+
                "</tr>");
        }
    }
})

function js_previous() {
    var currentPage = $("#currentPage").html();
    var totlePageSize = $("#totlePageSize").html();
    if(currentPage == 1){
        alert("已经是第一页！");
    }else{
        currentPage = currentPage - 1;
        var datas={
            sno:sno,
            currentPage:currentPage,
            pageSize : pageSize
        };
        $.ajax({
            url: "ArticleController/findAllArticle",
            type:"post",
            data:datas,
            dataType:"json",
            success:function(data){
                $("#insert_mes").empty();
                var currentPage = data.currentPage;
                var totlePageSize=data.totlePageSize;
                var count=data.count;
                var datas=	data.list;
                $("#currentPage").html(currentPage);
                $("#totlePageSize").html(totlePageSize);
                $("#totleCount").html(count);
                for(var i=0;i<datas.length;i++){
                    var rowdata=datas[i];
                    $("#lookArticle").append("	<tr>"+
                        "<td>"+"<a href='stu_lookArticle.jsp?id="+rowdata.id+"'>"+rowdata.title+"</a>"+"</td>"+
                        "<td>"+rowdata.tname+"</td>"+
                        "<td>"+rowdata.uploadDate  +"</td>"+
                        "<td>"+rowdata.lookNumber +"</td>"+
                        "</tr>");
                }
            }
        })

    }
}

function js_next() {
    var currentPage = $("#currentPage").html();
    var totlePageSize = $("#totlePageSize").html();
    console.log(currentPage);
    if(currentPage == totlePageSize || totlePageSize == 0) {
        alert("已经是最后一页！");
    }else{
        currentPage = parseInt(currentPage) + 1;
        console.log(currentPage);
        var datas={
            sno:sno,
            currentPage:currentPage,
            pageSize : pageSize
        };
        $.ajax({
            url: "ArticleController/findAllArticle",
            type:"post",
            data:datas,
            dataType:"json",
            success:function(data){
                $("#insert_mes").empty();
                var currentPage = data.currentPage;
                var totlePageSize=data.totlePageSize;
                var count=data.count;
                var datas=	data.list;
                $("#currentPage").html(currentPage);
                $("#totlePageSize").html(totlePageSize);
                $("#totleCount").html(count);
                for(var i=0;i<datas.length;i++){
                    var rowdata=datas[i];
                    $("#lookArticle").append("	<tr>"+
                        "<td>"+"<a href='stu_lookArticle.jsp?id="+rowdata.id+"'>"+rowdata.title+"</a>"+"</td>"+
                        "<td>"+rowdata.tname+"</td>"+
                        "<td>"+rowdata.uploadDate  +"</td>"+
                        "<td>"+rowdata.lookNumber +"</td>"+
                        "</tr>");
                }
            }
        })
    }
}