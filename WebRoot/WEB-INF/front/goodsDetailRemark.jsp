<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<%@include file="/tagDeclare.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
<script src="js/lrtk.js"></script> 
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
</head>

<body>
	<div class="total-con">
		<div class="proxq-con1">
			<h4 style="margin-top:0">5件起售</h4>
			<p class="lbcon">产品备注内容产品备注内容产品备注内容产品备注内容，产品备注内容产品备注内容产品备注内容产品备注内容产品备注内容，产品备注内容产品备注内容</p>
			<p class="lbcon">产品备注内容产品备注内容产品备注内，品备注内容产品备注内容产品备注内容，产品备注内容产品备注内容</p>
			<p class="lbcon">产品备注内容产品备注内容产品备注内容产品备注内容，产品备注内容产品备</p>
			<img src="images/proxq_pic2.png" width="750" height="470"/>
		</div>
	</div>
</body>
</html>
