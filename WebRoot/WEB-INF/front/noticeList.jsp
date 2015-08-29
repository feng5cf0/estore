<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<%@include file="/tagDeclare.jsp" %>
<link rel="stylesheet" type="text/css" href="css/default.css">
 <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
<script type="text/javascript" src="My97DatePicker/WdatePicker.js"></script> 
 <script type="text/javascript" src="js/member/memberModify.js?radom=473"></script>
 <script type="text/javascript" src="js/member/jsAddress.js?radom=113"></script>
<script src="js/lrtk.js"></script>
<script type="text/javascript">
	$(function(){
		$(".pro-left1-li").each(function(i){
			var top = $(this).offset().top;
			$(".pro-left1-lilb:eq("+i+")").css({"top":192-top});
		});//左栏划上效果
		
		//二维码划上效果
		$(".ewm-txt").hover(function(){
			$(".ewm-pic").show();
		},function(){
			$(".ewm-pic").hide();
		});
	});
</script>
<title>个人中心</title>
</head>

<body style="background:url(images/index_bg.jpg) repeat-x">
<!--顶部开始-->
	<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部区结束-->
<!-- nav区开始 -->
<div class="nav">
	<div class="nav-con">
		<div class="fenlei-ys" ><s:property value="getText('index.allcategory')"/></div>
		<a href="front/mainAction!toMain.action" style="width:40px;"><s:property value="getText('index.homepage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/newProductAction!toNewProduct"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/productPromotionAction!toProductPromotion"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/aboutUsAction!toAboutUs"  style="width:60px;"><s:property value="getText('index.aboutus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/afterSaleAction!toAfterSale"  style="width:60px;"><s:property value="getText('index.aftersale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/bankAccountAction!toBankAccount"  style="width:60px;"><s:property value="getText('index.bankaccount')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/onlineMsgAction!toOnLine"  style="width:60px;"><s:property value="getText('index.leavemessage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/callUsAction!toCallUs"  style="width:60px;"><s:property value="getText('index.connectus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
	</div>
</div>
<!--nav区域结束-->

<!--内容区开始-->
<div class="total-con">
	<!--左侧列表开始-->
	<div class="prolb-left">
		<!-- 类别开始 -->
		<div>
			<jsp:include page="/WEB-INF/front/frontCategory.jsp"></jsp:include>
		</div>
		<!-- 类别结束 -->
		<!--品牌产品开始-->
		<div class="pp-pro">
			<jsp:include page="/WEB-INF/front/frontBrand.jsp"></jsp:include>
		</div>
		<!--品牌产品结束-->
		<!--网店链接开始-->
		<div class="pp-pro">
			<jsp:include page="/WEB-INF/front/frontShopLink.jsp"></jsp:include>
		</div>
		<!--网店链接结束-->
	</div>
	<!--左侧列表结束-->
		<div class="prolb-right prolb-right2">
		<!--当前所在位置开始-->
		<div class="now-tit">
			<span>当前所在位置：<a href="#">首页</a><span> > </span>公告列表</span>
		</div>
		<div class="now-titlb">
			<h4>公告列表</h4>
			<!--售后服务内容开始-->
			<div class="about-us">
				<c:forEach items="${frontNoticeList }" var="item"> 
					<div class="sh-serve-jslb">
							<a href="front/noticeAction!getNoticeDetail?noticeId=${item.id }"><c:out value="${item.title }"/></a>
						<span class="time"><f:formatDate value="${item.createTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
					</div>
				</c:forEach>
				<!--换页样式-->
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
			</div>
			<!--售后服务内容结束-->
		</div>
		<!--当前所在位置结束-->
	</div>
	<!--右侧列表开始-->
	<div style="clear:both"></div>
</div>
<!--内容区结束-->

<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->

<!--客服代码开始-->
<jsp:include page="/WEB-INF/front/frontService.jsp"></jsp:include>
<!--客服代码结束-->
<!-- 弹出框 -->
<!-- 
<div id="TcBox">
	<div class="filter-bg"></div>
	<div class="login-kua">
		<h3>标题文本<a class="close" href="#">×</a></h3>
		<div class="txt">警示的内容</div>
		<div class="sub"><input type="submit" value="确 定"/></div>
	</div>
</div> -->
</body>
</html>
























