$(function(){
    //审核事件
    onClickExamine();
    //提交事件
    subDetail();
    //关闭窗口事件
    closeWindow();
});

function onClickExamine(){
    $(".examine").click(function(){
        var taskId=$(this).parent().siblings(".taskId").text();
        var employee=$(this).parent().siblings(".employee").text();
        var hours=$(this).parent().siblings(".hours").text();
        var reason=$(this).parent().siblings(".reason").text();
        $("#taskId_text").val(taskId);
        $("#employee_text").find("span").eq(1).text(employee);
        $("#time_text").find("span").eq(1).text(hours);
        $("#reason_text").find("span").eq(1).text(reason);
        $("#bk_layer").css("display","block");

    });

}

function subDetail(){
    $("#agree").click(function(){
        var taskId=$("#taskId_text").val();
        var comment= $.trim($("#comment_text input").val());
        if(""==taskId || null == taskId || undefined == taskId){
            return;
        }else{
            $.ajax({
                type:"post",
                url:"/leave/approveTask",
                data:{taskId:taskId},
                dataType:"json",
                success:function(data){
                    if(data.info == "success"){
                        location.href="/leave/taskList";

                    }else{
                        alert("提交失败");
                    }

                },
                error:function(data){
                    alert("提交失败");
                }
            })
        }
    })


}

function closeWindow(){
    $(".closeImg").click(function(){
        $("#bk_layer").css("display","none");
    });
    //$("#noAgree").click(function(){
    //    $("#bk_layer").css("display","none");
    //});
}
