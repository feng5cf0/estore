function toAddNotice(){
	window.location.href="front/noticeAction!toAddNoticePage";
}

//新增
function saveContent(){
	var contents=ue.getContent();
	var createUsers = $("#createUser").val();
	var titles = $("#title").val();
	$.ajax({
		type:"post",
		dataType:"json",
		url:"front/noticeAction!addNotice",
		loadMsg : "正在提交，请稍后...",
//		data:$('#addForm').serialize(),
		data:{
			'vcontent':encodeURIComponent(contents),
			'notice.createUser':createUsers,
			'notice.title':titles
		},
		async:false,
		success:function(data){
			
			if(data.success=="success"){
				alert("添加成功");
				window.location.href="front/noticeAction!getNoticeAll";
//				layer.msg("添加成功，正在跳转...");
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
}