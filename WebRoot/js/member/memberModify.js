$(function(){
	//省市联动js实现
	addressInit('province', 'city', 'area', '福建', '福州市', '鼓楼区');
	$("#TcBox").hide();
	$("#emailInput").hide();
	$("#modify").hide();
	$("#memberModify").hide();
	$("#memberPhoto").hide();
	$("#passwordModify").hide();
	
	//个人信息修改
	$("#grxxxg").click(function(){
		$("#photoModify").removeClass("hov");
		$("#grxxxg").addClass("hov");
		$("#mmxg").removeClass("hov");
		
		$("#modify").show();//三个修改按钮
		$("#memberModify").show();//个人信息修改
		$("#memberPhoto").hide();//头像修改
		$("#passwordModify").hide();//密码修改
		return false;
	});
	//修改个人信息
	$("#memberModifyBtn").click(function(){
		
		$("#modify").show();//三个修改按钮
		$("#memberModify").show();//个人信息修改
		$("#newProduct").hide();//新产品
		$("#passwordModify").hide();//
		return false;
	});
	
	//修改头像
	$("#photoModify").click(function(){
		$("#photoModify").addClass("hov");
		$("#grxxxg").removeClass("hov");
		$("#mmxg").removeClass("hov");
		
		$("#memberPhoto").show();
		$("#newProduct").hide();//新产品
		$("#memberModify").hide();//个人信息修改
		$("#passwordModify").hide();//密码修改
		return false;
	});
	
	
	//修改密码
	
	$("#mmxg").click(function(){
		$("#photoModify").removeClass("hov");
		$("#grxxxg").removeClass("hov");
		$("#mmxg").addClass("hov");
		
		$("#passwordModify").show();//密码修改
		$("#memberPhoto").hide();//头像修改
		$("#memberModify").hide();//个人信息修改
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
	//
	$("#update").click(function(){
		$("#emailSpan").hide();
		$("#update").hide();
		$("#emailInput").show();
	});
	//个人信息修改
	$("#save").click(function(){
		var memberRealname = $("#memberRealname").val();
		var memberAlias = $("#memberAlias").val();
		var IdCard = $("#IdCard").val();
		var emailInput = $("#emailInput").val();
		var location = $("#location").val();
		
		if(memberAlias==null || memberAlias ==undefined || memberAlias==""){
			alert("昵称不能为空！");
			return false;
		}
		if(emailInput==null || emailInput ==undefined || emailInput==""){
			alert("邮箱不能为空！");
			return false;
		}
		$("#grxxxgForm").submit();
	});
	
});

function PreviewImage(imgFile,id) 
{ 
 var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
 if(!pattern.test(imgFile.value)) 
 { 
  alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
  imgFile.focus(); 
 } 
 else 
 { 
  var path; 
  if(document.all)//IE 
  { 
   imgFile.select(); 
   path = document.selection.createRange().text; 
   document.getElementById(id).innerHTML=""; 
   document.getElementById(id).style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
  } 
  else//FF 
  { 
   path = URL.createObjectURL(imgFile.files[0]);
   document.getElementById(id).innerHTML = "<img width='150' height='150' src='"+path+"'/>"; 
  } 
 } 
} 


	   
  
