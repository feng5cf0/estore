<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<c:if test="${operateSuccess}">
			<script type="text/javascript">
				window.parent.rightTree.location.reload();
			</script>
		</c:if>
		<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript">

			function editItem(patientId) {
				showLargeDialog("${basePath}core/patient!updatePrepare.action?patient.patientId="
					+ patientId);
				document.pagerForm.submit();
				//window.updateJsp.submit();
			}			
			function checkInfo(){
				var batchId = document.getElementById("batch.batchId").value;
				if(batchId != "" && !isNumber(batchId)){
					alert("批次号为数字");
					var batchId = document.getElementById("batch.batchId").value="";
					return false;					
				}
				return true;
			}
			function reset2(){
				document.getElementById("patientSex").value="";
				document.getElementById("patientName").value="";
				document.getElementById("inTimeBegin").value="";
				document.getElementById("inTimeEnd").value="";
				document.getElementById("outTimeBegin").value="";
				document.getElementById("outTimeEnd").value="";
			}
			function update(payId){
				showLargeDialog("${basePath}core/ttAction!updatePay.action?pay.payId="+payId);
				document.pagerForm.submit();
			}
			function exportPay(batchId){
				if(batchId != null)
					location.href="${basePath}core/ttAction!exportPay.action?batch.batchId="+batchId;
				else
					location.href="${basePath}core/ttAction!exportPay.action";
			}
			
		
		</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：数据管理 &gt; 学费信息
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="${basePath}core/ttAction!loadPayInfo.action" onsubmit="return checkInfo();" method="post">
							<table class="rightseach2">
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											批次号：
										</label>
									</td>
									<td width="8%" align="left">
										<input name="batch.batchId" type="text" class="dmg-input"
											id="batch.batchId" value="${batch.batchId}" />
									</td>
									<td width="16%" align="right">
										<label for="textfield">
											班级：
										</label>
									</td>
									<td width="8%" align="left">
										<input name="pay.stuClass" type="text" class="dmg-input"
											id="pay.stuClass" value="${pay.stuClass}" />
									</td>
									<td width="16%" align="right">
										<label for="textfield">
											姓名：
										</label>
									</td>
									<td width="8%" align="left">
										<input name="pay.stuName" type="text" class="dmg-input"
											id="pay.stuName" value="${pay.stuName}" />
									</td>								
									<td width="10%" align="center">
										<label for="textfield">
											缴费期：
										</label>
									</td>
									<td width="6%" align="left">
										<input name="inYear" type="text" class="Wdate" style="width:100px;height:20px;"
											id="inYear" value="<s:date name="pay.payTime" format="yyyy-MM-dd"/>" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
									</td>
									<td width="16%">
										<input type="button" value="重置" class="button2" onclick="reset2();"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'"/>
										<input type="submit" value="查询" class="button2"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'"/>
									</td>
									<td width="16%"></td>
									<td width="16%"></td>
									<td width="24%"></td>
								</tr>
							</table>
						</form>
					</div>
					<div class="righttitle">
						<div class="tab1">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td class="tabl">
										&nbsp;
									</td>
									<td class="tabm">
										学费信息
									</td>
									<td class="tabr">
									</td>
								</tr>
							</table>
						</div>
						<div class="tab4">
							<%--${error}--%>
						</div>
					</div>
					<div class="buttonbg">
						<div class="divbutton2">
							<ld:check mark="addPatient">
								<input type="button" value="数据导出" class="button3"
									onMouseOver="this.className='button3Over'"
									onMouseOut="this.className='button3Out'" onclick="location.href('ttAction!exportPrepare.action')" />
							</ld:check>
						</div>
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr class="listtitle">
								<td width="3%"">
									批次号
								</td>
								<td width="6%">
									学号
								</td>
								<td width="6%">
									班级
								</td >
								<td width="6%">
									姓名
								</td>
								<td width="10%">
									缴费期
								</td>
								<td width="6%">
									保教费
								</td>
								<td width="6%">
									伙食费
								</td>
								<td width="6%">
									补收
								</td>
								<td width="6%">
									退伙食费
								</td>
								<td width="6%">
									困难补贴
								</td>
								<td width="6%">
									实缴金额
								</td>
								<td width="6%">
									缴费状态
								</td>
								<td width="10%">
									操作
								</td>
							</tr>
							<c:forEach items="${payList }" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="loadPatientDetail">onclick="javascript:void(0);"</ld:check>>
									<td>
										${item.batchId}
									</td>		
									<td>
										${item.stuNum }
									</td>
									<td>
										${item.stuClass }
									</td>
									<td>
										${item.stuName }
									</td>
									<td>
										<f:formatDate value="${item.payTime }" pattern="yyyy-MM-dd"/>
									</td>
									<td>
										${item.payBaoJiao }
									</td>
									<td>
										${item.payFood }
									</td>
									<td>
										${item.payAdd }
									</td>
									<td>
										${item.payReduce }
									</td>
									<td>
										${item.paySubsidy }
									</td>
									<td>
										${item.payActual }
									</td>
									<td>
										${item.payState }
									</td>
									<td>
										<div class="button3body">
										  <c:if test='${item.payState == "未缴费" }'>
											<table border="0" align="center" cellpadding="0"
												cellspacing="2">
												<tr>
												  <ld:check mark="updatePatient">
													<td>
															<input type="button" value="修改" class="button3"
																onMouseOver="this.className='button3Over'"
																onMouseOut="this.className='button3Out'"
																onclick="update(${item.payId});" />
													</td>
												  </ld:check>
													<td width="17" class="line">
														&nbsp;
													</td>
												</tr>
											</table>
										  </c:if>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="${basePath}core/ttAction!loadPayInfo.action"
								method="post" name="pagerForm" class="dmg-listli-item2">
 								<input type="hidden" />
								<ld:pager type="form" action="pagerForm" />   <!-- 分页 -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 刷新页面使用 -->
		<form action="core/ttAction!loadTTInfo.action" id="updateJsp">
		
		</form>
	</body>
</html>

