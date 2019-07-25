
var webSocket;
$.ajax({
    url:"ChatController/findByTno",
    data:{"tno":tno},
    type:"post",
    dataType:"json",
    success:function (data) {
        var chat = data.chat;
        if(data.code == 1){
            $(".create").hide();
            $(".chatRoom").show();
            $(".roomName").html("群聊名称："+chat.chatName);
            var url = "ws://localhost:8080/platform/webSocket/chat/"+ chat.chatName+"/"+ ssname;
            webSocket = new WebSocket(url);
            document.getElementsByClassName("msg_board")[0].innerHTML = "系统消息：您已经进入群聊，开始聊天吧"+"<br />";
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
                // alert("连接已关闭...");
                webSocket = null;
                document.getElementsByClassName("msg_board")[0].innerHTML = "";
                $.ajax({
                    url:"ChatController/deleteByTno",
                    data:{"tno":tno},
                    type:"post",
                    dataType:"json",
                    success:function (data) {
                        if(data.code == 1){
                            alert("解散成功");
                        }
                    }
                })
            };
        }
    }
})

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

function closeWs() {
    if(confirm("确定解散吗？")) {
        $(".create").show();
        $(".chatRoom").hide();
        webSocket.close();
    }
};

    function initWebSocket() {
    var roomName = document.getElementById("input_roomName").value;
    // 房间名不能为空
    if (roomName == null || roomName == "") {
        alert("请输入房间名");
        return;
    }
    $.ajax({
        url:"ChatController/findByName",
        data:{"chatName":roomName},
        type:"post",
        dataType:"json",
        success:function (data) {
            if(data.code == 1){
                alert("该房间已被创建");
                return;
            }else{
                if ("WebSocket" in window) {
//            alert("您的浏览器支持 WebSocket!");
                    if (webSocket == null) {
                        var url = "ws://localhost:8080/platform/webSocket/chat/"+ roomName+"/"+ ssname;
                        // 打开一个 web socket
                        webSocket = new WebSocket(url);
                        $(".create").hide();
                        $(".chatRoom").show();
                        $(".roomName").html("群聊名称："+$("#input_roomName").val());

                        document.getElementsByClassName("msg_board")[0].innerHTML = "系统消息：您已经进入群聊，开始聊天吧"+"<br />";
                    } else {
                        alert("您已进入聊天室...");

                    }

                    webSocket.onopen = function () {
                        //alert("已进入聊天室，畅聊吧...");
                        $.ajax({
                            url : "ChatController/insert",
                            data : {"tno":tno,"chatName":roomName},
                            type:"post",
                            dataType:"json",
                            success:function () {

                            }
                        })
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
                        // alert("连接已关闭..");
                        webSocket = null;
                        document.getElementsByClassName("msg_board")[0].innerHTML = "";
                        $.ajax({
                            url:"ChatController/deleteByTno",
                            data:{"tno":tno},
                            type:"post",
                            dataType:"json",
                            success:function (data) {
                                if(data.code == 1){
                                    alert("解散成功");
                                }
                            }
                        })
                    };

                }
                else {
                    // 浏览器不支持 WebSocket
                    alert("您的浏览器不支持 WebSocket!");
                }

            }
        }
    })



}

