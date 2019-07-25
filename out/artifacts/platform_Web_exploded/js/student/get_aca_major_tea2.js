$(function () {
    var tno = $("#getTeacher2").val();
    $.ajax({
        type: "get",
        url: "AcaController/findAllAca",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                var iteam = data[i];
                $("#getAca2").each(function () {
                    $(this).append("<option value='" + iteam.id + "'>" + iteam.name + "</option>");
                });
            }
        }
    });
    $("#getAca2:eq(0)").change(function () {
        var aca_id = $(this).val();


        //获取学院所有专业
        var datas = {
            aca_id: aca_id
        };
        $.ajax({
            url: "MajorController/findAllMajor",
            type: "get",
            data: datas,
            dataType: "json",
            success: function (data) {
                $("#getMajor2").empty();
                $("#getMajor2").append("<option value='-1'> 请选择</option>");
                $("#getTeacher2").empty();
                $("#getTeacher2").append("<option value='-1'> 请选择</option>");
                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    var iteam = data[i];
                    $("#getMajor2").append("<option value=" + iteam.id + ">  " + iteam.name + " </option>");
                }
            }
        })
    })
    $("#getMajor2:eq(0)").change(function () {
        var major_id = $(this).val();

        //获取专业所有老师
        var datas = {
            major_id: major_id
        };
        $.ajax({
            url: "TeaController/findAllTeacher",
            type: "get",
            data: datas,
            dataType: "json",
            success: function (data) {
                $("#getTeacher2").empty();
                $("#getTeacher2").append("<option value='-1'> 请选择</option>");
                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    var iteam = data[i];
                    $("#getTeacher2").append("<option value=" + iteam.tno + ">  " + iteam.tname + " </option>");
                }
            }
        })
    })
})