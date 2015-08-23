function toAddTechnicalArticle(){
	window.location.href="front/technicalArticleAction!toAddTechnicalArticle";
}
function toUpdatePage(id){
	window.location.href="front/technicalArticleAction!toUpdateTechnicalArticle?id="+id;
}
//新增
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
				window.location.href="front/technicalArticleAction!getTechnicalArticles";
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
//删除
function deleteTechnicalArticle(id){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"front/technicalArticleAction!delete",
		data:{
			id:id
		},
		ansyc:false,
		success:function(data){
			if(data.msg=="success"){
				alert("删除成功");
				window.location.href="front/technicalArticleAction!getTechnicalArticles";
			}else{
				alert("删除失败");
			}
		},
		error:function(request){
			alert("系统异常，请联系管理员");
		}
	});
}
//修改
function updateTechnicalArticle(id){
	$.ajax({
		type:"post",
		dataType:"json",
		url:"front/technicalArticleAction!update",
		data:$("#updateForm").serialize(),
		ansyc:false,
		success:function(data){
			if(data.msg=="success"){
				alert("修改成功");
				window.location.href="front/technicalArticleAction!getTechnicalArticles";
			}else{
				alert("修改失败");
			}
		},
		error:function(request){
			alert("系统异常，请联系管理员");
		}
	});
}
//模糊查询
function search(){
	alert("ff");
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/technicalArticleAction!searchMHCX",
			data:$("#searchForm").serialize(),
			ansyc:false,
			success:function(data){
					if(data.msg=="success"){
//						window.location.href="/WEB-INF/back/technicalArticleSearch.jsp";
					}else{
						alert("查询失败！");
					}
			},
			error:function(request){
				alert("系统异常，请联系管理员");
			}
		});
}
