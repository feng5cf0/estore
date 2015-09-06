<%@page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@include file="/headDeclare.jsp"%>
<%@include file="/tagDeclare.jsp" %>
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
	function useNewAddress(){
		var newAddress = document.getElementById("newAddress");
		if(newAddress.checked == false){
			document.getElementById("newAddressArea").style.display = "none";
		}else{
			document.getElementById("newAddressArea").style.display = "block";
			
		    selectCountry();
		    $('#country').bind("change", selectProvince);
		    $('#province').bind("change", selectCity);
		    $('#city').bind("change", selectArea);
		}
	}

	function selectCountry() {
	    $.ajax(
	    {
	        type: "post",
	        url: "${basePath}front/locationFrontAction!getCountry.action",
	        dataType:"json",
	        success: function (msg) {
	        	eval(msg);
	            for (var i = 0; i < msg.length; i++) {
	                $("#country").append("<option value=" + msg[i].code + ">" + msg[i].name + "</option>");
	            }
	            selectProvince();
	        }
	    });
	}
	function selectProvince() {
	    $("#province").html("");
	    $.ajax(
	    {
	        type: "post",
	        url: "${basePath}front/locationFrontAction!getProvince.action",
	        data: { "pcode":$('#country').attr("value") },
	        dataType:"json",
	        success: function (msg) {
	        	eval(msg);
	            for (var i = 0; i < msg.length; i++) {
	                $("#province").append("<option value=" + msg[i].code + ">" + msg[i].name + "</option>");
	            }
	            selectCity();
	        }
	    });
	}
	function selectCity() {
	    $("#city").html("");
	    $.ajax(
	    {
	        type: "post",
	        url: "${basePath}front/locationFrontAction!getCity.action",
	        data: { "pcode":$('#province').attr("value") },
	        dataType:"json",
	        success: function (msg) {
	        	eval(msg);
	            for (var i = 0; i < msg.length; i++) {
	                $("#city").append("<option value=" + msg[i].code + ">" + msg[i].name + "</option>");
	            }
	            selectArea();
	        }
	    });
	}
	function selectArea() {
	    $("#area").html("");
	    $.ajax(
	    {
	        type: "post",
	        url: "${basePath}front/locationFrontAction!getArea.action",
	        data: { "pcode":$('#city').attr("value") },
	        dataType:"json",
	        success: function (msg) {
	        	eval(msg);
	            for (var i = 0; i < msg.length; i++) {
	                $("#area").append("<option value=" + msg[i].code + ">" + msg[i].name + "</option>");
	            }
	        }
	    });
	    
	    //计算运费
	    $.ajax({
	    	type:"post",
	    	url:"${basePath}front/locationFrontAction!getPrice.action",
			data:{"code":$('#city').attr("value")},
			success:function(result){
			
				var _result = parseFloat(result)
				document.getElementById("transformFee").innerHTML = _result;
				document.getElementById("transformFeeValue").value = _result;
				
				var _account = parseFloat(document.getElementById("baseMoney").value);
				alert(_account);
				document.getElementById("orderAccount").innerHTML = _result+_account;
				document.getElementById("payMoney").value = _result+_account;
			}
	    });
	}
	function checkOrderSubmit(){
		var idList = document.getElementsByName("addressId");
		var isChecked = 0;
		var isSelected = 0;
		var selectedValue;
		for(var i=0;i<idList.length;i++){
			if(idList[i].checked){
				selectedValue = idList[i].value;
				isSelected ++;				
			}
		}
		if(isSelected = 0){
			alert("请选择收货地址!");
			return false;
		}else{
			if(selectedValue  == 0){
				if(document.getElementById("detail").value == ""){
					alert("请填写具体收货地址!");
					return false;
				}
				if(document.getElementById("linkmanName").value == ""){
					alert("请填写收货人姓名!");
					return false;
				}
				if(document.getElementById("linkmanPhone").value = ""){
					alert("请填写收货人联系电话!");
					return false;
				}
				if(document.getElementById("postcode").value = ""){
					alert("请填写邮编地址!");
					return false;
				}
			}else{
				return true;
			}
		}
	}
</script>
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
			<a href="${basePath}front/newProductAction!getByCondition.action"  style="width:60px;"><s:property value="getText('index.newgoods')"/></a><img src="images/nav_line.png" width="2" height="33"/>
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
	  <form action="${basePath}front/orderFrontAction!addOrder.action" method="post" onsubmit="return  checkOrderSubmit();">
		<div class="now-tit">
			<span>当前所在位置：填写订单信息</span>
			<a class="btn" href="${basePath}front/cartFrontAction!getAll.action">返回</a>
		</div>
		<div class="now-titlb">
			<h4>填写并核对订单信息</h4>
            <!--购物车列表开始-->
			<div class="shop-prolb">
				<!--<h5>全部商品<span>15</span></h5>-->
				<div class="shop-prolb-tit">
					<div class="wid wid1">&nbsp;</div>
					<div class="wid wid2" style="margin-left:-60px">商品</div>
					<div class="wid wid3">属性</div>
					<div class="wid wid3" style="margin-left:35px">单价</div>
					<div class="wid wid3">是否促销</div>
					<div class="wid wid3">数量</div>
					<div class="wid wid3">金额</div>
				</div>
				
				<c:forEach items ="${cartList}" var="item">
					<div class="shop-prolb-body" style="border-bottom:none;padding-bottom:0">
						<div class="wid wid1">&nbsp;</div>
						<input type="hidden" name="cartIds" value="${item.id}"/>
						<div class="wid wid2" style="margin-left:-30px">
							<a href="#"><img class="pic1" src="images/new_pic2.png" width="56" height="56"/></a>
							<div class="txt1"><a href="#">${item.goods.goodsName}</a></div>
						</div>
						<div class="wid wid3" align="center">
							<div class="txt1">
								<c:if test="${item.goodsAttribute.attributeValue1 != null}">
									${item.goodsAttribute.attributeValue1.attributeValue}
								</c:if>
								<c:if test="${item.goodsAttribute.attributeValue2 != null}">
									/${item.goodsAttribute.attributeValue2.attributeValue}
								</c:if>
								<c:if test="${item.goodsAttribute.attributeValue3 != null}">
									/${item.goodsAttribute.attributeValue3.attributeValue}
								</c:if>
							</div>
						</div>
						<div class="wid wid3 monys" id="price${status.count}" style="margin-left:8px">
							<div class="wid wid3 monys" id="price${status.count}">
								<c:if test="${item.goodsAttribute.price != null}">
									<c:if test="${item.goods.onsale != null}">
										<f:formatNumber value="${item.goodsAttribute.price * 100 * item.goods.onsale.percent/100}" pattern="0.00"></f:formatNumber>
									</c:if>
									<c:if test="${item.goods.onsale == null}">
										${item.goodsAttribute.price}
									</c:if>
								</c:if>
								<c:if test="${item.goodsAttribute.price == null}">
									<c:if test="${item.goods.onsale != null}">
										<f:formatNumber value="${item.goods.goodsPrice * item.goods.onsale.percent}" pattern="0.00"></f:formatNumber> 
									</c:if>
									<c:if test="${item.goods.onsale == null}">
										${item.goods.goodsPrice}
									</c:if>
								</c:if>
							</div>
						</div>
						<div class="wid wid3">
							<c:if test="${item.goods.onsale != null}">
								是
							</c:if>
							<c:if test="${item.goods.onsale == null}">
								否
							</c:if>
						</div>
						<div class="wid wid3">
							${item.total}
						</div>
						<div class="wid wid3 monys" >
							<c:if test="${item.goodsAttribute.price != null}">
								<c:if test="${item.goods.onsale != null}">
									<f:formatNumber value="${item.goodsAttribute.price*item.goods.onsale.percent*item.total}" pattern="0.00"></f:formatNumber>
								</c:if>
								<c:if test="${item.goods.onsale == null}">
									<f:formatNumber value="${item.goodsAttribute.price * item.total}" pattern="0.00"></f:formatNumber>
								</c:if>
							</c:if>
							<c:if test="${item.goodsAttribute.price == null}">
								<c:if test="${item.goods.onsale != null}">
									<f:formatNumber value="${item.goods.goodsPrice * item.goods.onsale.percent*item.total}" pattern="0.00"></f:formatNumber> 
								</c:if>
								<c:if test="${item.goods.onsale == null}">
									<f:formatNumber value="${item.goods.goodsPrice*item.total}" pattern="0.00"></f:formatNumber>
								</c:if>
							</c:if>
						</div>
					</div>
				</c:forEach>
			</div>
			<!--购物车列表结束-->
			 
			<!-- 收货地址开始 -->
	            <h3 class="shuohuo-h3">收件地址</h3>
	            <c:forEach items="${addressList}" var="item" varStatus="status">
		            <div class="adress-lb">
		            	<input type="radio" value="${item.id}" id="address${status.count}" name="addressId" onchange="javascript:useNewAddress();"/>
		                <span>
		      				<c:if test="${item.linkmanName != null}">${item.linkmanName}&nbsp;&nbsp;&nbsp;</c:if>
		      				<c:if test="${item.country != null}">${item.country},</c:if>
		      				<c:if test="${item.province != null}">${item.province},</c:if>
		      				<c:if test="${item.city != null}">${item.city},</c:if>
		      				<c:if test="${item.area != null}">${item.area}</c:if>
		      				<c:if test="${item.detail != null}">(${item.detail}),</c:if>
		      				<c:if test="${item.linkmanPhone != null}">${item.linkmanPhone}</c:if>
		                </span>
		            </div>
	            </c:forEach>
		        <div class="adress-lb">
		            <h3 class="shuohuo-h3" style="margin-bottom:10px;margin-left:0px">
		            	<input type="radio" name="addressId" value="0" id="newAddress" onchange="javascript:useNewAddress();"/>使用新地址
		            </h3>
		        </div>
	            <div id="newAddressArea" class="adress-lb" style="display: none">
	            	<div>
	            		<span>国家:</span>
						<select name="address.country" id="country"></select>
	            		<span>省:</span>
						<select name="address.province" id="province"></select>
						<span>市:</span>
						<select name="address.city" id="city">
						</select>
						<span>区:</span>
						<select name="address.area" id="area"></select>
	            	</div>
	            	<div>
		            	<span>街道/门牌号:</span><input type="text" name="address.detail" id="detail"/>
	            	</div>
	            	<div>
	            		<span>联系人:</span><input type="text" name="address.linkmanName" id="linkmanName"/>
	            		<span>联系电话:</span><input type="text" name="address.linkmanPhone" id="linkmanPhone"/>
	            		<span>邮编:</span><input type="text" name="address.postcode" id="postcode"/>
	            	</div>
	            </div>
	            <h3 class="shuohuo-h3" style="margin-bottom:10px"><span>运费:￥</span><span id="transformFee"></span></h3>
	            <input type="hidden" name="order.transformFee" value="" id="transformFeeValue"/>
	            <h3 class="shuohuo-h3" style="margin-bottom:10px">填写具体信息</h3>
				<!--填写收货信息开始-->
				<div class="write-pay write-adress yunfei-fs">
					<!--
	                <div class="pay-lb">
	                	<span class="span1">付款方式：</span>
	                    <select class="inp1" name="order.payType">
	                    	<option value="1">银联</option>
	                        <option value="2">支付宝</option>
	                    </select>
	                </div>
	                -->
	                <div class="pay-lb">
	                	<span class="span1">快递保险：</span>
	                     <input type="checkbox" style="vertical-align:sub"/>
	                    <span>要求购买快递保险（保险费按照报关金额的总金额比例征收，保险条款依照快递公司条例为准。）</span>
	                </div>
	                <!--
	                 <div class="pay-lb">
	                	<span class="span1">海关发票：</span>
	                    <input type="checkbox" style="vertical-align:sub"/>
	                    <span>自定义海关发票</span>
	                    <div class="fs-notice">
	                    	 <input type="checkbox" style="vertical-align:sub"/>
	                   		 <span>锁匠工具</span>
	                    </div>
	                    <div class="fs-notice">
	                    	 <input type="checkbox" style="vertical-align:sub"/>
	                   		 <span>锁匠用品</span>
	                    </div>
	                    <div class="fs-notice">
	                    	 <input type="checkbox" style="vertical-align:sub"/>
	                   		 <span>空白电子芯片</span>
	                    </div>
	                </div>
					<div class="pay-lb">
	                	<span class="span1" style="float:left">业务员：</span>
	                    <div class="ywy-lbwk">
	                      <div class="ywy-lb">
	                          <img class="tx" src="images/touxiang.png" width="43"/>
	                          <span class="name">王小姐</span>
	                          <span class="name">Leno</span>
	                      </div>
	                      <div class="ywy-lb ywy-lb-huang">
	                          <img class="tx" src="images/touxiang.png" width="43"/>
	                          <span class="name">王小姐</span>
	                          <span class="name">Leno</span>
	                      </div>
	                    <div style="clear:both"></div>
	                </div>
	                -->
	                <div class="pay-lb">
	                	<span class="span1" style="float:left" >收货备注：</span>
	                    <textarea class="textarea" name="order.memo"></textarea>
	                </div>
				</div>
			
			<!--收货地址结束-->
			
            <!--结算开始-->
            <div class="shop-end2">
                <span>应付总额(含运费)：￥</span><span class="mon1" id="orderAccount"><f:formatNumber value="${allAccount}" pattern="0.00"></f:formatNumber></span>
                <input type="hidden" name="order.payMoney" value="${allAccount}" id="payMoney"/>
                <input type="hidden" name="order.priceAmount" value="${allAccount}" id="baseMoney"/>
                <input class="submit-btn submit-btn2" type="submit" value="提交" style="background:#5dbfec"/>
            </div>
            <!--结算结束-->
		</div>
		<!--当前所在位置结束-->
	  </form>
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
