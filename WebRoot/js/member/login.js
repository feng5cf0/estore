$(function(){
	//用户登录
	$("#loginbtn").click(function(){
		var memberAlias = $("#memberAlias").val();
		var memberPassword = $("#memberPassword").val();
		if(memberAlias==null || memberAlias=="" || memberAlias==undefined){
			alert("用户名不能为空！");
			return false;
		}
		if(memberPassword==null || memberPassword=="" || memberPassword==undefined){
			alert("请输入登录密码!");
			return false;
		}
		
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/memberAction!memberLogin",
			data:$('#memberLoginForm').serialize(),
			async:false,
			success:function(data){
				if(data.success=="success"){
					window.open('main.jsp','_self');
				}
				if(data.error=="error"){
					alert("用户名或者密码错误");
				}
			},
			error:function(request){
				alert("系统异常，请联系管理员！");
			}
		});
		
	});
});