// $(function(){
//     var datass = {
//         id:tno
//     };
//
//     $.ajax({
//         url : "TeaFileController/findTeaAllFile",
//         type : "post",
//         data : datass,
//         dataType : "json",
//         success:function (data) {
//             var datas = data.list;
//
//             for(var i=0;i<datas.length;i++) {
//                 var rowdata = datas[i];
//                 $("#Allfile").append("<tr>"+
//                     "<td>"+"<a href='javascript:void(0)' onclick='lookFileContent("+rowdata.id+")'>"+rowdata.fileName+"</a>"+"</td>"+
//                     "<td>"+rowdata.uploadDate+"</td>"+
//                     "<td>"+rowdata.downloadNumber+"</td>"+
//                     "<td>"+"<a href='javascript:void(0)' onclick='deleteFile("+rowdata.id+")'>"+"删除"+"</a>"+"</td>"+
//                     "</tr>");
//             }
//         }
//
//     })
// })
var url = "TeaFileController/findTeaAllFile";
var pageSize = 10;
var datas={
    currentPage:1,
    pageSize : pageSize,
    id:tno
};
showFile(datas,url);
//前一页

function js_previous2() {
    var currentPage = $("#currentPage2").html();
    var totlePageSize = $("#totlePageSize2").html();
    if(currentPage == 1){
        alert("已经是第一页！");
    }else{
        currentPage = currentPage - 1;
        var datas={
            id:tno,
            currentPage:currentPage,
            pageSize : pageSize
        };
        showFile(url)

    }
}
//下一页
function js_next2() {
    var currentPage = $("#currentPage2").html();
    var totlePageSize = $("#totlePageSize2").html();
    console.log(currentPage);
    if(currentPage == totlePageSize || totlePageSize == 0) {
        alert("已经是最后一页！");
    }else{
        currentPage = parseInt(currentPage) + 1;
        console.log(currentPage);
        var datas={
            id:tno,
            currentPage:currentPage,
            pageSize : pageSize
        };
        showFile(datas,url);
    }
}

function showFile(datas,url){
    $.ajax({
        url:url,
        type:"post",
        data:datas,
        dataType:"json",
        success:function(data){
            $("#Allfile").empty();
            var currentPage = data.currentPage;
            var totlePageSize=data.totlePageSize;
            var count=data.count;
            console.log(currentPage);
            console.log(totlePageSize);
            console.log(count);
            var datas=	data.list;
            $("#currentPage2").html(currentPage);
            $("#totlePageSize2").html(totlePageSize);
            $("#totleCount2").html(count);
            for(var i=0;i<datas.length;i++){
                var rowdata=datas[i];
                $("#Allfile").append("<tr>"+
                    "<td>"+"<a href='javascript:void(0)' onclick='lookFileContent("+rowdata.id+")'>"+rowdata.fileName+"</a>"+"</td>"+
                    "<td>"+rowdata.uploadDate+"</td>"+
                    "<td>"+rowdata.downloadNumber+"</td>"+
                    "<td>"+"<a href='javascript:void(0)' onclick='deleteFile("+rowdata.id+")'>"+"删除"+"</a>"+"</td>"+
                    "</tr>");
            }
        }
    })
}
function deleteFile(id) {
    if(confirm("确定删除吗？")){
        var id = id;
        var datas = {
            id : id
        };
        $.ajax({
            url : "TeaFileController/deleteFile",
            data : datas,
            type : "post",
            dataType : "json",
            success:function (data) {
                if(data.code == 1){
                    alert("删除成功");
                    var dataS={
                        currentPage:1,
                        pageSize : pageSize,
                        tno:tno
                    };
                    showFile(datas,url);
                }
            }
        })
    }else{

    }
}