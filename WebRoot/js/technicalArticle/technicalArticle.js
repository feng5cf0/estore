function toAddTechnicalArticle(){
	window.open("front/technicalArticleAction!toAddTechnicalArticle");
}
function saveContent(){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"front/technicalArticleAction!addTechnicalArticle",
		loadMsg : "正在提交，请稍后...",
		data:$('#addForm').serialize(),
		async:false,
		success:function(data){
			
			if(data.success=="success"){
				alert("添加成功");
				document.location.href="front/memberAction!toMain";
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
