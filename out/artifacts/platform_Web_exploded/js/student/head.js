function showCourseware() {
    $("#courseware").show();
    $("#display_article").hide();
    $("#indexPage").hide();
    $(".jumbotron").hide();
    document.getElementById("index").className = "";
    document.getElementById("course").className = "active";
    document.getElementById("article").className = "";
}
function showIndex() {
    $("#courseware").hide();
    $("#indexPage").show();
    $("#display_article").hide();
    document.getElementById("index").className = "active";
    document.getElementById("course").className = "";
    document.getElementById("article").className = "";
}
function showVideo() {
    $("#courseware").hide();
    document.getElementById("index").className = "";
    document.getElementById("course").className = "";
    document.getElementById("article").className = "";
}
function showArticle() {
    $("#courseware").hide();
    $("#display_article").show();
    $("#indexPage").hide();
    $(".jumbotron").hide();
    document.getElementById("index").className = "";
    document.getElementById("course").className = "";
    document.getElementById("article").className = "active";
}
// function chat() {
//     $(".create").hide();
//     $(".chatRoom").show();
//     document.getElementById("selectK").className = "";
//     document.getElementById("chat").className = "ccc";
// }
// function returnS(){
//     $("#chatRoom").hide();
//     $("#create").show();
//     document.getElementById("selectK").className = "ccc";
//     document.getElementById("chat").className = "";
// }