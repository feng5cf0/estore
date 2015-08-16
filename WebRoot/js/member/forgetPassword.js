$(function(){
	$("#submitBtn").click(function(){
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/memberAction!wjmmTxzhm",
			data:$('#txyhmForm').serialize(),
			async:false,
			success:function(data){
				if(data.success=="success"){
					$("#txyhm1").hide();
					$("#nc").html(data.memberjson.memberAlias);
					$("#yxdz").html(data.memberjson.memberInfo.email);
					$("#cssyzsf").css("background","#7abd54");
					$("#txyhm2").show();
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
	
	$("#fsyzyj").click(function(){
		var email=$("#yxdz").html();
		$.ajax({
			type:"post",
			dataType:'json',
			url:"front/forgetPassAction!towjmmYZSF",
			data:{
				email:encodeURIComponent(email)
			},
			async:false,
			success:function(data){
				if(data.flag=='1'){
					$("#txyhm1").hide();
					$("#txyhm2").hide();
					$("#txyhm3").show();
				}else{
					alert("邮箱发送失败");
				}
			},
			error:function(request){
				alert("系统异常，联系管理员！");
			}
		});
	});
	//设置新密码
	$("#szxmmBtn").click(function(){
		alert("fff");
		var newpass = $("#newpass").val();
		var renewpass = $("#renewpass").val();
		var memberId =  $("#memberId").val();
		if(newpass==null || newpass==""){
			alert("新密码不能为空");
			return false;
		}
		if(renewpass==null || renewpass==""){
			alert("再次输入密码不能为空");
			return false;
		}
		if(renewpass!=newpass){
			alert("前后密码输入不一致，请重新输入");
			return false;
		}
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/forgetPassAction!towjmmSZXMM",
			async:false,
			data:{
				newpass:newpass,
				memberId:memberId
			},
			success:function(data){
				if(data.success=="success"){
					alert("重置密码成功");
					window.open("front/forgetPassAction!towjmmWC?t="+Math.random());
				}else{
					alert("重置密码失败");
				}
			},
			error:function(request){
				alert("系统异常，请联系管理员");
			}
		});
		
		
	});
	//$("#txyhmForm").validationEngine();
});

//刷新验证码
function flushYZM(){
	var yzm = document.getElementById("checkimg");
	yzm.src ='/estore/front/yzmAction!createYzm?t='+Math.random();
}