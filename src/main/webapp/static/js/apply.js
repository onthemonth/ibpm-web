$(function(){
    //申请点击事件
     clickTask();
    //提交事件
    subTask();

});

function clickTask(){
    $(".onClickTask").click(function(){
        var taskId=$(this).find("input").val();
        var flag= confirm("确认申请吗?");
        if(flag){
            $.ajax({
                type:"post",
                url:"/leave/apply",
                data:{taskId:taskId},
                dataType:"json",
                success:function(data){
                    if(data.info == "success"){
                        location.href="/leave/applyList";

                    }else{
                        alert("提交失败");
                    }

                },
                error:function(data){
                    alert("提交失败");
                }
            })

        }

    });
}

function subTask() {
    $(".apply_bot .bottom_sub").click(function () {
        var timeVal = $("#time").val();
        var reason = $("#reason").val();
        if (("" == timeVal || null == timeVal || undefined == timeVal ) || ("" == reason || null == reason || undefined == reason )) {
            return;
        } else {
            $("#subForm").submit();
        }
    })


}