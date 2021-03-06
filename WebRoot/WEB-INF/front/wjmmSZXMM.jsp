<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file="/common.jsp"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css">
<script type="text/javascript" src="js/member/forgetPassword.js?v=222"></script>
<title>设置新密码</title>
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
<div class="register-con">
	<h4>找回密码</h4>
	<!--找回密码样式开始-->
	<div class="navn lookfor-pw">
		<!--流程导航开始-->
		<div class="baoxiu-lc">
			<div class="lc-con" style="margin:0px auto">
				<!--底线-->
				<div class="line">
					<div class="line2" style="width:435px"></div>
				</div>
				<!--进度文本-->
				<div class="jd-txt">
					<div class="txt1">
						<p class="p2 p3" style="background:#7abd54">1</p>
						<p class="p1">填写账户名</p>		
					</div>
					<div class="txt1">
						<p class="p2 p3" style="background:#7abd54">2</p>
						<p class="p1">验证身份</p>
						
					</div>
					<div class="txt1">
						<p class="p2 p3" style="background:#7abd54">3</p>
						<p class="p1">设置新密码</p>
						
					</div>
					<div class="txt1">
						<p class="p2">✔</p>
						<p class="p1">完成</p>
						
					</div>
				</div>
			</div>
		</div>
		<!--4个（line2:进度宽度为200px*个数，txt1:宽度为200px，jd-txt：left值为-15px，.line：width值为76%）-->
		<!--5个（line2:进度宽度为157px*个数，txt1:宽度为157px）-->
		<!--6个（line2:进度宽度为130px*个数，txt1:宽度为130px）-->
		<!--7个（line2:进度宽度为108px*个数，txt1:宽度为108px，jd-txt：left值为18px）-->
		<!--8个（line2:进度宽度为93px*个数，txt1:宽度为93px，jd-txt：left值为25px）-->
		<!--流程导航结束-->
		<div>
		<form action="front/forgetPassAction!towjmmWC" method="post">
			<div class="pw-inp">
				<span class="span1">新密码：</span>
				<input id="newpass" name="newpass" class="inp" type="text" placeholder="请输入您的新密码"/>
				<input type="hidden" id="memberId" name="memberId" value="30"/>
			</div>
			<div class="pw-inp">
				<span class="span1">再输入一次：</span>
				<input id="renewpass" name="renewpass" class="inp" type="password"/>
			</div>
			<div class="pw-inp">
				<input id="szxmmBtn" class="sub" type="button" value="提交"/>
			</div>
		</form>
		</div>
	</div>
	<!--找回密码样式结束-->
</div>
<!--内容区结束-->
<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->

</body>
</html>
