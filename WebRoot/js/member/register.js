$(function(){
	var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
	$("#smt").click(function(){
		//判断同意条款是否被选中
		var memberAlias = $("#memberAlias").val();
		var memberPassword = $("#memberPassword").val();
		var memberRePassword = $("#memberRePassword").val();
		var email = $("#email").val();
		if(memberAlias==undefined || memberAlias=="" || memberAlias==null){
			alert("会员账号不能为空！");
			return false;
		}
		if(checkNum(memberAlias)){
			alert("您输入的会员账号包含特殊字符，请重新输入！");
			return false;
		}
		if(memberPassword==undefined || memberPassword=="" || memberPassword==null){
			alert("密码不能为空！");
			return false;
		}
		if(memberPassword.length<8){
			alert("密码长度不小于8！")
			return false;
		}
		if(memberPassword!=memberRePassword){
			alert("密码前后两次不一样！请重新输入");
			return false;
		}
		if(email==undefined || email=="" || email==null){
			alert("请留下您的邮箱，以便进行激活！");
			return false;
		}
		if(!reg.test(email)){
			alert("您输入的邮箱格式不正确！");
			return false;
		}
		
		if($("#cbox").attr("checked")==false){
			alert("您必须同意用户条款之后才能进行注册！");
			return false;
		}
		$("#memberRegisterForm").submit();
		return false;
	});
	
	
	
	
	
});
function checkNum(str){ 
	//定义数组保存特殊字符
	    var AllNumIsSame = new Array("’","”","!","@","#","$","%","^","&","*",".");
	          var IsTrueORfalse = false;
	            //循环进行判断信息
	            for (var i = 0; i < AllNumIsSame.length; i++) {
	                //判断如果包含锁定义数组包含的字符特提示为true
	                if (str.indexOf(AllNumIsSame[i]) != -1) {
	                    IsTrueORfalse = true;
	                    break;
	                }
	            }
	            //如果为true特提示为true否则为false
	            if (IsTrueORfalse == true) {
	                return true;
	            }
	            else {
	            	 return false;
	            }
	      
	  }