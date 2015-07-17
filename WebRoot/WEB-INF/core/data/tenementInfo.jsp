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
				document.getElementById("tenement.batchId").value="";
				document.getElementById("tenement.name").value="";
				document.getElementById("tenement.local").value="";
				document.getElementById("tenement.time ").value="";
			}
			function update(id){
				showLargeDialog("${basePath}core/tenementAction!updateTenementPrepare.action?tenement.id="+id);
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
						您当前位置：数据管理 &gt; 物业费信息
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="${basePath}core/tenementAction!loadTenement.action" onsubmit="return checkInfo();" method="post">
							<table class="rightseach2">
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											批次号：
										</label>
									</td>
									<td width="8%" align="left">
										<input name="tenement.batchId" type="text" class="dmg-input"
											id="tenement.batchId" value="${tenement.batchId}" />
									</td>
									<td width="8%" align="right">
										<label for="textfield">
											业主姓名：
										</label>
									</td>
									<td width="8%" align="left">
										<input name="tenement.name" type="text" class="dmg-input"
											id="tenement.name" value="${tenement.name}" />
									</td>
									<td width="8%" align="right">
										<label for="textfield">
											单元号：
										</label>
									</td>
									<td width="8%" align="left">
										<input name="tenement.local" type="text" class="dmg-input"
											id="tenement.local" value="${tenement.local}" />
									</td>								
									<td width="8%" align="right">
										<label for="textfield">
											缴费期：
										</label>
									</td>
									<td width="6%" align="left">
										<input name="tenement.time" type="text" class="Wdate" style="width:100px;height:20px;"
											id="tenement.time" value="<s:date name="tenement.time" format="yyyy-MM-dd"/>" readonly="readonly" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd'});"/>
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
									onMouseOut="this.className='button3Out'" onclick="location.href('tenementAction!exportPrepare.action')" />
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
									业主姓名
								</td>
								<td width="6%">
									单元号
								</td >
								<td width="10%">
									缴费期
								</td>
								<td width="6%">
									物业费
								</td>
								<td width="6%">
									垃圾清运费
								</td>
								<td width="6%">
									其他
								</td>
								<td width="6%">
									缴费状态
								</td>
								<td width="10%">
									操作
								</td>
							</tr>
							<c:forEach items="${tenementList }" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="loadPatientDetail">onclick="javascript:void(0);"</ld:check>>
									<td>
										${item.batchId}
									</td>		
									<td>
										${item.name }
									</td>
									<td>
										${item.local }
									</td>
									<td>
										<f:formatDate value="${item.time }" pattern="yyyy-MM-dd"/>
									</td>
									<td>
										${item.payCount }
									</td>
									<td>
										${item.payRabbish }
									</td>
									<td>
										${item.payOther }
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
																onclick="update(${item.id});" />
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
								action="${basePath}core/tenementAction!loadTenement.action"
								method="post" name="pagerForm" class="dmg-listli-item2">
 								<input type="hidden" name="tenement.batchId" value="${tenement.batchId }"/>
								<input type="hidden" name="tenement.name" value="${tenement.name }"/>
								<input type="hidden" name="tenement.local" value="${tenement.local }"/>
								<input type="hidden" name="tenement.time" value="<f:formatDate value="${tenement.time }" pattern="yyyy-MM-dd"/>"/>
								
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

