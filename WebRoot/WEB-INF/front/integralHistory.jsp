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
		<a href="front/newProductAction!getByCondition.action"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/onsaleFrontAction!prepare.action"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
	<!--右侧列表开始-->
	<div class="prolb-right prolb-right2">
		<!--个人中心内容开始-->
		<div class="now-tit" id="grzx">
			<span>当前所在位置：个人中心</span>
			<a class="btn" href="front/mainAction!toMain.action">返回上一页</a>
		</div>
		<div class="now-titlb center-con">
			<!--头像区域开始-->
			<div class="center-tx" id="grxxcz">
				<img class="tx" src="${sessionScope.member.memberInfo.photoPath }" width="95" height="95"/>		
				<div class="center-mid">
					<h5>王女士<a href="#" id="memberModifyBtn">修改个人信息</a></h5>
					<div class="txt7">会员级别：初级会员</div>
					<div class="txt8">上次登录：<f:formatDate value="${sessionScope.member.lastLoginTime }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					<div>
						<a class="gwc-btn" href="#">查看购物车</a>
					</div>
				</div>
				<div class="center-xmlb">
					<p><a class="lba" href="#" id="pressWdyhq">我的优惠券（7）</a></p>
					<p><a class="lba" href="front/integralAction!toMyIntegral" id="integralSearch">积分查询</a></p>
					<p><a class="lba" href="#" id="findOrderAll">订单查询</a></p>
					<p><a class="lba" href="#" id="cpscBtn">产品收藏</a></p>
					<p><a class="lba" href="front/memberAction!logout">退出</a></p>
				</div>	
			</div>
			<!--头像区域结束-->
				<!--我的积分开始-->
			<div class="white-conbg jifen-lb">
				<!--我的积分列表开始-->
				<h4>积分历史</h4>
				<div class="jifen-num">
					您的账户目前总积分：<b style="color:#ff4400">100</b>分
					<a href="front/integralAction!toMyIntegral">返回</a>
				</div>
				<div class="jifen-ls">
					<div class="ls-tit">
						<span>日期</span>
						<span>调整积分</span>
						<span>积分余额</span>
						<span>积分来源</span>
					</div>
					<c:forEach items="${sessionScope.member.integral}" var="item">
					<div class="ls-body">
						<span><f:formatDate value="${item.updateDate }" pattern="yyyy-MM-dd"/></span>
						<span>${item.updateCount }</span>
						<span>${item.remain }</span>
						<span>${item.source }</span>
					</div>
					</c:forEach>
				</div>
				<!--我的积分列表结束-->
			</div>
			<!--我的积分结束-->
		</div>
	</div>
	<!--右侧列表结束-->
	<div style="clear:both"></div>
</div>
<!--内容区结束-->

<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->

<!--客服代码开始-->
<jsp:include page="/WEB-INF/front/frontService.jsp"></jsp:include>
<!--客服代码结束-->
<!-- 弹出框 -->

</body>
</html>
