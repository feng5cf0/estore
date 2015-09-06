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
	function chooseAttribute(statusX,statusY,attrName,attrId){
		var attr = document.getElementsByName("attr"+statusX);
		for(var i=1;i<=attr.length;i++){
			document.getElementById("attr"+statusX+i).className="color-ys";
		}
		
		document.getElementById("attr"+statusX+statusY).className="color-ys xz";
		document.getElementById("attributeList"+statusX).value = attrId;
		
		getNumPrice();
	}
	
	function getNumPrice(){
		var attrArray = document.getElementsByName("attributeList");
		var attributeStr = "";
		for(var i=0;i<attrArray.length;i++){
			attributeStr = attributeStr+attrArray[i].value;
			if(i+1 < attrArray.length){
				attributeStr = attributeStr + ",";
			}
		}
		$.ajax({
			type:"post",
			url:"${basePath}front/goodsDetailAction!getNumPrice.action",
			data:{"attributeStr":attributeStr,"goodsId":"${goods.id}"},
			dataType:"json",
			success:function(msg){
				msg = eval(msg);
				<c:if test="${goods.onsale != null}">
					document.getElementById("price1").innerHTML = msg.price;
					document.getElementById("price2").innerHTML = msg.price*100*${goods.onsale.percent}/100;
				</c:if>
				<c:if test="${goods.onsale == null}">
					document.getElementById("price1").innerHTML = "";
					document.getElementById("price2").innerHTML = msg.price;
				</c:if>
				document.getElementById("frontAccount").innerHTML = msg.frontAccount;
			}
		});
	}
	
	function addFavorite(goodsId){
		$.ajax(
	    {
	        type: "post",
	        url: "${basePath}front/favoriteAction!add.action",
	        data:{"favorite.goodsId":goodsId},
	        dataType:"text",
	        success: function (msg) {
				if("tologin" == msg){
					window.location.href = "${basePath}front/memberAction!toMemberLoginPage";
				}else if ("success" == msg){
					document.getElementById("favoriteButton").disabled="false";
					document.getElementById("favoriteButton").style.background="#5dbfec";
				}
	        }
	    });
	}
	
	function checkDate(){
		
		//判断是否选择商品属性
		var attrArray = document.getElementsByName("attributeList");
		for(var i=0;i<attrArray.length;i++){
			if(attrArray[i].value == '0'){
				alert("请选择商品属性!");
				return false;
			}
		}
		//判断商品库存是否充足，
		var _account = document.getElementById("frontAccount").innerText;
		_account = parseInt(_account);
		if(_account <= 0){
			alert("商品库存不足,请选择其他属性商品");
			return false;
		}
	}
	
	function amountAdd(){
		var _amount = document.getElementById("total").value;
		_amount = parseInt(_amount);
		document.getElementById("total").value = _amount+1;
	}
	
	function amountReduce(){
		var _amount = document.getElementById("total").value;
		_amount = parseInt(_amount);
		if(_amount>1)
			document.getElementById("total").value = _amount-1;	
	}
	function changeTable(tableId){
		var tables = $("#tableList a");
		for(var i=0;i<tables.length-1;i++){
			tables[i].className = "qh-tit";
			document.getElementById("tablePage"+(i+1)).style.display = "none";
		}
		document.getElementById("table"+tableId).className = "qh-tit hov";
		document.getElementById("tablePage"+tableId).style.display = "block";
	}
	
	function erweima(){
		document.getElementById('erweima').style.display='block';
		document.getElementById('fade').style.display='block'		
	}
</script>
	<style type="text/css">
		.erweima {
  				display: none;  position: absolute;  
  				top: 25%;  left: 25%;  width: 50%;  height: 50%;  
  				padding: 16px;  border: 16px solid orange;  background-color: white;  
  				z-index:1002;  overflow: auto;
  		}
	</style>
</head>

<body>
<!--顶部开始-->
<jsp:include page="/WEB-INF/front/frontTop.jsp"></jsp:include>
<!--顶部结束-->

<!--nav区开始-->
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
		<!--当前所在位置开始-->
		<div class="now-tit">
			<span>当前所在位置：<a href="#">首页</a><span> &gt; </span><a href="#">产品列表</a><span> &gt; </span><a href="#">摩托车遥控拷贝器</a><span> &gt; </span>汽车锁与防盗锁</span>
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
			<form action="${basePath}front/cartFrontAction!addCart.action" method="post" onsubmit="return checkDate();">
				<div class="proxq-tit-right">
					<h3>${goods.goodsName}</h3>
					<input type="hidden" value="${goods.id}" name="goods.id"/>
					<div class="proxq-tit-jg">
						<div class="jglb">
							<span class="xqjg1"><s:property value="getText('goodsdetail.price')"/></span>
							<span class="xqjg2">
								<c:if test="${goods.onsale != null}">
									<span id="price1" style="text-decoration:line-through;">${goods.goodsPrice}</span>
									<span id="price2" ><f:formatNumber type="number" value="${goods.goodsPrice * goods.onsale.percent}" pattern="0.00"/></span>
								</c:if>
								<c:if test="${goods.onsale == null}">
									<span id="price1" style="text-decoration:line-through;"></span>
									<span id="price2" ><f:formatNumber type="number" value="${goods.goodsPrice}" pattern="0.00"/></span>									
								</c:if>
							<span>&nbsp;￥</span></span>
							<!--
							<div class="chakan-bzjg">
								<s:property value="getText('goodsdetail.otherprice')"/><img src="images/xia_jt.png" width="10"/>
								<div class="chakan-bzjg-zk">
									<p>美元：268元</p><p>日元：268元</p><p>港元：268元</p>
								</div>
							</div>
							-->
							<div style="clear:both"></div>
						</div>
						<div class="jglb">
							<span>库存：</span><span class="jglb-ys" id="frontAccount">${goods.frontAccount}</span>
						</div>
						<div class="jglb">
							<span><s:property value="getText('goodsdetail.onsale')"/></span>
							<span class="jglb-ys">
								<c:if test="${goods.onsale != null}">
									${goods.onsale.description}
								</c:if>
							</span>
						</div>
					</div>
					<div class="proxq-tit-cslb">
						<span class="cs-tit">品牌：</span>
						<span class="cs-body"><b>${goods.brand.brandName}</b></span>
					</div>
					<c:forEach items="${attributeList}" var="item" varStatus="statusX">
						<input type="hidden" name="attributeList" id="attributeList${statusX.count}" value="0"/>
						<div class="proxq-tit-cslb">
							<span class="cs-tit">${item.attributeName}：</span>
							<span class="cs-body">
								<c:forEach items="${item.attributeValueSet}" var="attr" varStatus="statusY">
									<a class="color-ys" id="attr${statusX.count }${statusY.count}" name="attr${statusX.count}" href="javascript:chooseAttribute(${statusX.count},${statusY.count},'${attr.attributeValue}',${attr.id});">${attr.attributeValue}</a>
								</c:forEach>
							</span>
						</div>
					</c:forEach>
					<div class="proxq-tit-cslb">
						<span class="cs-tit">购买数量：</span>
						<span class="cs-body">
							<a class="num-jian2" href="javascript:amountReduce();">-</a>
							<input class="num-inp2" type="text" value="1" name="total" id="total"/>
							<a class="num-jian2" href="javascript:amountAdd();">+</a>
						</span>
					</div>
					<div class="proxq-tit-cslb" style="margin-left:70px">
						<input class="submit-btn submit-btn2" type="submit" value="<s:property value="getText('goodsdetail.addcart')"/>"/>
						<input class="submit-btn submit-btn2" type="button" id="favoriteButton"
							value="<s:property value="getText('goodsdetail.addfavorit')"/>" 
							onclick="javascript:addFavorite(${goodsId});" />
					</div>
				</div>
			</form>
			<div style="clear:both"></div>
		</div>
		<!--头部结束-->
		<!--切换头部开始-->
		<div class="proxq-titqh" id="tableList">
			<a class="qh-tit hov" href="javascript:changeTable(1);" id="table1"><s:property value="getText('goodsdetail.detail')"/></a> 
			<a class="qh-tit" href="javascript:changeTable(2);" id="table2"><s:property value="getText('goodsdetail.memo')"/></a>
			<a class="qh-tit" href="javascript:changeTable(3);" id="table3"><s:property value="getText('goodsdetail.samecategory')"/></a>
			<a class="sao-ewm" href="javascript:erweima();">二维码，扫一扫</a>
			<div class="ewm-pic2">
				<img class="jt" src="images/shang_jt.png" width="16" height="8"/>
				<img src="images/erweima.png" width="95" height="95"/>
			</div>
		</div>
		<div id="erweima" class="erweima">
			erweima
		</div>
		<!-- 弹出框遮罩 -->
		<div id="fade" class="black_overlay"></div>

		<!--详情内容开始-->
		<div class="proxq-con1" id="tablePage1">
			<div class="proxq-gglb">
				<p>商品名称：${goods.goodsName}</p>
				<p>商品毛重：2.00kg</p>
			</div>
			<h4>${goods.goodsDescription}</h4>
			<img src="images/proxq_pic2.png" width="750" height="470"/>
		</div>
		<!--详情内容结束-->
		
		<!-- 同类产品开始 -->
		<div id="tablePage3" style="display:none" >
			<jsp:include page="/WEB-INF/front/goodsDetailCategory.jsp"></jsp:include>
		</div>
		<!-- 同类产品结束 -->
		
		<!-- 产品备注开始 -->
		<div id="tablePage2" style="display:none" >
			<jsp:include page="/WEB-INF/front/goodsDetailRemark.jsp"></jsp:include>
		</div>
		<!-- 产品备注结束 -->
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
	
</body>
</html>