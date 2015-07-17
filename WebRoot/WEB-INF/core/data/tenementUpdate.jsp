<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	
		<script type="text/javascript">
			function checkInfo(){
				var name = document.getElementById("tenement.name");
				var local = document.getElementById("tenement.local");
				var time = document.getElementById("tenement.time");
				var count = document.getElementById("tenement.payCount");
				var rabbish = document.getElementById("tenement.payRabbish");
				var other = document.getElementById("tenement.payOther");
				
				if(count.value != '' && !isFloat(count.value)){
					alert("保教费格式不正确！");
					count.value="";
					return false;
				}
				if(rabbish.value!='' && !isFloat(rabbish.value)){
					alert("伙食费格式不正确！");
					rabbish.value = "";
					return false;
				}
				if(other.value!='' && !isFloat(other.value)){
					alert("补收费格式不正确！");
					other.value ="";
					return false;
				}
				
				if(confirm("确定要修改此条物业信息？")){
					window.updateInfo.submit();
				}
				
			}
		</script>
	</head>
	
	<body>
		<form action="core/tenementAction!updateTenement.action" method="post" name="updateInfo" id="updateInfo">
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
										物业费信息
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
									<input type="text" name="tenement.id" value="<s:property value="tenement.id"/>" readonly="readonly"/>
								</td>
							</tr>	
							<tr>
								<td width="200" class="tableitem1">
									业主姓名：
								</td>
								<td class="tableitem3">
									<input type="text" value="${tenement.name}" name="tenement.name" id="tenement.name" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									批次号：
								</td>
								<td class="tableitem2">
									<input type="text" value="${tenement.batchId}" name="tenement.batchId" id="tenement.batchId" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									单元号：
								</td>
								<td class="tableitem2">
									<input id="tenement.local" name="tenement.local" value="${tenement.local }" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem1">
									缴费日期：
								</td>
								<td class="tableitem3">
									<input id="tenement.time" class="Wdate" name="tenement.time" value="<f:formatDate value="${tenement.time }" pattern="yyyy-MM-dd"/>"
											onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'});" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									物业费：
								</td>
								<td class="tableitem2">
									<input id="tenement.payCount" name="tenement.payCount" value="${tenement.payCount }"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									垃圾清运费：
								</td>
								<td class="tableitem3">
									<input id="tenement.payRabbish" name="tenement.payRabbish" value="${tenement.payRabbish }"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									其他：
								</td>
								<td class="tableitem2">
									<input id="tenement.payOther" name="tenement.payOther" value="${tenement.payOther }"/>
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




