<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css">
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
<title>售后服务-下载中心</title>
</head>

<body>
<!--顶部开始-->
	<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部区结束-->
<!--nav区开始-->
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
		<a class="hov" href="front/callUsAction!toCallUs"  style="width:60px;"><s:property value="getText('index.connectus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
		<!--当前所在位置开始-->
		<div class="now-tit">
			<span>当前所在位置：<a href="#">首页</a><span> > </span>售后服务</span>
		</div>
		<div class="now-titlb">
			<h4>售后服务</h4>
			<!--售后服务内容开始-->
			<div class="about-us">
				<div class="sh-serve-tit">
					<a href="front/afterSaleAction!toAfterSale">技术文章</a>
					<a class="tit hov" class="tit" href="front/afterSaleAction!toDownloadCenter">下载中心</a>
					<a class="tit" href="front/afterSaleAction!toScanVideo">视频观看</a>
					<div class="search">
						<input class="inp" type="text" placeholder="请输入关键字..."/><input class="sub" type="submit" value="搜索"/>
					</div>
				</div>
				<div class="sh-serve-jslb">
					<div class="txt5">
						<a href="#">汽车钥匙基本信息大全，汽车钥匙基本信息大全，汽车钥匙基本信息大全汽车钥匙基本信息大全，汽车钥匙基本信息大全，汽车钥匙基本信息大全</a>
					</div>
                    <a href="#"><img class="down" src="images/down.png" width="8" height="11"/></a>
					<span class="time">2015-7-20 15:30:46</span>
				</div>
				<div class="sh-serve-jslb">
					<div class="txt5">
						<a href="#">汽车钥匙基本信息大全，汽车钥匙基本信息大全，汽车钥匙基本信息大全汽车钥匙基本信息大全，汽车钥匙基本信息大全，汽车钥匙基本信息大全</a>
					</div>
                    <a href="#"><img class="down" src="images/down.png" width="8" height="11"/></a>
					<span class="time">2015-7-20 15:30:46</span>
				</div>
				<div class="sh-serve-jslb">
					<div class="txt5">
						<a href="#">汽车钥匙基本信息大全，汽车钥匙基本信息大全，汽车钥匙基本信息大全汽车钥匙基本信息大全，汽车钥匙基本信息大全，汽车钥匙基本信息大全</a>
					</div>
                    <a href="#"><img class="down" src="images/down.png" width="8" height="11"/></a>
					<span class="time">2015-7-20 15:30:46</span>
				</div>
				<!--换页样式-->
				<!-- <div class="total-huanye">
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
				</div> -->
				<!--<div class="huanye2">
					<a class="page-up" href="#"></a>
					<a href="#">1</a>
					<a class="hov" href="#">2</a>
					<a href="#">3</a>
					<a class="page-down" href="#"></a>
				</div>-->
			</div>
			<!--售后服务内容结束-->
		</div>
		<!--当前所在位置结束-->
	</div>
	<!--右侧列表结束-->
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

<!--返回顶部-->
<a href="#0" class="cd-top">Top</a>
<!--返回顶部-->

<!--客服代码开始-->
<DIV id=floatTools class=float0831>
  <DIV class=floatL><A style="DISPLAY: none" id=aFloatTools_Show class=btnOpen 
title=查看在线客服 
onclick="javascript:$('#divFloatToolsView').animate({width: 'show', opacity: 'show'}, 'normal',function(){ $('#divFloatToolsView').show();kf_setCookie('RightFloatShown', 0, '', '/', 'www.istudy.com.cn'); });$('#aFloatTools_Show').attr('style','display:none');$('#aFloatTools_Hide').attr('style','display:block');" 
href="javascript:void(0);">展开</A> <A id=aFloatTools_Hide class=btnCtn 
title=关闭在线客服 
onclick="javascript:$('#divFloatToolsView').animate({width: 'hide', opacity: 'hide'}, 'normal',function(){ $('#divFloatToolsView').hide();kf_setCookie('RightFloatShown', 1, '', '/', 'www.istudy.com.cn'); });$('#aFloatTools_Show').attr('style','display:block');$('#aFloatTools_Hide').attr('style','display:none');" 
href="javascript:void(0);">收缩</A> </DIV>
  <DIV id=divFloatToolsView class=floatR>
    <DIV class=tp></DIV>
    <DIV class=cn>
      <UL>
        <LI>
          <H3 class=titZx>QQ咨询</H3>
        </LI>
        <LI><SPAN class=icoZx>在线咨询</SPAN> </LI>
        <LI><A class=icoTc href="#">A老师</A> </LI>
        <LI><A class=icoTc href="javascript:void(0);">B老师</A> </LI>
        <LI><A class=icoTc href="#">C老师</A> </LI>
        <LI class=bot><A class=icoTc href="javascript:void(0);">D老师</A> </LI>
      </UL>
      <UL class=webZx>
        <LI class=webZx-in><A href="http://www.lanrentuku.com/" target="_blank" style="FLOAT: left"><IMG src="images/right_float_web.png" border="0px"></A> </LI>
      </UL>
      <UL>
        <LI>
          <H3 class=titDh>电话咨询</H3>
        </LI>
        <LI><SPAN class=icoTl>400-000-0000</SPAN> </LI>
        <LI class=bot>
          <H3 class=titDc><A href="http://www.lanrentuku.com/" target="_blank">新版调查</A></H3>
        </LI>
      </UL>
    </DIV>
  </DIV>
</DIV>
<!--客服代码结束-->


</body>
</html>