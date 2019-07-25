var pageSize = 10;
var datas = {
    currentPage:1,
    pageSize : pageSize
};
$.ajax({
    url:"TeaFileController/findAllTeaFile",
    type : "post",
    data : datas,
    dataType : "json",
    success:function (data) {
        var currentPage = data.currentPage;
        var totlePageSize=data.totlePageSize;
        var count=data.count;
        $("#currentPage2").html(currentPage);
        $("#totlePageSize2").html(totlePageSize);
        $("#totleCount2").html(count);
        var datas = data.list;
        for(var i = 0;i<datas.length;i++){
            var rowdata = datas[i];
            $("#lookfile").append("<tr>"+
                "<td>"+rowdata.fileName+"</td>"+
                "<td>"+rowdata.tname+"</td>"+
                "<td>"+rowdata.uploadDate+"</td>"+
                "<td>"+
                "<a href='TeaFileController/downLoadFile?id="+rowdata.id+"'>"+"下载"+"</a>"
                +"</td>"+
                "</tr>");
        }
    }
})

function js_previous2() {
    var currentPage = $("#currentPage2").html();
    var totlePageSize = $("#totlePageSize2").html();
    if(currentPage == 1){
        alert("已经是第一页！");
    }else{
        currentPage = currentPage - 1;
        var datas={
            currentPage:currentPage,
            pageSize : pageSize
        };
        $.ajax({
            url:"TeaFileController/findAllTeaFile",
            type:"post",
            data:datas,
            dataType:"json",
            success:function(data){
                $("#lookfile").empty();
                var currentPage = data.currentPage;
                var totlePageSize=data.totlePageSize;
                var count=data.count;
                var datas=	data.list;
                $("#currentPage2").html(currentPage);
                $("#totlePageSize2").html(totlePageSize);
                $("#totleCount2").html(count);
                for(var i=0;i<datas.length;i++){
                    var rowdata=datas[i];
                    $("#lookfile").append("<tr>"+
                        "<td>"+rowdata.fileName+"</td>"+
                        "<td>"+rowdata.tname+"</td>"+
                        "<td>"+rowdata.uploadDate+"</td>"+
                        "<td>"+
                        "<a href='TeaFileController/downLoadFile?id="+rowdata.id+"'>"+"下载"+"</a>"
                        +"</td>"+
                        "</tr>");
                }
            }
        })

    }
}

function js_next2() {
    var currentPage = $("#currentPage2").html();
    var totlePageSize = $("#totlePageSize2").html();
    console.log(currentPage);
    console.log(totlePageSize);
    if(currentPage == totlePageSize || totlePageSize == 0) {
        alert("已经是最后一页！");
    }else{
        currentPage = parseInt(currentPage) + 1;
        console.log(currentPage);
        var datas={
            currentPage:currentPage,
            pageSize : pageSize
        };
        $.ajax({
            url:"TeaFileController/findAllTeaFile",
            type:"post",
            data:datas,
            dataType:"json",
            success:function(data){
                $("#lookfile").empty();
                var currentPage = data.currentPage;
                var totlePageSize=data.totlePageSize;
                var count=data.count;
                var datas=	data.list;
                $("#currentPage2").html(currentPage);
                $("#totlePageSize2").html(totlePageSize);
                $("#totleCount2").html(count);
                for(var i=0;i<datas.length;i++){
                    var rowdata=datas[i];
                    $("#lookfile").append("<tr>"+
                        "<td>"+rowdata.fileName+"</td>"+
                        "<td>"+rowdata.tname+"</td>"+
                        "<td>"+rowdata.uploadDate+"</td>"+
                        "<td>"+
                        "<a href='TeaFileController/downLoadFile?id="+rowdata.id+"'>"+"下载"+"</a>"
                        +"</td>"+
                        "</tr>");
                }
            }
        })
    }
}