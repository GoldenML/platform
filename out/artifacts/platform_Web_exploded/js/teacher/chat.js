
// 创建WebSocket对象
var webSocket = new WebSocket("ws://localhost:8080/platform/onlineChat");
var sendMsg = function() {
    var inputElement = document.getElementById('msg');
    if (inputElement.value == '')
        alert("输入内容不为空");
    else {
        // 发送消息
        webSocket.send(inputElement.value);
        // 清空单行文本框
        inputElement.value = "";
    }
}
var send = function(event) {
    if (event.keyCode == 13) {
        sendMsg();
    }
};
webSocket.onopen = function() {
    // n = prompt('请给自己取一个昵称：');
    // if (n != '' && n != null)
    //     webSocket.send(n);
    // else
    // //设置游客登录
    //     webSocket.send("游客" + Math.random() * 100000000000000000);
    webSocket.send(ssname);
    document.getElementById('msg').onkeydown = send;
    document.getElementById('sendBn').onclick = sendMsg;
};
// 为onmessage事件绑定监听器，接收消息
webSocket.onmessage = function(event) {
    var show = document.getElementById('show');
    // 接收、并显示消息
    show.innerHTML += new Date() + "<br/>" + event.data + "<br/>";
    var content = event.data;
    // var datas = {
    //     content : content,
    //     sno : sno,
    //     tno : tno,
    // };
    // $.ajax({
    //     url : "ChatController/insert",
    //     data : datas,
    //     type : "post",
    //     dataType : "json",
    // })
    //让聊天框滚动条始终显示新消息
    show.scrollTop = show.scrollHeight;
}
webSocket.onclose = function() {
    document.getElementById('msg').onkeydown = null;
    document.getElementById('sendBn').onclick = null;
    console.log('WebSocket已经被关闭。');
};