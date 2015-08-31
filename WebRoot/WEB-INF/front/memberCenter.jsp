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
		<!--<a href="front/newProductAction!toNewProduct"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
		--><a href="front/productPromotionAction!toProductPromotion"  style="width:60px;"><s:property value="getText('index.onsale')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
						<a class="gwc-btn" href="<a href="${basePath}front/orderFrontAction!get.action">">查看购物车</a>
					</div>
				</div>
				<div class="center-xmlb">
					<p><a class="lba" href="front/productPromotionAction!toYHQ" id="pressWdyhq">我的优惠券</a></p>
					<p><a class="lba" href="${basePath}front/integralAction!toMyIntegral" id="integralSearch">积分查询</a></p>
					<p><a class="lba" href="${basePath}front/orderFrontAction!get.action" id="findOrderAll">订单查询</a></p>
					<p><a class="lba" href="${basePath}front/favoriteAction!get.action" id="cpscBtn">产品收藏</a></p>
					<p><a class="lba" href="${basePath}front/memberAction!logout">退出</a></p>
				</div>	
			</div>
			<!--头像区域结束-->
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
		                <input id="pic" name="pic" class="file" type="file" onchange="PreviewImage(this,'imgPreview')"/> 
		                <input id="id" name="id" type="hidden" value="${sessionScope.member.memberInfo.id}"/>
		                <input id="memberId" name="memberId" type="hidden" value="${sessionScope.member.id}"/>
	                    <div class="file-ys">选择您要上传的头像</div>
	                    <div class="up-pz">*头像的图片尺寸、大小说明</div>
						<div class="uptx-img-wk" id="imgPreview">
<%--  							<img id="image" name="image" src="${sessionScope.member.memberInfo.photoPath }" width="150" height="150"/>
 --%>					</div>
	                </div>
					<div class="pay-lb">
						<input class="chaxun-btn" type="submit" id="btn_upload" value="保 存" style="width:75px;margin-left:20px"/>
					</div>
				</form>
			</div>
			<!-- 头像修改结束 -->
			<!-- 个人信息修改开始 -->
			<div id="memberModify" class="white-conbg  write-adress" style="padding-top:30px">
			<form action="front/memberAction!UpdateMember" id="grxxxgForm" method="post" enctype="multipart/form-data">
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
					<input name="memberInfo.sex" id="sex" type="radio" style="vertical-align:sub" value="0"/> 男
					<input name="memberInfo.sex" id="sex" type="radio" style="vertical-align:sub" checked="checked" value="1"/> 女
                </div>
				<div class="pay-lb">
                	<span class="span1">生日：</span>
                	 <input name="memberInfo.birthday" id="birthday" class="Wdate" onfocus="WdatePicker({readOnly:true,maxDate:'%y-%M-%d'})" value="<f:formatDate value='${sessionScope.member.memberInfo.birthday }'  pattern='yyyy-MM-dd' />"/><br>
                </div>
				<div class="pay-lb">
                	<span class="span1">身份证号：</span>
					<input name="memberInfo.IdCard" id="IdCard" class="inp1" type="text" style="width:300px" value="${sessionScope.member.memberInfo.idCard }"/>
                </div>
				<div class="pay-lb">
                	<span class="span1">邮箱：</span>
					<span id="emailSpan" style="font:bold 13px ''">${sessionScope.member.memberInfo.email }</span>
					<input name="memberInfo.email" id="emailInput" class="inp1" type="text" style="width:300px" value="${sessionScope.member.memberInfo.email }"/>
					<a href="javascript:void(0)" style="color:#005ea7" id="update">修改</a>
					<span style="color:#999">已验证</span><br/>
                </div>
				<div class="pay-lb">
				
                	<span class="span1">所在地：</span>
					<select name="province" id="province" class="inp1" style="width:100px">
                    </select>
					<select name="city" id="city" class="inp1" style="width:100px">
                    </select>
					<select name="area" id="area" class="inp1" style="width:100px">
                    </select>
					<div style="margin:15px 0px 0px 106px">
						<input name="subLocation" id="location" class="inp1" type="text" style="width:311px"/>
					</div>
                </div>
				<div class="pay-lb">
                	<span class="span1">营业执照：</span>
                    <input name="licensePic" id="licensePic" class="file" type="file" onchange="PreviewImage(this,'license')"/>
                    <input name="tempLicense" id="tempLicense" type="hidden" value="${sessionScope.member.memberInfo.businessLicense }"/>
                    <div class="file-ys">点击上传营业执照</div>
                    <div class="up-pz">*营业执照的图片尺寸、大小说明</div>
                    <div class="up-pz" id="license">
                    	<c:if test="${not empty sessionScope.member.memberInfo.businessLicense}">
                    			<img src="${sessionScope.member.memberInfo.businessLicense }" width="500"/>
                    	</c:if>
                    </div>
                </div>
				<div class="pay-lb">
                	<span class="span1">门头照：</span>
                    <input name="doorPic" id="doorPic" class="file" type="file" onchange="PreviewImage(this,'door')"/>
                    <input name="tempDoor" id="tempDoor" type="hidden" value="${sessionScope.member.memberInfo.doorHeader }"/>
                    <div class="file-ys">点击上传门头照</div>
                    <div class="up-pz">*门头照的图片尺寸、大小说明</div>
                    <div class="up-pz" id="door">
                    	<c:if test="${not empty sessionScope.member.memberInfo.doorHeader}">
                    			<img src="${sessionScope.member.memberInfo.doorHeader }" width="500"/>
                    	</c:if>
                    </div>
                </div>
				<div class="pay-lb">
					<span class="span1">&nbsp;</span>
					<input id="save" class="chaxun-btn" type="button" value="保 存" style="width:75px"/>
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
			<!--新上产品开始-->
			<div id="newProduct" class="white-conbg" style="position:relative">
				<div class="order-cxtit">
					<h4>新上产品</h4>
				</div>
				<div class="mysc-lb">
					<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}" class="lbtn"></a><a href="#" class="rbtn"></a>
					<div class="mysc-lbwk">
						<c:forEach items="${goodsList}" var="item">
							<div class="prolb-showlb prolb-showlb2">
								<a href="${basePath}front/goodsDetailAction!prepare.action?goodsId=${item.id}"><img src="images/new_pic1.png" width="164"/></a>
								<h5>${item.goodsName}</h5>
								<div class="txt1">
									<a href="#">${item.goodsDescription}</a>
								</div>
								<div class="money"><span style="font:bold 13px Arial, Helvetica, sans-serif">￥</span>${item.goodsPrice}</div>
							</div>
						</c:forEach>
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

<jsp:include page="/WEB-INF/front/frontBottom.jsp"></jsp:include>
<!--底部结束-->

<!--客服代码开始-->
<jsp:include page="/WEB-INF/front/frontService.jsp"></jsp:include>
<!--客服代码结束-->
<!-- 弹出框 -->

<div id="TcBox">
	<div class="filter-bg"></div>
	<div class="login-kua">
		<h3>标题文本<a class="close" href="#">×</a></h3>
		<div class="txt">警示的内容</div>
		<div class="sub"><input type="submit" value="确 定"/></div>
	</div>
</div>
</body>
</html>
























