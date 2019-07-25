{
    var pageSize = 10;


    //初始化获取留言板
    $(function(){
        var datas={
            currentPage:1,
            pageSize : pageSize,
            tno:tno
        };
        $.ajax({
            url:"SleaveMessageController/findAllMesByTea",
            type:"post",
            data:datas,
            dataType:"json",
            success:function(data){
                var currentPage = data.currentPage;
                var totlePageSize=data.totlePageSize;
                var count=data.count;
                console.log(currentPage);
                console.log(totlePageSize);
                console.log(count);
                var datas=	data.list;
                $("#currentPage").html(currentPage);
                $("#totlePageSize").html(totlePageSize);
                $("#totleCount").html(count);
                for(var i=0;i<datas.length;i++){
                    var rowdata=datas[i];
                    $("#insert_mes").append("	<tr>"+
                        "<td>"+rowdata.sname  +"</td>"+
                        "<td>"+"<a data-toggle='modal' data-target='#myModal' href='javascript:void(0)' onclick='lookContent("+rowdata.id+")'>"+rowdata.slm_content.substring(0,9)+"</a>"+"</td>"+
                        "<td>"+rowdata.slm_time  +"</td>"+
                        "<td>"+rowdata.slm_status  +"</td>"+
                        "</tr>");
                }
            }
        })
    })
    //删除消息
    function deleteMes(id) {
        if(confirm("确定删除吗")){
            var datas = {
                id:id
            }
            $.ajax({
                url:"SleaveMessageController/deleteMes",
                type:"post",
                data:datas,
                dataType:"json",
                success:function(data){
                    if(data.code==1) {
                        alert("删除成功！");
                        var datass = {
                            sno: sno,
                            currentPage: 1,
                            pageSize: pageSize
                        };
                        $.ajax({
                            url: "SleaveMessageController/findAllMesByStu",
                            type: "post",
                            data: datass,
                            dataType: "json",
                            success: function (data) {
                                $("#insert_mes").empty();
                                var currentPage = data.currentPage;
                                var totlePageSize = data.totlePageSize;
                                var count = data.count;
                                console.log(currentPage);
                                console.log(totlePageSize);
                                console.log(count);
                                var datas = data.list;
                                $("#currentPage").html(currentPage);
                                $("#totlePageSize").html(totlePageSize);
                                $("#totleCount").html(count);
                                for (var i = 0; i < datas.length; i++) {
                                    var rowdata = datas[i];
                                    $("#insert_mes").append("	<tr>" +
                                        "<td>" + rowdata.tname + "</td>" +
                                        "<td>"+"<a data-toggle='modal' data-target='#myModal' href='javascript:void(0)' onclick='lookContent("+rowdata.id+")'>"+rowdata.slm_content.substring(0,9)+"</a>"+"</td>"+
                                        "<td>" + rowdata.slm_time + "</td>" +
                                        "<td>"+rowdata.slm_status  +"</td>"+
                                        "<td>" + "<a href='javascript:void(0)' onclick='deleteMes(rowdata.id)'>删除</a>" + "</td>" +
                                        "</tr>");
                                }
                            }
                        })
                    }else{
                        alert("删除失败！");
                    }
                }
            })
        }else{

        }
    }
    //查看消息
    function lookContent(id) {
        var className = document.getElementById("textarea").className;
        if(className == "appear form-control"){
            $("#textarea").hide();
            document.getElementById("textarea").className = "hide form-control";
            $("#reply").hide();
        }
        var slm_id = id;
        var datas = {
            slm_id :slm_id
        };
        $.ajax({
            url:"SleaveMessageController/lookMesContent",
            type:"post",
            data:datas,
            dataType:"json",
            success:function(data){
                $("#box").empty();
                // var datass = data.sleaveMessage;
                $(".slm_id").html(slm_id);
                // $(".myContent").text(datass.slm_content);
                // $(".stuName").text(datass.sname+":");

                var datass = data.list;
                var sssname  = datass[0].sname;
                console.log(sssname);
                for(var i = 0 ; i < datass.length ; i++){
                    var rowdata = datass[i];
                    if(rowdata.sname != ssname ) {
                        console.log("stu");
                        $("#box").append("<p  style='float:left;'>" + rowdata.sname + ":" + "</p>" +
                            "<div style='margin-bottom: 20px'>" +
                            "<span style='float:left;' >" + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rowdata.slm_content + "</span>" +
                            "</div>" + "<br />"
                        );
                    }else{
                        console.log("tea");
                        var rowdata = datass[i];
                        $("#box").append("<p  style='float:right;'>"+ ":" + rowdata.sname  + "</p>" +
                            "<div style='margin-bottom: 20px'>" +
                            "<span  style='float:right;'>"  + rowdata.slm_content+ "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "</span>" +
                            "</div>" + "<br />"
                        );
                    }
                }
            }
        })
    }
    //前一页
    function js_previous() {
        var currentPage = $("#currentPage").html();
        var totlePageSize = $("#totlePageSize").html();
        if(currentPage == 1){
            alert("已经是第一页！");
        }else{
            currentPage = parseInt(currentPage) - 1;
            var datas={
                tno:tno,
                currentPage:currentPage,
                pageSize : pageSize
            };
            $.ajax({
                url:"SleaveMessageController/findAllMesByTea",
                type:"post",
                data:datas,
                dataType:"json",
                success:function(data){
                    $("#insert_mes").empty();
                    var currentPage = data.currentPage;
                    var totlePageSize=data.totlePageSize;
                    var count=data.count;
                    var datas=	data.list;
                    $("#currentPage").html(currentPage);
                    $("#totlePageSize").html(totlePageSize);
                    $("#totleCount").html(count);
                    for(var i=0;i<datas.length;i++){
                        var rowdata=datas[i];
                        $("#insert_mes").append("	<tr>"+
                            "<td>"+rowdata.sname  +"</td>"+
                            "<td>"+"<a data-toggle='modal' data-target='#myModal' href='javascript:void(0)' onclick='lookContent("+rowdata.id+")'>"+rowdata.slm_content.substring(0,9)+"</a>"+"</td>"+
                            "<td>"+rowdata.slm_time  +"</td>"+
                            "<td>"+rowdata.slm_status  +"</td>"+
                            "</tr>");
                    }
                }
            })

        }
    }
    //下一页
    function js_next() {
        var currentPage = $("#currentPage").html();
        var totlePageSize = $("#totlePageSize").html();
        console.log(currentPage);
        if(currentPage == totlePageSize || totlePageSize == 0) {
            alert("已经是最后一页！");
        }else{
            currentPage = parseInt(currentPage) + 1;
            console.log(currentPage);
            var datas={
                tno:tno,
                currentPage:currentPage,
                pageSize : pageSize
            };
            $.ajax({
                url:"SleaveMessageController/findAllMesByTea",
                type:"post",
                data:datas,
                dataType:"json",
                success:function(data){
                    $("#insert_mes").empty();
                    var currentPage = data.currentPage;
                    var totlePageSize=data.totlePageSize;
                    var count=data.count;
                    var datas=	data.list;
                    $("#currentPage").html(currentPage);
                    $("#totlePageSize").html(totlePageSize);
                    $("#totleCount").html(count);
                    for(var i=0;i<datas.length;i++){
                        var rowdata=datas[i];
                        $("#insert_mes").append("	<tr>"+
                            "<td>"+rowdata.sname  +"</td>"+
                            "<td>"+"<a data-toggle='modal' data-target='#myModal' href='javascript:void(0)' onclick='lookContent("+rowdata.id+")'>"+rowdata.slm_content.substring(0,9)+"</a>"+"</td>"+
                            "<td>"+rowdata.slm_time  +"</td>"+
                            "<td>"+rowdata.slm_status  +"</td>"+
                            "</tr>");
                    }
                }
            })
        }
    }
}