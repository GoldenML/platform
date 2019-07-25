var url = "AnnouncementController/findByStatus";
var status = $("#selectStatus").val();
var pageSize = 10;
showAnnounce(url,{"status":status,currentPage:1,"pageSize":pageSize});
showCount0();
setInterval("showCount0()",10000);
var oldStatus = $(".badge").html();
function showCount0() {
    var newStatus = $(".badge").html();
    if(newStatus != oldStatus){
        showAnnounce(url,{"status":$("#selectStatus").val(),currentPage:1,"pageSize":pageSize});
        oldStatus = newStatus;
    }
    $.ajax({
        url:  "AnnouncementController/findCount0",
        type: "get",
        dataType: "json",
        success: function (data) {
            $(".badge").html(data.count);
        }
    })
}

function showAnnounce(url,datas) {
    $.ajax({
        url: url,
        data: datas,
        type: "post",
        dataType: "json",
        success: function (data) {
            $("#announce").empty();
            var currentPage = data.currentPage;
            var totlePageSize = data.totlePageSize;
            var count = data.count;
            $("#announceCurrentPage").html(currentPage);
            $("#announceTotlePageSize").html(totlePageSize);
            $("#announceTotleCount").html(count);
            // $(".badge").html(data.count2);

            var datass = data.list;
            var datass2 = data.list2;
            for (var i = 0; i < datass.length; i++) {
                var rowdata = datass[i];
                var rowdata2 = datass2[i];
                if(rowdata.handleStatus == ""){
                    rowdata.handleStatus = "未处理";
                }
                if(datas.status == 0){
                    $("#announce").append("	<tr>" +
                        "<td>" + rowdata.tno + "</td>" +
                        "<td>" + rowdata2.tname + "</td>" +
                        "<td>" + rowdata.content + "</td>" +
                        "<td>" + rowdata.time + "</td>" +
                        "<td>" + rowdata.handleStatus + "</td>" +
                        "<td>" + "<a href='javascript:void(0)' onclick='yesAnnounce(" + rowdata.id + ")'>允许</a>" +
                        "/"+"<a href='javascript:void(0)' onclick='noAnnounce(" + rowdata.id + ")'>不允许</a>" +
                        "</td>" +
                        "</tr>");
                }else{
                    $("#announce").append("	<tr>" +
                        "<td>" + rowdata.tno + "</td>" +
                        "<td>" + rowdata2.tname + "</td>" +
                        "<td>" + rowdata.content + "</td>" +
                        "<td>" + rowdata.time + "</td>" +
                        "<td>" + rowdata.handleStatus + "</td>" +
                        "<td>" + "<a href='javascript:void(0)' onclick='deleteAnnounce(" + rowdata.id + ")'>删除</a>" +
                        // "/"+"<a href='javascript:void(0)' onclick='noAnnounce(" + rowdata.id + ")'>不允许</a>" +
                        "</td>" +
                        "</tr>");
                }

            }
        }

    })
}
function yesAnnounce(id){
    if(confirm("允许？")) {
        $.ajax({
            url: "AnnouncementController/agreeAnnounce",
            data: {"id": id},
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.code == 1) {
                    showAnnounce(url,{"status":$("#selectStatus").val(),currentPage:1,"pageSize":pageSize});
                }
            }
        })
    }
}
function noAnnounce(id){
    if(confirm("不允许？")) {
        $.ajax({
            url: "AnnouncementController/disagreeAnnounce",
            data: {"id": id},
            type: "post",
            dataType: "json",
            success: function (data) {
                if (data.code == 1) {
                    showAnnounce(url,{"status":$("#selectStatus").val(),currentPage:1,"pageSize":pageSize});
                }
            }
        })
    }
}
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
                    showAnnounce(url,{"status":$("#selectStatus").val(),currentPage:1,"pageSize":pageSize});
                }
            }
        })
    }
}

$("#selectStatus:eq(0)").change(function () {
    var status = $(this).val();
    showAnnounce(url,{"status":$("#selectStatus").val(),currentPage:1,"pageSize":pageSize});
})
function announce_previous() {
    var currentPage = $("#announceCurrentPage").html();
    var status = $("#selectStatus").val();
    if (currentPage == 1) {
        alert("已经是第一页");
    } else {
        currentPage = parseInt(currentPage) - 1;
        showAnnounce(url,{"status":status,currentPage:currentPage,"pageSize":pageSize});
    }
}
function announce_next() {
    var currentPage = $("#announceCurrentPage").html();
    var totlePageSize = $("#announceTotlePageSize").html();
    var status = $("#selectStatus").val();
    if (currentPage == totlePageSize || totlePageSize == 0) {
        alert("已经是最后一页");
    } else {
        currentPage = parseInt(currentPage) + 1;
        showAnnounce(url,{"status":status,currentPage:currentPage,"pageSize":pageSize});
    }
}