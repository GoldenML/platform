
var webSocket;
var tno = $("#getTeacher2").val();
function send_msg() {
    if (webSocket != null) {
        var input_msg = document.getElementById("input_msg").value.trim();
        if (input_msg == "") {
            return;
        }
        webSocket.send(input_msg);
        // 清除input框里的信息
        document.getElementById("input_msg").value = "";
    } else {
        alert("您已掉线，请重新进入聊天室...");
    }
};

// function closeWs() {
//     $(".create").show();
//     $(".chatRoom").hide();
//     webSocket.close();
// };
//
// function f1(tno) {
//     $.ajax({
//         url: "ChatController/findByTno",
//         data: {"tno": tno},
//         type: "post",
//         dataType: "json",
//         success: function (data) {
//             if (data.code != 1){
//                 closeWs();
//             }
//         }
//     })
// }

function initWebSocket(tno) {
    // var roomName = document.getElementById("input_roomName").value;
    // // 房间名不能为空
    // if (roomName == null || roomName == "") {
    //     alert("请输入房间名");
    //     return;
    // }
    $.ajax({
        url : "ChatController/findByTno",
        data : {"tno":tno},
        type:"post",
        dataType:"json",
        success:function (data) {
            if (data.code == 1) {
                console.log(typeof data);
                var chat = data.chat;
                $(".roomName").html("群聊名称：" + chat.chatName);
                $(".teaName").html(chat.chatName);
                console.log($(".teaName").html());
                // 打开一个 web socket
                if ("WebSocket" in window) {
//            alert("您的浏览器支持 WebSocket!");
                    if (webSocket == null) {
                        var roomName = $(".teaName").html();
                        console.log(roomName);
                        var url = "ws://localhost:8080/platform/webSocket/chat/" + roomName + "/" + ssname;
                        webSocket = new WebSocket(url);
                        $(".create").hide();
                        $(".chatRoom").show();
                        document.getElementsByClassName("msg_board")[0].innerHTML = "系统消息：您已经进入群聊，开始聊天吧" + "<br />";
                        setInterval("f1(tno)", 30000);
                    } else {
                        alert("您已进入聊天室...");
                    }

                    webSocket.onopen = function () {
                        //alert("已进入聊天室，畅聊吧...");
                    };

                    webSocket.onmessage = function (evt) {
                        var msg_board = document.getElementsByClassName("msg_board")[0];
                        var received_msg = evt.data;
                        var old_msg = msg_board.innerHTML;
                        msg_board.innerHTML = old_msg + received_msg + "<br>";
                        // 让滚动块往下移动
                        msg_board.scrollTop = msg_board.scrollTop + 40;
                    };

                    webSocket.onclose = function () {
                        // 关闭 websocket，清空信息板
                        alert("已退出");
                        webSocket = null;
                        document.getElementsByClassName("msg_board")[0].innerHTML = "";
                    };
                } else {
                    // 浏览器不支持 WebSocket
                    alert("您的浏览器不支持 WebSocket!");
                }
            }else{
                alert("老师还未创建聊天室");
            }
        }
    })

}
