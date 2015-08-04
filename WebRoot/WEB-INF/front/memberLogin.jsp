<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/member/login.js"></script>

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
		<h4>用户登录</h4>
		<!-- 会员登录表单 -->
		<form action="front/memberAction!memberLogin" method="post" id="memberLoginForm">
			<div class="register-lb login-lb">
				<span class="span1">会员账号：</span>
				<input name="memberAlias" id="memberAlias" class="inp1" type="text" placeholder="请输入账号"/>
			</div>
			<div class="register-lb login-lb">
				<span class="span1">登录密码：</span>
				<input name="memberPassword" id="memberPassword" class="inp1" type="password"/>
			</div>
			<div class="register-lb register-lb2 login-lb2">
				<input class="cbox" type="checkbox"/>记住密码<a class="a1" href="#">忘记密码？</a>
			</div>
			
			<div class="register-lb login-lb2">
				<input class="register-btn" type="button" id="loginbtn" value="登 录"/>
			</div>
		</form>
		
		<div class="register-lb register-lb3 login-lb3">
			还没有账号？<a href="front/memberAction!toMemberRegisterPage">马上注册</a>
		</div>
	</div>
	<div style="clear:both"></div>
</div>

<!--内容区结束-->

<!--底部开始-->
<div class="map">
	<div class="map-con">
		<dl class="map-conlb">
			<dt>购物指南</dt>
			<dd><a href="#">购物流程</a></dd>
			<dd><a href="#">帮助中心</a></dd>
			<dd><a href="#">售后服务</a></dd>
			<dd><a href="#">常见问题</a></dd>
		</dl>
		<dl class="map-conlb">
			<dt>购物指南</dt>
			<dd><a href="#">购物流程</a></dd>
			<dd><a href="#">帮助中心</a></dd>
			<dd><a href="#">售后服务</a></dd>
			<dd><a href="#">常见问题</a></dd>
		</dl>
		<dl class="map-conlb">
			<dt>购物指南</dt>
			<dd><a href="#">购物流程</a></dd>
			<dd><a href="#">帮助中心</a></dd>
			<dd><a href="#">售后服务</a></dd>
			<dd><a href="#">常见问题</a></dd>
		</dl>
		<dl class="map-conlb">
			<dt>购物指南</dt>
			<dd><a href="#">购物流程</a></dd>
			<dd><a href="#">帮助中心</a></dd>
			<dd><a href="#">售后服务</a></dd>
			<dd><a href="#">常见问题</a></dd>
		</dl>
		<!--客服人员开始-->
		<dl class="map-conlb serve-lb">
			<dt>客服人员</dt>
			<dd>
				<a href="#"><img src="images/dt.gif" width="15" style="vertical-align:sub"/>小刘（技术服务）</a>
				<div class="serve-xx">
					<div class="xxlb"><span class="img"><img src="images/qq.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/mail.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/rentou.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/qiu.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/phone.png"/></span><span class="span1">928909766</span></div>
					<div class="right-jt"></div>
					<div class="right-jt2"></div>
				</div>
			</dd>
			<dd>
				<a href="#"><img src="images/dt.gif" width="15" style="vertical-align:sub"/>小刘（技术服务）</a>
				<div class="serve-xx">
					<div class="xxlb"><span class="img"><img src="images/qq.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/mail.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/rentou.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/qiu.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/phone.png"/></span><span class="span1">928909766</span></div>
					<div class="right-jt"></div>
					<div class="right-jt2"></div>
				</div>
			</dd>
			<dd>
				<a href="#"><img src="images/dt.gif" width="15" style="vertical-align:sub"/>小刘（技术服务）</a>
				<div class="serve-xx">
					<div class="xxlb"><span class="img"><img src="images/qq.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/mail.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/rentou.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/qiu.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/phone.png"/></span><span class="span1">928909766</span></div>
					<div class="right-jt"></div>
					<div class="right-jt2"></div>
				</div>
			</dd>
			<dd>
				<a href="#"><img src="images/dt.gif" width="15" style="vertical-align:sub"/>小刘（技术服务）</a>
				<div class="serve-xx">
					<div class="xxlb"><span class="img"><img src="images/qq.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/mail.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/rentou.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/qiu.png"/></span><span class="span1">928909766</span></div>
					<div class="xxlb"><span class="img"><img src="images/phone.png"/></span><span class="span1">928909766</span></div>
					<div class="right-jt"></div>
					<div class="right-jt2"></div>
				</div>
			</dd>
		</dl>
		<!--客服人员结束-->
		<div style="clear:both"></div>
	</div>
</div>
<div class="copyright">
	<div class="txt3">
		<a href="#">首页</a> |
		<a href="#">银行汇款</a> |
		<a href="#">网站使用指南</a> |
		<a href="#">荣誉证书</a> |
		<a href="#">收货服务</a> |
		<a href="#">联系我们</a> |
	</div>
	赞助商：上海赢科投资有限公司。 蒙ICP备06004630号
</div>
<!--底部结束-->

</body>
</html>
