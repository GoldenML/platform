//我的公告
var pageSize = 10;
var url = "AnnouncementController/findByTno";

//公告初始化获取
showAnnounce(url,{"tno":tno,"pageSize":pageSize,"currentPage":1});
//公告初始化获取结束

// 我的公告结束
// 显示公告
function showAnnounce(url, datas) {
    $.ajax({
        url: url,
        data: datas,
        type: "post",
        dataType: "json",
        success: function (data) {
            var currentPage = data.currentPage;
            var totlePageSize = data.totlePageSize;
            var count = data.count;
            $("#announceCurrentPage").html(currentPage);
            $("#announceTotlePageSize").html(totlePageSize);
            $("#announceTotleCount").html(count);

            var datass = data.list;

            for (var i = 0; i < datass.length; i++) {
                var rowdata = datass[i];
                if(rowdata.status == 0){
                    rowdata.status = "未处理";
                }else{
                    rowdata.status = "已处理";
                }
                if(rowdata.handleStatus == ""){
                    rowdata.handleStatus = "等待";
                }
                $("#announcement").append("	<tr>" +
                    "<td>" + rowdata.content + "</td>" +
                    "<td>" + rowdata.time + "</td>" +
                    "<td>" + rowdata.handleStatus + "</td>" +
                    "<td>" + rowdata.status + "</td>" +
                    "<td>" + "<a href='javascript:void(0)' onclick='deleteAnnounce(" + rowdata.id + ")'>删除</a>" + "</td>" +
                    "</tr>");
            }
        }
    })
}

//显示公告结束

// ============================================================================================================

//             公告前一页
function announce_previous() {
    var currentPage = $("#announceCurrentPage").html();
    if (currentPage == 1) {
        alert("已经是第一页");
    } else {
        currentPage = currentPage - 1;
        var datas = {
            tno: tno,
            currentPage: currentPage,
            pageSize: pageSize,
        };
        showAnnounce(url, datas);
    }
}

//公告前一页结束

// =============================================================================================================

//             公告下一页
function announce_next() {
    var currentPage = $("#announceCurrentPage").html();
    var totlePageSize = $("#announceTotlePageSize").html();
    if (currentPage == totlePageSize || totlePageSize == 0) {
        alert("已经是最后一页");
    } else {
        currentPage = currentPage + 1;
        var datas = {
            tno: tno,
            currentPage: currentPage,
            pageSize: pageSize,
        };
        showAnnounce(url, datas);
    }
}

// 公告下一页结束

// =============================================================================================================

//发布公告
$(function () {
    $("#fabu").click(function () {
        var content = document.getElementById("annouceContent").value;
        var datas = {
            tno : tno,
            content : content
        };
        $.ajax({
            url : "AnnouncementController/insert",
            data : datas,
            type : "post",
            dataType : "json",
            success:function (data) {
                if(data.code == 1)
                    alert("已发布");
            }
        })
    })
})
//发布公告结束

function deleteAnnounce(id){
    if(confirm("确定删除吗？")){
        $.ajax({
            url:"AnnouncementController/deleteById",
            data:{"id":id},
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data.code == 1){
                    alert("删除成功");
                    showAnnounce(url,{"tno":tno,"pageSize":pageSize,"currentPage":1});
                }
            }
        })
    }
}