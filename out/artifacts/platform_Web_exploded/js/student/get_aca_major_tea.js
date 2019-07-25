
$(function () {
    var tno = $("#getTeacher").val();
    $.ajax({
        type: "get",
        url: "AcaController/findAllAca",
        dataType: "json",
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                var iteam = data[i];
                $("#getAca").each(function () {
                    $(this).append("<option value='" + iteam.id + "'>" + iteam.name + "</option>");
                });
            }
        }
    });

    $("#getAca:eq(0)").change(function () {
        $("#page").hide();
        $("#page1").show();
        $("#page2").hide();
        $("#page3").hide();
        var aca_id = $(this).val();
        //获取所属学院所有课件
        var url = "TeaFileController/findAcaAllFile";
        showFile(aca_id,url);


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
                $("#getMajor").empty();
                $("#getMajor").append("<option value='-1'> 请选择</option>");
                $("#getTeacher").empty();
                $("#getTeacher").append("<option value='-1'> 请选择</option>");
                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    var iteam = data[i];
                    $("#getMajor").append("<option value=" + iteam.id + ">  " + iteam.name + " </option>");
                }
            }
        })
    })
    //专业变化
    $("#getMajor:eq(0)").change(function () {
        $("#page").hide();
        $("#page1").hide();
        $("#page2").show();
        $("#page3").hide();
        var major_id = $(this).val();
        var url = "TeaFileController/findMajorAllFile";
        showFile(major_id,url);

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
                $("#getTeacher").empty();
                $("#getTeacher").append("<option value='-1'> 请选择</option>");
                console.log(data.length);
                for (var i = 0; i < data.length; i++) {
                    var iteam = data[i];
                    $("#getTeacher").append("<option value=" + iteam.tno + ">  " + iteam.tname + " </option>");
                }
            }
        })
    })


    $("#getTeacher:eq(0)").change(function () {
        $("#page").hide();
        $("#page1").hide();
        $("#page2").hide();
        $("#page3").show();
        var tno = $(this).val();
        var url = "TeaFileController/findTeaAllFile";
        showFile(tno,url);
    })


    var pageSize = 10;

    function showFile(id,url){
        var datas = {
            id:id,
            currentPage:1,
            pageSize : pageSize
        };
        $.ajax({
            url:url,
            type:"post",
            data:datas,
            dataType:"json",
            success:function (data) {
                $("#lookfile").empty();
                var currentPage = data.currentPage;
                var totlePageSize=data.totlePageSize;
                var count=data.count;
                var datas=	data.list;
                $("#currentPage2").html(currentPage);
                $("#totlePageSize2").html(totlePageSize);
                $("#totleCount2").html(count);
                var datas = data.list;
                for(var i = 0;i<datas.length;i++){
                    var rowdata = datas[i];
                    $("#lookfile").append("<tr>"+
                        "<td>"+rowdata.fileName+"</td>"+
                        "<td>"+rowdata.tname+"</td>"+
                        "<td>"+rowdata.uploadDate+"</td>"+
                        "<td>"+
                        "<a href='TeaFileController/downLoadFile?id="+rowdata.id+"'>"+"下载"+"</a>"
                        +"</td>"+
                        "</tr>");
                }
            }

        })
    }

    // $.ajax({
    //     url:"TeaFileController/findAllTeaFile",
    //     type : "post",
    //     data : datas,
    //     dataType : "json",
    //     success:function (data) {
    //         var currentPage = data.currentPage;
    //         var totlePageSize=data.totlePageSize;
    //         var count=data.count;
    //         $("#currentPage2").html(currentPage);
    //         $("#totlePageSize2").html(totlePageSize);
    //         $("#totleCount2").html(count);
    //         var datas = data.list;
    //         for(var i = 0;i<datas.length;i++){
    //             var rowdata = datas[i];
    //             $("#lookfile").append("<tr>"+
    //                 "<td>"+rowdata.fileName+"</td>"+
    //                 "<td>"+rowdata.tname+"</td>"+
    //                 "<td>"+rowdata.uploadDate+"</td>"+
    //                 "<td>"+
    //                 "<a href='TeaFileController/downLoadFile?id="+rowdata.id+"'>"+"下载"+"</a>"
    //                 +"</td>"+
    //                 "</tr>");
    //         }
    //     }
    // })

    function js_previous2(id,url) {
        var currentPage = $("#currentPage").html();
        var totlePageSize = $("#totlePageSize").html();
        if(currentPage == 1){
            alert("已经是第一页！");
        }else{
            currentPage = currentPage - 1;
            var datas={
                id:id,
                currentPage:currentPage,
                pageSize : pageSize
            };
            $.ajax({
                url: url,
                type:"post",
                data:datas,
                dataType:"json",
                success:function(data){
                    $("#lookfile").empty();
                    var currentPage = data.currentPage;
                    var totlePageSize=data.totlePageSize;
                    var count=data.count;
                    var datas=	data.list;
                    $("#currentPage2").html(currentPage);
                    $("#totlePageSize2").html(totlePageSize);
                    $("#totleCount2").html(count);
                    for(var i=0;i<datas.length;i++){
                        var rowdata=datas[i];
                        $("#lookfile").append("<tr>"+
                            "<td>"+rowdata.fileName+"</td>"+
                            "<td>"+rowdata.tname+"</td>"+
                            "<td>"+rowdata.uploadDate+"</td>"+
                            "<td>"+
                            "<a href='TeaFileController/downLoadFile?id="+rowdata.id+"'>"+"下载"+"</a>"
                            +"</td>"+
                            "</tr>");
                    }
                }
            })

        }
    }

    function js_next2(id,url) {
        var currentPage = $("#currentPage").html();
        var totlePageSize = $("#totlePageSize").html();
        console.log(currentPage);
        if(currentPage == totlePageSize || totlePageSize == 0) {
            alert("已经是最后一页！");
        }else{
            currentPage = parseInt(currentPage) + 1;
            console.log(currentPage);
            var datas={
                id:id,
                currentPage:currentPage,
                pageSize : pageSize
            };
            $.ajax({
                url:url,
                type:"post",
                data:datas,
                dataType:"json",
                success:function(data){
                    $("#lookfile").empty();
                    var currentPage = data.currentPage;
                    var totlePageSize=data.totlePageSize;
                    var count=data.count;
                    var datas=	data.list;
                    $("#currentPage2").html(currentPage);
                    $("#totlePageSize2").html(totlePageSize);
                    $("#totleCount2").html(count);
                    for(var i=0;i<datas.length;i++){
                        var rowdata=datas[i];
                        $("#lookfile").append("<tr>"+
                            "<td>"+rowdata.fileName+"</td>"+
                            "<td>"+rowdata.tname+"</td>"+
                            "<td>"+rowdata.uploadDate+"</td>"+
                            "<td>"+
                            "<a href='TeaFileController/downLoadFile?id="+rowdata.id+"'>"+"下载"+"</a>"
                            +"</td>"+
                            "</tr>");
                    }
                }
            })
        }
    }
})