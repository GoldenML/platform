$(function () {
    $("#alter_information2").click(function () {
        var tphone = $("#tphone").val();
        var tgender = $("#tgender").val();
        var tage = $("#tage").val();
        var temail = $("#temail").val();
        var taddress = $("#taddress").val();
        var tbirth = $("#tbirth").val();
        var tintro = $("#tintro").val();
        console.log("111");
        var datas={
            tno:tno,
            tphone:tphone,
            taddress:taddress,
            tgender:tgender,
            temail:temail,
            tbirth:tbirth,
            tintro:tintro,
            tage:tage
        };

        $.ajax({
            type:"post",
            url:"TeaController/alter_information",
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
                tno:tno
            };
            $.ajax({
                type:"post",
                url:"TeaController/alter_passwd",
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
