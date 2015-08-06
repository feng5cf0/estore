$(function(){

	$("#modify").hide();
	$("#memberModify").hide();
	$("#memberPhoto").hide();
	$("#passwordModify").hide();
	$("#myIntegral").hide();
	$("#cpsc").hide();
	$("#cpscInfo").hide();
	$("#qbdd").hide();
	$("#wddd").hide();
	
	$("#hszHeader").hide();
	$("#hsz").hide();
	$("#wsy").hide();
	$("#ygq").hide();
	$("#ysy").hide();
	//个人信息修改
	$("#grxxxg").click(function(){
		$("#modify").show();//三个修改按钮
		$("#memberModify").show();//个人信息修改
		$("#memberPhoto").hide();//头像修改
		$("#passwordModify").hide();//密码修改
		$("#hszHeader").hide();//我的优惠券
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").hide();
		$("#myIntegral").hide();//我的积分
		$("#qbdd").hide();//全部订单
		$("#cpsc").hide();
		$("#cpscInfo").hide();//产品收藏
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#wddd").hide();
		return false;
	});
	//修改个人信息
	$("#memberModifyBtn").click(function(){
		$("#modify").show();//三个修改按钮
		$("#memberModify").show();//个人信息修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#passwordModify").hide();//
		$("#myIntegral").hide();//我的积分
		$("#cpsc").hide();
		$("#cpscInfo").hide();//产品收藏
		$("#hszHeader").hide();//我的优惠券
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").hide();
		$("#myIntegral").hide();//我的积分
		return false;
	});
	
	//修改头像
	$("#photoModify").click(function(){
		$("#memberPhoto").show();
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		$("#hszHeader").hide();//我的优惠券
		$("#cpsc").hide();
		$("#cpscInfo").hide();//产品收藏
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").hide();
		$("#myIntegral").hide();//我的积分
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
		$("#modify").hide();
		$("#hszHeader").hide();//我的优惠券
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").hide();
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
		$("#modify").hide();
		$("#hszHeader").hide();//我的优惠券
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").hide();
		return false;
	});
	//查询全部订单
	$("#findOrderAll").click(function(){
		$("#qbdd").show();
		$("#wddd").show();
		$("#cpsc").hide();
		$("#cpscInfo").hide();
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		$("#myIntegral").hide();//我的积分
		$("#grzx").hide();
		$("#grxxcz").hide();
		$("#modify").hide();
		$("#hszHeader").hide();//我的优惠券
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").hide();
		return false;
	});
	//我的优惠券
	//回收站
	$("#pressHsz").click(function(){
		$("#hsz").show();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").hide();
		$("#qbdd").hide();
		$("#wddd").hide();
		$("#cpsc").hide();
		$("#cpscInfo").hide();
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		$("#myIntegral").hide();//我的积分
		$("#modify").hide();
		return false;
	});
	//已使用
	$("#pressYsy").click(function(){
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").hide();
		$("#ysy").show();
		$("#qbdd").hide();
		$("#wddd").hide();
		$("#cpsc").hide();
		$("#cpscInfo").hide();
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		$("#myIntegral").hide();//我的积分
		$("#modify").hide();
		return false;
	});
	//未使用
	$("#pressWsy").click(function(){
		$("#hsz").hide();
		$("#wsy").show();
		$("#ygq").hide();
		$("#ysy").hide();
		$("#qbdd").hide();
		$("#wddd").hide();
		$("#cpsc").hide();
		$("#cpscInfo").hide();
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		$("#myIntegral").hide();//我的积分
		$("#modify").hide();
		return false;
	});
	//已过期
	$("#pressygq").click(function(){
		$("#hsz").hide();
		$("#wsy").hide();
		$("#ygq").show();
		$("#ysy").hide();
		$("#qbdd").hide();
		$("#wddd").hide();
		$("#cpsc").hide();
		$("#cpscInfo").hide();
		$("#memberPhoto").hide();//头像修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		$("#myIntegral").hide();//我的积分
		$("#modify").hide();
		return false;
	});
	$("#pressWdyhq").click(function(){
		$("#hszHeader").show();
		$("#hsz").show();
		$("#modify").hide();//三个修改按钮
		$("#memberModify").hide();//个人信息修改
		$("#myOrder").hide();//我的订单
		$("#myOrderInfo").hide();//我的订单列表
		$("#newProduct").hide();//新产品
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
	
	//个人信息修改
	//头像修改
	
//	$("#pic").change(function(){
//			
//		$("#picForm").submit();
//		$.ajax({
//			type:"post",
//			dataType:"json",
//			url:"",
//			async:false,
//			success:function(data){
//				alert("图片预览");
//			},
//			error:function(request){
//				alert("系统异常，请联系管理员！");
//			}
//		});
//	});
	
});


	   
  
