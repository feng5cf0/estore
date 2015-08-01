<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
<title>个人中心</title>
</head>

<body>
<!--顶部开始-->
<div class="top">
	<div class="top-con">
		<c:if test="${empty sessionScope.member.memberAlias }">
			<div class="top-left">
				<a class="a1" href="front/memberAction!toMemberLoginPage">请登录</a><a href="front/memberAction!toMemberRegisterPage">免费注册</a>
			</div>
		</c:if>
		<c:if test="${not empty sessionScope.member.memberAlias }">
			<div class="top-left">
				<a class="a1" href="#">${sessionScope.member.memberAlias }</a><a href="front/memberAction!toMemberRegisterPage">免费注册</a>
			</div>
		</c:if>
		<div class="top-right">
			<a class="top-right-dw" href="javascript:;">设为首页</a> |
			<div class="top-right-dw top-right-gwc" href="javascript:;">
				<img src="images/gowoche.png" width="15" height="14"/>
				<span class="txt">购物车</span>
				<span class="num">2</span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="displ ay:block">
					<a href="#">我的积分</a>
					<a href="#">我的余额</a>
				</div>
		    </div> |
			<div class="top-right-dw top-right-scj" href="javascript:;">
				<span class="txt">收藏夹</span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="left:-7px;width:72px">
					<a href="#">我的收藏</a>
					<a href="#">我的收藏</a>
				</div>
		    </div> |
			<div class="top-right-dw top-right-order" href="javascript:;">
				<span class="txt">我的订单</span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<div class="gwc-xllb" style="left:-8px;width:75px">
					<a href="#">查看订单</a>
					<a href="#">去结算</a>
					<a href="#">个人中心</a>
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
			<a href="#"><img src="images/yuyan_1.png" width="79" height="20"/></a>
			<a href="#"><img src="images/yuyan_2.png" width="79" height="20"/></a>
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
			<input class="inp" type="text" placeholder="搜索提示内容"/><input class="sub1" type="submit" value=" "/>
			<input class="sub2" type="submit" value=" "/>
		</div>
	</div>
</div>
<!--logo区结束-->
<!--nav区开始-->
<div class="nav">
	<div class="nav-con">
		<div class="fenlei-ys">全部分类</div>
		<a href="#">首页</a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#">最新产品</a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#">产品促销</a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#">关于我们</a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#">售后服务</a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#">银行账号</a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#">在线留言</a><img src="images/nav_line.png" width="2" height="33"/>
		<a href="#">联系我们</a><img src="images/nav_line.png" width="2" height="33"/>
	</div>
</div>
<!--nav区域结束-->

<!--内容区开始-->
<div class="total-con">
	<!--左侧列表开始-->
	<div class="prolb-left">
		<div class="prolb-left1">
			<dl class="prolb-left1-dl">
				<dt><img src="images/suo_biao.png" width="20"/>汽车钥匙</dt>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
				</dd>
			</dl>
			<dl class="prolb-left1-dl">
				<dt><img src="images/suo_biao.png" width="20"/>汽车钥匙</dt>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
				</dd>
			</dl>
			<!--划上效果开始-->
			<div class="pro-left1-lilb">
				<div class="lb1">
					<span class="tit">调表仪仪<b>|</b></span>
					<span class="body">
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
					</span>
				</div>
				<div class="lb1">
					<span class="tit">调表仪<b>|</b></span>
					<span class="body">
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
						<a class="lba" href="#">汽车编程</a>
						<a class="lba" href="#">调表仪</a>
					</span>
				</div>
			</div>
			<!--划上效果结束-->
		</div><!--列表1-->
		<!--品牌产品开始-->
		<div class="pp-pro">
			<h3>品牌产品</h3>
			<div class="pp-prolb">
				<div class="cb-lbwk">
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<a class="cb-lb" href="#"><img src="images/chebiao1.png" width="58" height="40"/></a>
					<div style="clear:both"></div>
				</div>
				<div class="pp-txtlb">
					<a href="#">忍者神龟系列忍者神龟系列忍者神龟系列</a>
					<a href="#">忍者神龟系列忍者神龟系列忍者神龟系列</a>
					<a href="#">忍者神龟系列忍者神龟系列忍者神龟系列</a>
					<a href="#">忍者神龟系列忍者神龟系列忍者神龟系列</a>
					<a href="#">忍者神龟系列忍者神龟系列忍者神龟系列</a>
					<a href="#">忍者神龟系列忍者神龟系列忍者神龟系列</a>
				</div>
			</div>
		</div>
		<!--品牌产品结束-->
		<!--网店链接开始-->
		<div class="pp-pro">
			<h3>网店链接</h3>
			<div class="wd-biao1">
				<div class="img"><a href="#"><img src="images/wangdian_logo1.png" width="54" height="54"/></a></div>
				<a href="#">淘宝网</a>
			</div>
			<div class="wd-biao1" style="float:right">
				<div class="img"><a href="#"><img src="images/wangdian_logo1.png" width="54" height="54"/></a></div>
				<a href="#">淘宝网</a>
			</div>
			<div style="clear:both"></div>
			<div class="wd-biao3">
				<div class="img"><a href="#"><img src="images/sumaitong.png" width="165" height="30"/></a></div>
				<a href="#">速卖通</a>
			</div>
			<div class="wd-ewm">
				<span class="ewm-txt">扫一扫，打开微店</span>
				<div><img class="ewm-pic" src="images/erweima.png" width="160" height="161"/></div>			
			</div>
		</div>
		<!--网店链接结束-->
	</div>
	<!--左侧列表结束-->
	<!--右侧列表开始-->
	<div class="prolb-right prolb-right2">
		<!--个人中心内容开始-->
		<div class="now-tit">
			<span>当前所在位置：个人中心</span>
			<a class="btn" href="#">返回上一页</a>
		</div>
		<div class="now-titlb center-con">
			<!--头像区域开始-->
			<div class="center-tx">
				<img class="tx" src="images/touxiang2.png" width="95" height="95"/>		
				<div class="center-mid">
					<h5>王女士<a href="#">修改个人信息</a></h5>
					<div class="txt7">会员级别：初级会员</div>
					<div class="txt8">上次登录：2015-7-14 15:56:24</div>
					<div>
						<a class="gwc-btn" href="#">查看购物车</a>
					</div>
				</div>
				<div class="center-xmlb">
					<p><a class="lba" href="#">我的优惠券（7）</a></p>
					<p><a class="lba" href="#">积分查询</a></p>
					<p><a class="lba" href="#">订单查询</a></p>
					<p><a class="lba" href="#">产品收藏</a></p>
					<p><a class="lba" href="front/memberAction!logout">退出</a></p>
				</div>	
			</div>
			<!--头像区域结束-->
			<!--我的订单开始-->
			<div class="white-conbg">
				<div class="order-cxtit">
					<h4>我的订单</h4>
					<div class="ssk">
						<input class="inp" type="text" placeholder="您可以输入订单号查询"/>
						<input class="chaxun-btn" type="submit" value="查询"/>
						<a href="#">查看全部订单</a>
					</div>
				</div>
				<!--我的订单列表开始-->
				<div class="my-orderlb">
					<span class="wid wid1">订单信息</span>
					<span class="wid wid2">收件人</span>
					<span class="wid wid2" style="margin-left:-1%;margin-right:1%">订单金额</span>
					<span class="wid wid3">
						<select>
							<option>最近三个月</option>
							<option>最近二个月</option>
							<option>最近一个月</option>
						</select>
					</span>
					<span class="wid wid3">
						<select>
							<option>全部状态</option>
							<option>完成订单</option>
							<option>已付款</option>
						</select>
					</span>
					<span class="wid">操作</span>
				</div>
				<div class="my-orderlb my-orderlb2">
					订单编号：<span style="color:#0160b2">98526545553</span>
				</div>
				<div class="shop-prolb-body my-orderlb3">
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3">小王</div>
					<div class="wid wid3">￥99.00</div>
					<div class="wid wid3" style="color:#999">2015-7-14 <br/>15:56:42</div>
					<div class="wid wid3 monys">等待付款</div>
					<div class="wid wid4" style="margin-left:2%">
						<p><a href="#">查看</a></p>
						<p><a href="#">删除</a></p>
					</div>
				</div>
				<div class="shop-prolb-body my-orderlb3">
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3">小王</div>
					<div class="wid wid3">￥99.00</div>
					<div class="wid wid3" style="color:#999">2015-7-14 <br/>15:56:42</div>
					<div class="wid wid3 monys">等待付款</div>
					<div class="wid wid4" style="margin-left:2%">
						<p><a href="#">查看</a></p>
						<p><a href="#">删除</a></p>
					</div>
				</div>
				<!--我的订单列表结束-->
			</div>
			<!--我的订单结束-->
			<!--我的收藏开始-->
			<div class="white-conbg" style="position:relative">
				<div class="order-cxtit">
					<h4>我的订单</h4>
				</div>
				<div class="mysc-lb">
					<a href="#" class="lbtn"></a><a href="#" class="rbtn"></a>
					<div class="mysc-lbwk">
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
					</div>
				</div>
			</div>
			<!--我的收藏结束-->
			<!--新上产品开始-->
			<div class="white-conbg" style="position:relative">
				<div class="order-cxtit">
					<h4>新上产品</h4>
				</div>
				<div class="mysc-lb">
					<a href="#" class="lbtn"></a><a href="#" class="rbtn"></a>
					<div class="mysc-lbwk">
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
						<!--循环开始-->
						<div class="prolb-showlb prolb-showlb2">
							<a href="#"><img src="images/new_pic1.png" width="164"/></a>
							<h5>玥玛锁业</h5>
							<div class="txt1">
								<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
							</div>
							<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
						</div>
						<!--循环结束-->
					</div>
				</div>
			</div>
			<!--新上产品结束-->
		</div>
		<!--个人中心内容结束-->
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
























