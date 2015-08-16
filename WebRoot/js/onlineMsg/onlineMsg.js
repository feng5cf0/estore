$(function(){
	$("#onlineMsgBtn").click(function(){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/onlineMsgAction!addOnlineMsg.action",
			loadMsg : "正在提交，请稍后...",
			data:$('#onlineMsgForm').serialize(),
			async:false,
			success:function(data){
				if(data.success=="success"){
					alert("留言成功");
					document.location.href="front/memberAction!toMain";
//					layer.msg("添加成功，正在跳转...");
					/*layer.msg("添加成功，11正在w跳转...", {
						time : 500
						}, function() {
//							
							self.window.location = "front/memberAction!toMain";
						});*/
					
				}
				if(data.error=="error"){
					alert(data.errorMsg);
				}
			},
			error:function(request){
				alert("系统异常，请联系管理员！");
			}
		});
	});
});

function flushYZM(){
	var yzm = document.getElementById("checkimg");
	yzm.src ='/estore/front/yzmAction!createYzm?t='+Math.random();
}