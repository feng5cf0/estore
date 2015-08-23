<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/member/login.js?v=122"></script>

<script type="text/javascript">
	$(function(){
		$(".pro-left1-li").each(function(i){
			var top = $(this).offset().top;
			$(".pro-left1-lilb:eq("+i+")").css({"top":192-top});
		})//左栏划上效果
		
		//二维码划上效果
		$(".ewm-txt").hover(function(){
			$(".ewm-pic").show();
		},function(){
			$(".ewm-pic").hide();
		})
	})
</script>

<title>个人中心</title>
</head>
 <body>
<!--顶部开始-->
<div class="top2">
	<div class="top-con">
		<h1><a href="#"><img class="logo-img" src="images/logo.png" width="350" height="58"/></a></h1>
	</div>
</div>
<!--顶部结束-->

<!--内容区开始-->
<div class="login-con2">
	<img class="login-pic" src="images/login_pic.png" width="600" height="408"/>
	<div class="login-right">
		<h4><s:property value="getText('login.userlogin')"/></h4>
		<!-- 会员登录表单 -->
		<form action="front/memberAction!memberLogin" method="post" id="memberLoginForm">
			<div class="register-lb login-lb">
				<span class="span1"><s:property value="getText('login.username')"/>:</span>
				<input name="memberAlias" id="memberAlias" class="inp1 validate[required]" type="text" placeholder="<s:property value="getText('login.usernametip')"/>"/>
			</div>
			<div class="register-lb login-lb">
				<span class="span1"><s:property value="getText('login.password')"/>:</span>
				<input name="memberPassword" id="memberPassword" class="inp1 validate[required]" type="password"/>
			</div>
			<div class="register-lb register-lb2 login-lb2">
				<input name="flag" id="flag" value="1" class="cbox" type="checkbox" /><s:property value="getText('login.rememberpassword')"/><a class="a1" href="front/forgetPassAction!towjmmTXZHM"><s:property value="getText('login.forgetpassword')"/></a>
			</div>
			
			<div class="register-lb login-lb2">
				<input class="register-btn" type="button" id="loginbtn" value="<s:property value="getText('login.loginbutton')"/>"/>
			</div>
		</form>
		
		<div class="register-lb register-lb3 login-lb3">
			<s:property value="getText('login.noaccount')"/><a href="front/memberAction!toMemberRegisterPage"><s:property value="getText('login.register')"/></a>
		</div>
	</div>
	<div style="clear:both"></div>
</div>

<!--内容区结束-->

<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->

</body>
</html>
