$(function() {
    // 修改信息
    $("#alter_information").click(function () {
        var sname = $("#sname").val();
        var sphone = $("#sphone").val();
        var sgender = $("#sgender").val();
        var sage = $("#sage").val();
        var semail = $("#semail").val();
        var saddress = $("#saddress").val();
        var sbirth = $("#sbirth").val();
        var sintro = $("#sintro").val();

        var datas={
            sno:sno,
            sname: sname,
            sphone:sphone,
            saddress:saddress,
            sgender:sgender,
            semail:semail,
            sbirth:sbirth,
            sintro:sintro,
            sage:sage
        };

        $.ajax({
            type:"post",
            url:"StuController/alter_information",
            data:datas,
            dataType:'json',
            success:function (data) {
                if(data.code==1)
                    alert("修改成功！");
                else
                    alert("修改失败");
            }
        })
    })
    //修改密码
    $("#alter").click(function () {
        var old_passwd = $("#old_passwd").val();
        var new_passwd = $("#new_passwd").val();
        var repeat_passwd = $("#repeat_passwd").val();
        if(new_passwd == null || new_passwd ==""){
            alert("密码不能为空");
        }else if(new_passwd != repeat_passwd){
            alert("两次密码不一致");
        }else{
            var datas = {
                old_passwd:old_passwd,
                new_passwd:new_passwd,
                sno:sno
            };
            $.ajax({
                type:"post",
                url:"StuController/alter_passwd",
                data:datas,
                dataType:'json',
                success:function (data) {
                    if(data.code==1)
                        alert("修改成功！");
                    else if(data.code==2)
                        alert("原密码错误");
                    else
                        alert("修改失败");
                }
            })
        }
    })
})