<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
		
		//二维码划上效果
		$(".sao-ewm").hover(function(){
			$(".ewm-pic2").show();
		},function(){
			$(".ewm-pic2").hide();
		})
	})
</script>
<title>产品详情-相关产品</title>
</head>

<body>
<!--顶部开始-->
<div class="top">
	<div class="top-con">
		<div class="top-left">
			<a class="a1" href="#">请登录</a><a href="#">免费注册</a>
		</div>
		<div class="top-right">
			<div class="top-right-dw">
				<a class="set" href="javascript:;">设为首页</a>
				<span>|</span>
			</div>
			<div class="top-right-dw top-right-gwc" href="javascript:;">
				<img src="images/gowoche.png" width="15" height="14"/>
				<span class="txt">购物车</span>
				<span class="num">2</span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<span>|</span>
				<div class="gwc-xllb" style="displ ay:block">
					<a href="#">我的积分</a>
					<a href="#">我的余额</a>
				</div>
		    </div>
			<div class="top-right-dw top-right-scj" href="javascript:;">
				<span class="txt">收藏夹</span>
				<img src="images/jt_xia.png" width="9" height="7"/>
				<span>|</span>
				<div class="gwc-xllb" style="left:-7px;width:72px">
					<a href="#">我的收藏</a>
					<a href="#">我的收藏</a>
				</div>
		    </div>
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
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
					</div>
					<!--划上效果结束-->
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪2<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪2<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪2<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪2<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
					</div>
					<!--划上效果结束-->
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪3<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪3<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪3<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪3<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
					</div>
					<!--划上效果结束-->
				</dd>
			</dl>
			<dl class="prolb-left1-dl">
				<dt><img src="images/suo_biao.png" width="20"/>汽车钥匙</dt>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪4<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪4<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪4<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪4<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
					</div>
					<!--划上效果结束-->
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪5<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪5<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪5<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪5<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
					</div>
					<!--划上效果结束-->
				</dd>
				<dd class="pro-left1-li">
					<a href="#">汽车编程仪</a>
					<a href="#">汽车编程仪</a>
					<div style="clear:both"></div>
					<!--划上效果开始-->
					<div class="white-bg"></div>
					<div class="pro-left1-lilb">
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪6<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪6<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪6<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
						<div class="left1-lilb-div">
							<h3><img src="images/suo_biao.png" width="20"/>汽车编程仪6<a href="#" class="more">更多</a></h3>
							<div class="txt9">
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车编仪</a>
								<a href="#">汽程仪</a>
								<a href="#">编程仪</a>
								<a href="#">汽车</a>
								<a href="#">汽车仪</a>
								<a href="#">汽程仪</a>
								<a href="#">汽车编程仪</a>
							</div>
						</div>
					</div>
					<!--划上效果结束-->
				</dd>
			</dl>
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
		<!--当前所在位置开始-->
		<div class="now-tit">
			<span>当前所在位置：<a href="#">首页</a><span> > </span><a href="#">产品列表</a><span> > </span><a href="#">摩托车遥控拷贝器</a><span> > </span>汽车锁与防盗锁</span>
		</div>
		<!--当前所在位置结束-->
		<!--商品详情内容开始-->
		<!--头部开始-->
		<div class="proxq-tit">
			<div class="proxq-tit-left">
				<img class="proxq-pic1" src="images/proxq_pic1.png" width="366" height="366"/>
				<ul class="proxq-tit-ul">
					<li><img src="images/proxq_pic11.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic12.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic13.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic14.png" width="68" height="68"/></li>
					<li><img src="images/proxq_pic15.png" width="68" height="68"/></li>
				</ul>
			</div>
			<div class="proxq-tit-right">
				<h3>欧式简约卧室室内房门，欧式简约卧室室内房门欧式简约卧室室内房门欧式简约卧室室内房门</h3>
				<div class="proxq-tit-jg">
					<div class="jglb">
						<span class="xqjg1">价格：</span><span class="xqjg2">￥256.00</span>
						<div class="chakan-bzjg">
							查看其它币种的价格<img src="images/xia_jt.png" width="10"/>
							<div class="chakan-bzjg-zk">
								<p>美元：268元</p><p>日元：268元</p><p>港元：268元</p>
							</div>
						</div>
						<div style="clear:both"></div>
					</div>
					<div class="jglb">
						<span>促销信息：</span><span class="jglb-ys">满300减30</span>
					</div>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">编码：</span>
					<span class="cs-body"><b>TRK VW OO</b></span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">制造厂：</span>
					<span class="cs-body"><input class="radio" type="radio" checked="checked"/>售后</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">芯片：</span>
					<span class="cs-body">
						<input class="radio" type="radio" checked="checked"/>48芯片
						<input class="radio" type="radio"/>68芯片
					</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">备用钥匙：</span>
					<span class="cs-body">
						<input class="radio" type="radio" checked="checked"/>是的，需要
						<input class="radio" type="radio"/>不需要，谢谢
					</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">颜色：</span>
					<span class="cs-body">
						<a class="color-ys" href="javascript:;">白色</a>
						<a class="color-ys xz" href="javascript:;">金色</a>
						<a class="color-ys" href="javascript:;">灰色</a>
					</span>
				</div>
				<div class="proxq-tit-cslb">
					<span class="cs-tit">购买数量：</span>
					<span class="cs-body">
						<a class="num-jian2" href="javascript:;">-</a>
						<input class="num-inp2" type="text" value="1"/>
						<a class="num-jian2" href="javascript:;">+</a>
					</span>
				</div>
				<div class="proxq-tit-cslb" style="margin-left:70px">
					<input class="submit-btn submit-btn2" type="submit" value="加入购物车"/>
					<input class="submit-btn submit-btn2" type="submit" value="加入收藏" style="background:#5dbfec"/>
				</div>
			</div>
			<div style="clear:both"></div>
		</div>
		<!--头部结束-->
		<!--切换头部开始-->
		<div class="proxq-titqh">
			<a class="qh-tit" href="#">商品详情</a>
			<a class="qh-tit" href="#">产品备注</a>
			<a class="qh-tit hov" href="#">相关产品</a>
			<a class="qh-tit" href="#">同类产品</a>
			<a class="sao-ewm" href="javascript:;">二维码，扫一扫</a>
			<div class="ewm-pic2">
				<img class="jt" src="images/shang_jt.png" width="16" height="8"/>
				<img src="images/erweima.png" width="95" height="95"/>
			</div>
		</div>
		<!--切换头部结束-->
		<!--详情内容开始-->
		<!--产品列表开始-->
		<div class="new-prolb-wk" style="margin-top:20px">
			<!--循环开始-->
			<div class="prolb-showlb prolb-showlb2">
				<a href="#"><img src="images/new_pic1.png" width="188" height="175"/></a>
				<h4>玥玛锁业</h4>
				<div class="txt1">
					<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
				</div>
				<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
			</div>
			<!--循环结束-->
			<!--循环开始-->
			<div class="prolb-showlb prolb-showlb2">
				<a href="#"><img src="images/new_pic1.png" width="188" height="175"/></a>
				<h4>玥玛锁业</h4>
				<div class="txt1">
					<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
				</div>
				<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
			</div>
			<!--循环结束-->
			<!--循环开始-->
			<div class="prolb-showlb prolb-showlb2">
				<a href="#"><img src="images/new_pic1.png" width="188" height="175"/></a>
				<h4>玥玛锁业</h4>
				<div class="txt1">
					<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
				</div>
				<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
			</div>
			<!--循环结束-->
			<!--循环开始-->
			<div class="prolb-showlb prolb-showlb2">
				<a href="#"><img src="images/new_pic1.png" width="188" height="175"/></a>
				<h4>玥玛锁业</h4>
				<div class="txt1">
					<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
				</div>
				<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
			</div>
			<!--循环结束-->
			<!--循环开始-->
			<div class="prolb-showlb prolb-showlb2">
				<a href="#"><img src="images/new_pic1.png" width="188" height="175"/></a>
				<h4>玥玛锁业</h4>
				<div class="txt1">
					<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
				</div>
				<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
			</div>
			<!--循环结束-->
			<!--循环开始-->
			<div class="prolb-showlb prolb-showlb2">
				<a href="#"><img src="images/new_pic1.png" width="188" height="175"/></a>
				<h4>玥玛锁业</h4>
				<div class="txt1">
					<a href="#">功能：支持老款福特、马自达等，读写速度快，自动识别芯片</a>
				</div>
				<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>66.00</div>
			</div>
			<!--循环结束-->
			<div style="clear:both"></div>
		</div>
		<!--产品列表结束-->
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
		<!--详情内容结束-->
		<!--商品详情内容结束-->
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























