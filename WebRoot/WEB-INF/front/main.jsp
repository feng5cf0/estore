<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<base href="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css"/>
<script type="text/javascript" src="js/jquery.js"></script>
<script type=text/javascript src="js/kefu.js"></script>
<script type="text/javascript">
	$(function(){
		$(".pro-left1-li").each(function(i){
			var top = $(this).offset().top;
			$(".pro-left1-lilb:eq("+i+")").css({"top":192-top});
		})
	})
</script>
</head>
  
<body style="background:url(images/index_bg.jpg) repeat-x">
<!--顶部开始-->
	<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部区结束-->
<!--nav区开始-->
<div class="nav">
	<div class="nav-con">
		<div class="fenlei-ys"><s:property value="getText('index.allcategory')"/></div>
		<a href="#"><s:property value="getText('index.homepage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toNewProduct"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="front/pageJumpAction!toProductPromotion"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#"><s:property value="getText('index.aboutus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#"><s:property value="getText('index.aftersale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#"><s:property value="getText('index.bankaccount')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#"><s:property value="getText('index.leavemessage')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#"><s:property value="getText('index.connectus')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
	<div class="prolb-right">
		<!--banner区开始-->
		<div class="prolb-right1">
			<div class="banner">
				<ul>
					<li class="banner-lb"><a href="#"><img src="images/banner1.png" width="602" height="312"/></a></li>
					<li class="banner-lb"><a href="#"><img src="images/banner1.png" width="602" height="312"/></a></li>
				</ul>
				<div class="banner-btn">
					<a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a><a href="#"></a>
				</div>
			</div>
			<div class="gonggao-con">
				<h3>公告<a href="#">更多></a></h3>
				<div class="gg-lb">
					<div class="lb-con"><span>【公告】</span><a href="#">限时限量折扣公告</a></div>
					<div class="lb-con"><span>【公告】</span><a href="#">限时限量折扣公告</a></div>
					<div class="lb-con"><span>【公告】</span><a href="#">限时限量折扣公告</a></div>
				</div>
				<div class="login-con">
					<!--<div class="user-lb"><span>用户名：</span><input class="inp" type="text"/></div>
					<div class="user-lb"><span>密码：</span><input class="inp" type="password"/></div>-->
					<div class="txlb">
						<img class="tx" src="images/touxiang.png" width="53" height="53"/>
						<div class="txt4">
							<p>Hi,你好！</p>
							<p><a href="front/memberAction!toMemberRegisterPage">注册为会员</a><span style="color:#777">去逛逛</span></p>
						</div>
					</div>
					<div class="btn">
						<input class="login-btn" type="submit" value="注册"/>
						<input class="login-btn" style="background:#0160b2" type="submit" value="登录"/>
					</div>
					<!--<div class="forget-pw"><a href="#">忘记密码？</a></div>-->
				</div>
			</div>
			<div style="clear:both"></div>
		</div>
		<!--banner区结束-->
		<!--热门推荐开始-->
		<div class="prolb-show">
			<h3>热门推荐</h3>
			<div class="piclb">
				<a href="#"><img src="images/tuijian_pic1.png" width="192" height="226"/></a>
				<a href="#"><img src="images/tuijian_pic1.png" width="192" height="226"/></a>
				<a href="#"><img src="images/tuijian_pic1.png" width="192" height="226"/></a>
				<a href="#"><img src="images/tuijian_pic1.png" width="192" height="226"/></a>
				<div style="clear:both"></div>
			</div>
		</div>
		<!--热门推荐结束-->
		<!--产品推荐开始-->
		<div class="prolb-show">
			<h3 class="prolb-show-tit">产品推荐<a href="#"><span class="span1">更多</span><span class="span2">></span></a></h3>
			<div class="piclb2">
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<div style="clear:both"></div>
			</div>
		</div>
		<!--产品推荐结束-->
		<!--最新产品开始-->
		<div class="prolb-show">
			<h3 class="prolb-show-tit">最新产品<a href="#"><span class="span1">更多</span><span class="span2">></span></a></h3>
			<div class="piclb3">
				<div class="newpro-lb">
					<div class="lb-left">
						<a href="#"><img src="images/new_pic1.png" width="136" height="136"/></a>
						<div class="a1"><a href="#"><img src="images/new_logo1.png" width="85" height="32"/></a></div>
						<div class="a1"><a href="#">明玛锁业</a></div>
					</div>
					<div class="lb-right">
						<a href="#"><img src="images/new_pic2.png" width="60" height="57"/></a>
						<div class="txt2">
							<a class="intr" href="#">玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁</a>
							<a class="mon" href="#">查看价格</a>
						</div>
					</div>
					<div class="lb-right">
						<a href="#"><img src="images/new_pic2.png" width="60" height="57"/></a>
						<div class="txt2">
							<a class="intr" href="#">玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁</a>
							<a class="mon" href="#">查看价格</a>
						</div>
					</div>
					<div class="lb-right">
						<a href="#"><img src="images/new_pic2.png" width="60" height="57"/></a>
						<div class="txt2">
							<a class="intr" href="#">玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁</a>
							<a class="mon" href="#">查看价格</a>
						</div>
					</div>
				</div>
				<div class="newpro-lb">
					<div class="lb-left">
						<a href="#"><img src="images/new_pic1.png" width="136" height="136"/></a>
						<div class="a1"><a href="#"><img src="images/new_logo1.png" width="85" height="32"/></a></div>
						<div class="a1"><a href="#">明玛锁业</a></div>
					</div>
					<div class="lb-right">
						<a href="#"><img src="images/new_pic2.png" width="60" height="57"/></a>
						<div class="txt2">
							<a class="intr" href="#">玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁</a>
							<a class="mon" href="#">查看价格</a>
						</div>
					</div>
					<div class="lb-right">
						<a href="#"><img src="images/new_pic2.png" width="60" height="57"/></a>
						<div class="txt2">
							<a class="intr" href="#">玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁</a>
							<a class="mon" href="#">查看价格</a>
						</div>
					</div>
					<div class="lb-right">
						<a href="#"><img src="images/new_pic2.png" width="60" height="57"/></a>
						<div class="txt2">
							<a class="intr" href="#">玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁玻璃门防盗锁</a>
							<a class="mon" href="#">查看价格</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--最新产品结束-->
		<!--产品推荐开始-->
		<div class="prolb-show">
			<div class="piclb2">
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<!--循环开始-->
				<div class="prolb-showlb">
					<a href="#"><img src="images/tuijian_suo1.png" width="188" height="160"/></a>
					<h4>玥玛锁业</h4>
					<div class="txt1">
						<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
					</div>
					<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
				</div>
				<!--循环结束-->
				<div style="clear:both"></div>
			</div>
		</div>
		<!--产品推荐结束-->
	</div>
	<!--右侧列表结束-->
	<div style="clear:both"></div>
</div>
<!--内容区结束-->
<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
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
