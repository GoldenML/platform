//我的公告
var pageSize = 10;
var url2 = "TeaController/findTeacherPage";

//公告初始化获取
showTea(url2,{"pageSize":pageSize,"currentPage":1});
//公告初始化获取结束

// 我的公告结束
// 显示公告
function showTea(url, datas) {
    $.ajax({
        url: url,
        data: datas,
        type: "post",
        dataType: "json",
        success: function (data) {
            $("#showTeacher").empty();
            var currentPage = data.currentPage;
            var totlePageSize = data.totlePageSize;
            var count = data.count;
            $("#teaCurrentPage").html(currentPage);
            $("#teaTotlePageSize").html(totlePageSize);
            $("#teaTotleCount").html(count);

            var datass = data.list;
            var datass2 = data.list2;
            for (var i = 0; i < datass.length; i++) {
                var rowdata = datass[i];
                var rowdata2 = datass2[i];
                $("#showTeacher").append("	<tr>" +
                    "<td>" + rowdata.tno + "</td>" +
                    "<td>" + rowdata.tname + "</td>" +
                    "<td>" + rowdata.tphone + "</td>" +
                    "<td>" + rowdata2.temail + "</td>" +
                    "<td>" + rowdata2.taddress + "</td>" +
                    "<td>" + "<a href='javascript:void(0)' onclick='deleteTea(" + rowdata.tno + ")'>删除</a>" + "</td>" +
                    "</tr>");
            }
        }
    })
}

function deleteTea(tno) {
    if(confirm("确定删除？")){
        $.ajax({
            url:"TeaController/deleteByTno",
            data:{"tno":tno},
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data.code == 1){
                    alert("删除成功");
                    showTea(url2,{"currentPage":$("#teaCurrentPage").val(),"pageSize":pageSize})
                }
            }
        })
    }

}

//显示公告结束

// ============================================================================================================

//             公告前一页
function tea_previous() {
    var currentPage = $("#teaCurrentPage").html();
    if (currentPage == 1) {
        alert("已经是第一页");
    } else {
        currentPage = parseInt(currentPage) - 1;
        var datas = {
            currentPage: currentPage,
            pageSize: pageSize,
        };
        showTea(url2, datas);
    }
}

//公告前一页结束

// =============================================================================================================

//             公告下一页
function tea_next() {
    var currentPage = $("#teaCurrentPage").html();
    var totlePageSize = $("#teaTotlePageSize").html();
    if (currentPage == totlePageSize || totlePageSize == 0) {
        alert("已经是最后一页");
    } else {
        currentPage = parseInt(currentPage) + 1;
        console.log(currentPage);
        var datas = {
            currentPage: currentPage,
            pageSize: pageSize,
        };
        showTea(url2, datas);
    }
}

// 公告下一页结束

// =============================================================================================================
