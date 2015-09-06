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
		<!--产品列表开始-->
		<div class="new-prolb-wk" style="margin-top:20px">
			<c:forEach items="${goodsList}" var="item">
				<div class="prolb-showlb prolb-showlb2">
					<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}"><img src="images/new_pic1.png" width="188" height="175"/></a>
					<h4>${item.goodsName}</h4>
					<div class="txt1">
						<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}">
							<span>功能：</span>${item.goodsDescription}</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>${item.goodsPrice}</div>
				</div>
			</c:forEach>
			<div style="clear:both"></div>
		</div>
		<!--产品列表结束-->
		<!--换页样式--><!--
		<div class="total-huanye">
			<a class="pre" href="#"></a>
			<a class="num hov" href="#">1</a>
			<a class="num" href="#">2</a>
			<a class="num" href="#">3</a>
			<a class="num" href="#">4</a>
			<a class="num" href="#">5</a>
			<span>...</span>
			<a class="next" href="#"></a>
			<span>共100页，到第<input type="text" class="inp" value="1"/>页</span>
			<input class="sub" type="submit" value="确定"/>
		</div>
	--><div style="clear:both"></div>
	</body>
</html>
