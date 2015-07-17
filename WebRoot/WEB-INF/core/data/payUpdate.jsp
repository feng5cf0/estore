<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	
		<script type="text/javascript">
			function checkInfo(){
				var baojiao = document.getElementById("pay.payBaoJiao");
				var food = document.getElementById("pay.payFood");
				var add = document.getElementById("pay.payAdd");
				var reduce = document.getElementById("pay.payReduce");
				var subsidy = document.getElementById("pay.paySubsidy");
				var actual = document.getElementById("pay.payActual");
				
				if(baojiao.value != '' && !isFloat(baojiao.value)){
					alert("保教费格式不正确！");
					baojiao.value="";
					return false;
				}
				if(food.value!='' && !isFloat(food.value)){
					alert("伙食费格式不正确！");
					food.value = "";
					return false;
				}
				if(add.value!='' && !isFloat(add.value)){
					alert("补收费格式不正确！");
					add.value ="";
					return false;
				}
				if(reduce.value != '' && !isFloat(reduce.value)){
					alert("退款金额格式不正确！");
					reduce.value="";
					return false;
				}
				if(subsidy.value != '' && !isFloat(subsidy.value)){
					alert("补助金额格式不正确！");
					subsidy.value="";
					return false;
				}
				if(actual.value != '' && !isFloat(actual.value)){
					alert("实际付款金额格式不正确！");
					actual.value="";
					return false;
				}
				if(confirm("确定要修改此学费记录？")){
					window.updateInfo.submit();
				}
				
			}
		</script>
	</head>
	
	<body>
		<form action="core/ttAction!updatePay2.action" method="post" name="updateInfo" id="updateInfo">
		<div id="rightcontent">
			<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：数据管理&gt; 缴费信息  &gt; 编辑缴费信息
						</div>
					</div>
				</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="righttitle">
						<div class="tab1">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="tabl">
										&nbsp;
									</td>
									<td class="tabm">
										缴费信息
									</td>
									<td class="tabr">
										&nbsp;
									</td>
								</tr>
							</table>
						</div>
					</div>
					<div class="buttonbg1"></div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr>
								<td width="200" class="tableitem1">
									编号：
								</td>
								<td class="tableitem3">
									<input type="text" name="pay.payId" value="<s:property value="pay.payId"/>" readonly="readonly"/>
								</td>
							</tr>	
							<tr>
								<td width="200" class="tableitem1">
									学号：
								</td>
								<td class="tableitem3">
									<input type="text" value="${pay.stuNum}" name="pay.stuNum" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									姓名：
								</td>
								<td class="tableitem2">
									<input type="text" value="${pay.stuName}" name="pay.stuName" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									批次号：
								</td>
								<td class="tableitem2">
									<input id="pay.batchId" name="pay.batchId" value="${pay.batchId }" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem1">
									缴费日期：
								</td>
								<td class="tableitem3">
									<input id="pay.payTime" class="Wdate" name="pay.payTime" value="<f:formatDate value="${pay.payTime }" pattern="yyyy-MM-dd"/>"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									保教费：
								</td>
								<td class="tableitem2">
									<input id="pay.payBaoJiao" name="pay.payBaoJiao" value="${pay.payBaoJiao }"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									伙食费：
								</td>
								<td class="tableitem3">
									<input id="pay.payFood" name="pay.payFood" value="${pay.payFood }"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									补收：
								</td>
								<td class="tableitem2">
									<input id="pay.payAdd" name="pay.payAdd" value="${pay.payAdd }"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									退款：
								</td>
								<td class="tableitem3">
									<input id="pay.payReduce" name="pay.payReduce" value="${pay.payReduce }"/>
								</td>
							</tr>							
							<tr>
								<td class="tableitem4">
									补助：
								</td>
								<td class="tableitem2">
									<input id="pay.paySubsidy" name="pay.paySubsidy" value="${pay.paySubsidy }"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									实际付款：
								</td>
								<td class="tableitem2">
									<input id="pay.payActual" name="pay.payActual" value="${pay.payActual }"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									付款状态：
								</td>
								<td class="tableitem2">
									<input type="radio" name="pay.payState" value="未缴费"/>未缴费
									<input type="radio" name="pay.payState" value="现金结算"/>现金结算
									<input type="radio" name="pay.payState" value="支付宝结算"/>支付宝结算
								</td>
							</tr>
						</table>
					</div>
					<div class="tablebottom">
						<div class="button4body">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="1">
								<tr>
									<td align="center">
										<input type="button" value="修改" class="button4"
											onMouseOver="this.className='button4Over'"
											onMouseOut="this.className='button4Out'"
											onclick="checkInfo();" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		</form>
	</body>
</html>




