<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<%@include file="/frontHeadDeclare.jsp"%>
    <base href="<%=basePath%>">
    
	<link rel="stylesheet" type="text/css" href="css/default.css">
	<script type="text/javascript" src="js/jquery.js"></script>
	<script type="text/javascript" src="js/kefu.js"></script>
	<script type="text/javascript" src="js/main/main.js"></script>
	<script src="js/lrtk.js"></script> 
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
		function searchSubmit(searchType){
			if(searchType == 1){
				document.searchForm.action="${basePath}front/goodsSearchAction!getByKeyWords.action";
				document.searchForm.submit();
			}else if(searchType ==2){
				document.searchForm.action="${basePath}front/newProductAction!getByCondition.action";
				document.searchForm.submit();
			}
		}
	</script>
  </head>
  
  <body>
<div class="top">
	<div class="top-con">
		<c:if test="${empty sessionScope.member.memberAlias }">
			<div class="top-left">
				<a class="a1" href="front/memberAction!toMemberLoginPage"><s:property value="getText('index.pleaselogin')"/></a><a href="front/memberAction!toMemberRegisterPage"><s:property value="getText('index.freeregister')"/></a>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.member.memberAlias }">
			<div class="top-left">
				<a class="a1" href="front/memberAction!toMemberCenterPage">${sessionScope.member.memberAlias }</a><a href="front/memberAction!toMemberRegisterPage"><s:property value="getText('index.freeregister')"/></a>
			</div>
		</c:if>
		<div class="top-right">
			<a class="top-right-dw" href="javascript:void(0);" onclick="setHome(this,'http://www.baidu.com')"><s:property value="getText('index.sethomepage')"/></a> 
			<div class="top-right-dw top-right-gwc" href="javascript:;">
				<img src="images/gowoche.png" width="15" height="14"/>
				<span class="txt"><a href="${basePath}front/cartFrontAction!getAll.action"><s:property value="getText('index.cart')"/></a></span>
				<span class="num">2</span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="displ ay:block">
					<a href="#">我的积分</a>
					<a href="#">我的余额</a>
				</div>
		    </div> 
			<div class="top-right-dw top-right-scj" href="javascript:;">
				<a href="${basePath}front/favoriteAction!get.action"><span class="txt"><s:property value="getText('index.favorite')"/></span></a>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="left:-7px;width:72px">
					<a href="${basePath}front/favoriteAction!get.action">我的收藏</a>
				</div>
		    </div> 
			<div class="top-right-dw top-right-order" href="javascript:;">
				<a href="${basePath}front/orderFrontAction!get.action"><span class="txt"><s:property value="getText('index.myorder')"/></span></a>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="left:-8px;width:75px">
					<a href="${basePath}front/orderFrontAction!get.action">查看订单</a>
					<a href="front/memberAction!toMemberCenterPage">个人中心</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!--顶部结束-->
<!--logo区开始-->
<div class="logo">
	<h1><a href="#"><img class="logo-img" src="images/logo.png" width="350" height="58"/></a></h1>
	<div class="logo-right">
		<div class="yuyan-lb">
			<a href="${basePath}front/languageAction!changeLanguage.action?request_locale=zh_CN"><img src="images/yuyan_1.png" width="79" height="20"/></a>
			<a href="${basePath}front/languageAction!changeLanguage.action?request_locale=en_US"><img src="images/yuyan_2.png" width="79" height="20"/></a>
			<a href="#"><img src="images/yuyan_3.png" width="79" height="20"/></a>
			<a href="#"><img src="images/yuyan_4.png" width="79" height="20"/></a>
			<a href="#"><img src="images/yuyan_5.png" width="79" height="20"/></a>
			<select class="yy-sel">
				<option>其他语言</option>
				<option>其他语言</option>
				<option>其他语言</option>
			</select>
		</div>
		<div class="sosuo-ys">
			<form method="post" name="searchForm">
				<input class="inp" type="text" placeholder="<s:property value="getText('index.searchtip')"/>" name="keyWords"/>
				<input class="sub1" type="button" value="searchSubmit(1)"/>
				<input class="sub2" type="button" value="" onclick="searchSubmit(2);"/>
			</form>
		</div>
	</div>
</div>
  </body>
</html>
