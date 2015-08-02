$(function(){

	$("#modify").hide();
	$("#memberModify").hide();
	$("#memberPhoto").hide();
	$("#passwordModify").hide();
	$("#myIntegral").hide();
	//修改个人信息
	$("#memberModifyBtn").click(function(){
		$("#modify").show();//三个修改按钮
		$("#memberModify").show();//个人信息修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#passwordModify").hide();
		return false;
	});
	$("#grxxxg").click(function(){
		$("#modify").show();//三个修改按钮
		$("#memberModify").show();//个人信息修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#passwordModify").hide();
		return false;
	});
	//修改头像
	$("#photoModify").click(function(){
		$("#memberPhoto").show();
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		return false;
	});
	
	
	//修改密码
	
	$("#mmxg").click(function(){
		$("#passwordModify").show();//密码修改
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		return false;
	});
	//我的积分
	$("#integralSearch").click(function(){
		$("#myIntegral").show();//我的积分
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		return false;
	});
	//产品收藏
	$("#cpscBtn").click(function(){
		$("#cpsc").show();
		$("#cpscInfo").show();
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		$("#myIntegral").hide();//我的积分
		$("#grzx").hide();
		$("#grxxcz").hide();
		return false;
	});
	
	//密码修改
	$("#passSaveBtn").click(function(){
		var memberPassword=$("#memberPassword").val();
		var password=$("#password").val();
		var newpassword =$("#newPssword").val();
		var reNewpassword =$("#reNewPssword").val();
		var id=$("#memberId").val();
		if(password=="" || password==null || password==undefined){
			alert("原密码不能为空！");
			return　false;
		}
		if(password!=memberPassword){
			alert("您输入的旧密码错误，请重新输入！");
			return　false;
		}
		if(newpassword=="" || newpassword==null || newpassword==undefined){
			alert("新密码不能为空！");
			return　false;
		}
		if(newpassword.length<8){
			alert("新密码长度不能小于8！");
			return　false;
		}
		if(newpassword!=reNewpassword){
			alert("新密码两次输入不一致！");
			return false;
		}
		$.ajax({
			type:"post",
			dataType:"json",
			url:"front/memberAction!passModify",
			async:false,
			data:{
				memberPassword:newpassword,
				memberId:id
			},
			success:function(data){
				if(data.success=="success"){
					alert("密码修改成功");
					window.open('front/memberAction!toMemberLoginPage','_self');
				}
			},
			error:function(request){
				alert("系统异常，请联系管理员！");
			}
		});
	});
	//头像修改
	
	$("#pic").change(function(){
			
		$("#picForm").submit();
		$.ajax({
			type:"post",
			dataType:"json",
			url:"",
			async:false,
			success:function(data){
				alert("图片预览");
			},
			error:function(request){
				alert("系统异常，请联系管理员！");
			}
		});
	});
	
});


	   
  
