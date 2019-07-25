$("#currentPage3").html(1);
console.log($("#currentPage3").html());
var datas = {
    currentPage : $("#currentPage3").html(),
    pageSize : 10,
    tno:tno
};
showTeaArticle(datas);
function showTeaArticle(datas) {
    $.ajax({
        url: "ArticleController/findArticle",
        data: datas,
        type: "post",
        dataType: "json",
        success: function (data) {
            $("#show_article").empty();
            var currentPage = data.currentPage;
            var totlePageSize = data.totlePageSize;
            var count = data.count;
            $("#currentPage3").html(currentPage);
            $("#totlePageSize3").html(totlePageSize);
            $("#totleCount3").html(count);
            var datass = data.list;
            for (var i = 0; i < datass.length; i++) {
                var rowdata = datass[i];
                $("#show_article").append("<tr>" +
                    "<td>" + "<a href='tea_lookArticle.jsp?id=" + rowdata.id + "'>" + rowdata.title + "</td>" +
                    "<td>" + rowdata.tname + "</td>" +
                    "<td>" + rowdata.uploadDate + "</td>" +
                    "<td>" + rowdata.praiseNumber + "</td>" +
                    "<td>" + rowdata.badNumber + "</td>" +
                    "<td>" + rowdata.collNumber + "</td>" +
                    "<td>" + "<a href='javascript(0)' onclick='deleteArticle(" + rowdata.id + ")'>" + "删除" + "</a>" + "</td>" +
                    "</tr>");
            }
        }
    })
}
function deleteArticle(id) {
    $.ajax({
        url:"ArticleController/deleteById",
        data:{"id":id},
        type:"post",
        dataType:"json",
        success:function (data) {
            if(data.code == 1){
                alert("删除成功");
            }
        }
    })
}
function js_previous3() {
    var currentPage  = $("#currentPage3").html();
    if(currentPage == 1){
        alert("已经是第一页");
    }else{
        var datas = {
            currentPage : parseInt(currentPage)-1,
            pageSize : 10,
            tno:tno
        };
        showTeaArticle(datas);
    }
}
function js_next3() {
    var currentPage  = $("#currentPage3").html();
    var totlePageSize = $("#totlePageSize3").html();
    if(currentPage == totlePageSize){
        alert("已经是最后一页");
    }else{
        var datas = {
            currentPage : parseInt(currentPage)+1,
            pageSize : 10,
            tno:tno
        };
        showTeaArticle(datas);
    }
}