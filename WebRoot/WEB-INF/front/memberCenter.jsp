<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ include file="/common.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="css/default.css">
 <script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/kefu.js"></script>
 <script type="text/javascript" src="js/member/memberModify.js?radom=123"></script>
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
				<a class="a1" href="front/memberAction!toMemberCenterPage">${sessionScope.member.memberAlias }</a><a href="front/memberAction!toMemberRegisterPage">免费注册</a>
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
		<div class="now-tit" id="grzx">
			<span>当前所在位置：个人中心</span>
			<a class="btn" href="#">返回上一页</a>
		</div>
		<div class="now-titlb center-con">
			<!--头像区域开始-->
			<div class="center-tx" id="grxxcz">
				<img class="tx" src="images/touxiang2.png" width="95" height="95"/>		
				<div class="center-mid">
					<h5>王女士<a href="#" id="memberModifyBtn">修改个人信息</a></h5>
					<div class="txt7">会员级别：初级会员</div>
					<div class="txt8">上次登录：2015-7-14 15:56:24</div>
					<div>
						<a class="gwc-btn" href="#">查看购物车</a>
					</div>
				</div>
				<div class="center-xmlb">
					<p><a class="lba" href="#" id="pressWdyhq">我的优惠券（7）</a></p>
					<p><a class="lba" href="#" id="integralSearch">积分查询</a></p>
					<p><a class="lba" href="#" id="findOrderAll">订单查询</a></p>
					<p><a class="lba" href="#" id="cpscBtn">产品收藏</a></p>
					<p><a class="lba" href="front/memberAction!logout">退出</a></p>
				</div>	
			</div>
			<!--头像区域结束-->
			<!-- 我的优惠券开始 -->
			
			<!-- 回收站开始 -->
			<div class="eduit-tit" id="hszHeader">
				<a href="#" id="pressWsy">未使用（3）</a>
				<a href="#" id="pressYsy">已使用（5）</a>
				<a href="#" id="pressygq">已过期（2）</a>
				<a class="hov" href="#" id="pressHsz">回收站（1）</a>
				<div class="line"></div>
			</div>
			<div id="hsz" class="white-conbg" style="padding-bottom:25px">
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已过期
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：2015-7-14
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已使用
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 回收站结束 -->
			<!-- 未使用开始 -->
			<!-- <div class="eduit-tit" id="wsyHeader">
				<a class="hov" href="#">未使用（3）</a>
				<a href="#">已使用（5）</a>
				<a href="#">已过期（2）</a>
				<a href="#">回收站（1）</a>
				<div class="line"></div>
			</div> -->
			<div class="white-conbg" style="padding-bottom:25px" id="wsy">
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：2015-7-14
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：2015-7-14
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：2015-7-14
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 未使用结束-->
			<!-- 已过期开始 -->
			<div class="white-conbg" style="padding-bottom:25px" id="ygq">
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已过期
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已过期
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已过期
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 已过期结束 -->
			<!-- 已使用开始 -->
			<div class="white-conbg" style="padding-bottom:25px" id="ysy">
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已使用
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已使用
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
				<!--优惠券列表-->
				<div class="center-yhqlb">
					<p class="quan-num">券编号：89756234</p>
					<div>
						<img class="quan-pic" src="images/youhuiquan.jpg" width="330"/>
						<div class="quan-sm">
							<p>1.优惠券使用说明1</p>
							<p>2.优惠券使用说明2</p>
							<div class="use-time">
								有效时间：已使用
								<input class="chaxun-btn" type="submit" value="删 除" style="width:75px;margin-left:20px"/>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 已使用结束 -->
			<!-- 我的优惠券结束 -->
			<div class="now-tit" id="qbdd">
			<span>当前所在位置：<a href="#">个人中心</a><span> > </span>全部订单</span>
			<a class="btn" href="front/memberAction!toMemberCenterPage">返回个人中心</a>
		   </div>
		<div class="now-titlb center-con" id="wddd">
			<!--我的订单开始-->
			<div class="white-conbg">
				<div class="order-cxtit" style="background:#f4f4f4">
					<h4 style="color:#ff4400">全部订单</h4>
					<div class="ssk">
						<input class="inp" style="background:#fff" type="text" placeholder="您可以输入订单号查询"/>
						<input class="chaxun-btn" type="submit" value="查询"/>
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
						<p><a href="#">付款</a></p>
						<p><a href="#">查看</a></p>
						<p><a href="#">取消订单</a></p>
					</div>
				</div>
				<div class="shop-prolb-body my-orderlb3">
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3">小王</div>
					<div class="wid wid3">
						<p style="text-decoration:line-through;color:#999">￥105.00</p>
						<p>￥69.00</p>
						<p style="margin-top:5px"><span class="low-price">卖家降价</span></p>
					</div>
					<div class="wid wid3" style="color:#999">2015-7-14 <br/>15:56:42</div>
					<div class="wid wid3" style="color:#999">已完成</div>
					<div class="wid wid4" style="margin-left:2%">
						<p><a href="#">付款</a></p>
						<p><a href="#">查看</a></p>
						<p><a href="#">取消订单</a></p>
					</div>
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
						<p><a href="#">付款</a></p>
						<p><a href="#">查看</a></p>
						<p><a href="#">取消订单</a></p>
					</div>
				</div>
				<div class="shop-prolb-body my-orderlb3">
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3">小王</div>
					<div class="wid wid3">
						<p style="text-decoration:line-through;color:#999">￥105.00</p>
						<p>￥69.00</p>
						<p style="margin-top:5px"><span class="low-price">卖家降价</span></p>
					</div>
					<div class="wid wid3" style="color:#999">2015-7-14 <br/>15:56:42</div>
					<div class="wid wid3" style="color:#999">已完成</div>
					<div class="wid wid4" style="margin-left:2%">
						<p><a href="#">付款</a></p>
						<p><a href="#">查看</a></p>
						<p><a href="#">取消订单</a></p>
					</div>
				</div>
				<!--我的订单列表结束-->
			</div>
			<!--我的订单结束-->
			<!--换页样式-->
			<div class="total-huanye" style="margin-bottom:40px">
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
			<!--猜您喜欢开始-->
			<div class="white-conbg" style="position:relative">
				<div class="order-cxtit">
					<h4>猜您喜欢</h4>
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
			<!--猜您喜欢结束-->
		</div>
			<!--当前所在位置开始-->
		<div class="now-tit" id="cpsc">
			<span>当前所在位置：<a href="#">个人中心</a><span> > </span>产品收藏</span>
			<a class="btn" href="front/memberAction!toMemberCenterPage">返回个人中心</a>
		</div>
		<div class="now-titlb" id="cpscInfo">
			<h4>产品收藏</h4>
			<!--购物车列表开始-->
			<div class="shop-prolb">
				<h5>全部商品<span>15</span></h5>
				<div class="shop-prolb-tit">
					<div class="wid wid1"><input class="cbox" type="checkbox"/> 全选</div>
					<div class="wid wid2">商品</div>
					<div class="wid wid3">单价</div>
					<div class="wid wid3">数量</div>
					<div class="wid wid3">单重量</div>
					<div class="wid wid3">总重量</div>
					<div class="wid wid3">金额</div>
					<div class="wid wid4">操作</div>
				</div>
				<div class="shop-prolb-body">
					<div class="wid wid1"><input class="cbox" type="checkbox"/> </div>
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3 monys">￥99.00</div>
					<div class="wid wid3">
						<a class="num-jian" href="javascript:;">-</a><input class="num-inp" type="text"  value="1"/><a class="num-jian" href="javascript:;">+</a>
					</div>
					<div class="wid wid3">100.00克</div>
					<div class="wid wid3">200.00克</div>
					<div class="wid wid3 monys">￥198.00</div>
					<div class="wid wid4">
						<p><a href="#">删除</a></p>
						<p><a href="#">移出收藏夹</a></p>
					</div>
				</div>
				<div class="shop-prolb-body">
					<div class="wid wid1"><input class="cbox" type="checkbox"/> </div>
					<div class="wid wid2">
						<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
						<div class="txt1"><a href="#">防盗门锁 防盗门锁防盗门锁盗门锁防盗门盗门锁防盗门</a></div>
					</div>
					<div class="wid wid3 monys">￥99.00</div>
					<div class="wid wid3">
						<a class="num-jian" href="javascript:;">-</a><input class="num-inp" type="text"  value="1"/><a class="num-jian" href="javascript:;">+</a>
					</div>
					<div class="wid wid3">100.00克</div>
					<div class="wid wid3">200.00克</div>
					<div class="wid wid3 monys">￥198.00</div>
					<div class="wid wid4">
						<p><a href="#">删除</a></p>
						<p><a href="#">移出收藏夹</a></p>
					</div>
				</div>
				<!--结算开始-->
				<div class="shop-end">
					<div class="end-left">
						<input class="cbox" type="checkbox"/>
						<span>全选</span>
						<a class="a1" href="#">删除</a>
						<a class="a1" href="#">移出收藏夹</a>
					</div>
					<div class="end-right">
						<span class="num1">已选<b>12</b>件商品</span>
						<span class="num1">总重量<b>100</b>克</span>
						<span>合计（不含运费）：</span><span class="mon1">￥599.00</span>
						<input class="submit-btn" type="submit" value="去结算"/>
					</div>
				</div>
				<!--结算结束-->
			</div>
			<!--购物车列表结束-->
		</div>
		<!--当前所在位置结束-->
			<!--修改信息开始-->
			<div id="modify" class="eduit-tit">
				<a id="photoModify" href="#">头像修改</a>
				<a id="grxxxg" class="hov" href="#">个人信息修改</a>
				<a id="mmxg" href="#">密码修改</a>
				<div class="line"></div>
			</div>
			<!-- 头像修改开始 -->
			<div id="memberPhoto" class="white-conbg  write-adress" style="padding-top:30px">
				<form action="front/memberInfoAction!picScan" method="post" id="picForm" enctype="multipart/form-data">
					<div class="pay-lb uptx-img">
	                <input id="pic" name="pic" class="file" type="file" /> 
	                    <div class="file-ys">选择您要上传的头像</div>
	                    <div class="up-pz">*头像的图片尺寸、大小说明</div>
						<div class="uptx-img-wk">
							<img id="image" name="image" src="${sessionScope.member.memberInfo.photoPath }" width="150" height="150"/>
						</div>
	                </div>
					<div class="pay-lb">
						<input class="chaxun-btn" type="submit" value="保 存" style="width:75px;margin-left:20px"/>
					</div>
				</form>
			</div>
			<!-- 头像修改结束 -->
			<!-- 个人信息修改开始 -->
			<div id="memberModify" class="white-conbg  write-adress" style="padding-top:30px">
			<form action="front/memberAction!UpdateMember" method="post" enctype="multipart/form-data">
				<div class="pay-lb">
                	<span class="span1"><span class="xinghao">*</span>姓名：</span>
					<input name="member.memberRealname" id="memberRealname" class="inp1" type="text" value="${sessionScope.member.memberRealname }"/>
                	<input name="member.id" value="${sessionScope.member.id }" type="hidden"/>
                	<input name="memberInfo.id" value="${sessionScope.member.memberInfo.id }" type="hidden"/>
                </div>
                <div class="pay-lb">
                	<span class="span1"><span class="xinghao">*</span>昵称：</span>
					<input name="member.memberAlias" id="memberAlias" class="inp1" type="text" value="${sessionScope.member.memberAlias }"/>
                </div>
				<div class="pay-lb">
                	<span class="span1"><span class="xinghao">*</span>性别：</span>
					<input name="memberInfo.sex" id="sex" type="radio" style="vertical-align:sub" value="0"/> 
					<input name="memberInfo.sex" id="sex" type="radio" style="vertical-align:sub" checked="checked" value="1"/> 女
					<input name="memberInfo.sex" id="sex" type="radio" style="vertical-align:sub" value="2"/> 
                </div>
				<div class="pay-lb">
                	<span class="span1">生日：</span>
					<select class="inp1" style="width:70px">
                    	<option>1989</option>
                        <option>1988</option>
                        <option>1987</option>
                    </select> 年
					<select class="inp1" style="width:70px">
                    	<option>4月</option>
                        <option>3月</option>
                        <option>2月</option>
                    </select> 月
					<select class="inp1" style="width:70px">
                    	<option>26</option>
                        <option>25</option>
                        <option>24</option>
                    </select> 日
                </div>
				<div class="pay-lb">
                	<span class="span1">身份证号：</span>
					<input name="memberInfo.IdCard" id="IdCard" class="inp1" type="text" style="width:300px"/>
                </div>
				<div class="pay-lb">
                	<span class="span1">邮箱：</span>
					<span name="memberInfo.email" id="email" style="font:bold 13px ''">11****72@qq.com</span>
					<a href="#" style="color:#005ea7">修改</a>
					<span style="color:#999">已验证</span>
                </div>
				<div class="pay-lb">
                	<span class="span1">所在地：</span>
					<select class="inp1" style="width:100px">
                    	<option>山东省</option>
                        <option>河北省</option>
                        <option>江苏省</option>
                    </select>
					<select class="inp1" style="width:100px">
                    	<option>济南市</option>
                        <option>石家庄</option>
                        <option>徐州</option>
                    </select>
					<select class="inp1" style="width:100px">
                    	<option>二环以内</option>
                        <option>二环以内</option>
                        <option>二环以内</option>
                    </select>
					<div style="margin:15px 0px 0px 106px">
						<input name="memberInfo.location" id="location" class="inp1" type="text" style="width:311px"/>
					</div>
                </div>
				<div class="pay-lb">
                	<span class="span1">营业执照：</span>
                    <input class="file" type="file"/>
                    <div class="file-ys">点击上传营业执照</div>
                    <div class="up-pz">*营业执照的图片尺寸、大小说明</div>
                    <div class="up-pz">
                    	<img src="images/yingyezhizhao.jpg" width="500"/>
                    </div>
                </div>
				<div class="pay-lb">
                	<span class="span1">门头照：</span>
                    <input class="file" type="file"/>
                    <div class="file-ys">点击上传门头照</div>
                    <div class="up-pz">*门头照的图片尺寸、大小说明</div>
                    <div class="up-pz">
                    	<!--<img src="images/yingyezhizhao.jpg" width="500"/>-->
                    </div>
                </div>
				<div class="pay-lb">
					<span class="span1">&nbsp;</span>
					<input id="save" class="chaxun-btn" type="submit" value="保 存" style="width:75px"/>
				</div>
			</form>
			</div>
			<!--修改信息结束-->
			<!--密码修改开始 -->
			<div id="passwordModify" class="white-conbg  write-adress" style="padding-top:30px">
				<div class="pay-lb">
                	<span class="span1">原密码：</span>
					<input name="password" id="password" class="inp1" type="password" style="width:200px"/>
                	<input name="memberPassword" id="memberPassword" type="hidden" value="${sessionScope.member.memberPassword }"/>
                	<input name="memberId" id="memberId" type="hidden" value="${sessionScope.member.id }"/>
                </div>
				<div class="pay-lb">
                	<span class="span1">新密码：</span>
					<input name="newPssword" id="newPssword" class="inp1" type="password" style="width:200px"/>
                </div>
				<div class="pay-lb">
                	<span class="span1">再输入一次：</span>
					<input name="reNewPssword" id="reNewPssword" class="inp1" type="password" style="width:200px"/>
                </div>
				<div class="pay-lb">
					<span class="span1">&nbsp;</span>
					<input id="passSaveBtn" class="chaxun-btn" type="button" value="保 存" style="width:75px"/>
				</div>
			</div>
			<!--密码修改结束 -->
			
			<!--我的积分开始-->
			<div id="myIntegral" class="white-conbg jifen-lb">
				<!--我的积分列表开始-->
				<h4>我的积分</h4>
				<div class="jifen-num">
					您的账户目前总积分：<b style="color:#ff4400">100</b>分
					<a href="javascript:;">查看积分历史</a>
				</div>
				<div class="jifen-ls">
					<div class="ls-tit">
						<span>日期</span>
						<span>调整积分</span>
						<span>积分余额</span>
						<span>积分来源</span>
					</div>
					<div class="ls-body">
						<span>2015-7-14</span>
						<span>33</span>
						<span>100分</span>
						<span>新增积分</span>
					</div>
					<div class="ls-body">
						<span>2015-7-14</span>
						<span>33</span>
						<span>100分</span>
						<span>新增积分</span>
					</div>
					<div class="ls-body">
						<span>2015-7-14</span>
						<span>33</span>
						<span>100分</span>
						<span>新增积分</span>
					</div>
				</div>
				<!--我的积分列表结束-->
			</div>
			<!--我的积分结束-->
			
			<!--我的订单开始-->
			<div id="myOrder" class="white-conbg">
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
			<div id="myOrderInfo" class="white-conbg" style="position:relative">
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
			<div id="newProduct" class="white-conbg" style="position:relative">
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
























