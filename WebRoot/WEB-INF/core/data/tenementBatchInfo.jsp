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
			function reset2(){
				document.getElementById("batch.batchId").value="";
				document.getElementById("year").value="2014";
				document.getElementById("beginDate").value="";
				document.getElementById("endDate").value="";
			}
			function showInfo(batchId){
				location.href("${basePath}core/tenementAction!loadTenement.action?tenement.batchId="+batchId);
			}
			function downloadFile(batchId){
				alert(batchId);
				location.href("${basePath}core/tenementAction!exportTenement.action?tenement.batchId="+batchId);
			
				
			}
			function checkValue(){
			
				var beginDate = document.getElementById("beginDate").value;
				var endDate = document.getElementById("endDate").value;
				
				var batchId = document.getElementById("batch.batchId").value;

				if(batchId != "" && !isNumber(batchId)){
					alert("批次号为数字");
					document.getElementById("batch.batchId").value="";
					return false;
				}
				if(beginDate>endDate){
					alert("开始时间晚于结束时间！");
					document.getElementById("beginDate").value = "";
					document.getElementById("endDate").value = "";
					return false;
				}
				
				return true;
			}
			function importBatch(){
				//showLargeDialog("${basePath}core/tenementAction!importBatchPrepare.action");
				location.href="${basePath}core/tenementAction!importBatchPrepare.action";
				//document.pagerForm.submit();
			}
		</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：数据管理 &gt; 学费导入信息列表
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="${basePath}core/tenementAction!loadBatch.action" onsubmit="return checkValue();" method="post">
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
									<td width="10%" align="center">
										<label for="textfield">
											导入时间：
										</label>
									</td>
									<td width="6%" align="left">
										<input name="year" type="text" class="Wdate" style="width:50px;height:20px;"
											id="year" value="2014" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy'});"/>年
									</td>
									<td width="6%" align="left">
										<input name="beginDate" type="text" class="Wdate" style="width:50px;height:20px;"
											id="beginDate" value="${beginDate }" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'MM-dd'});"/>
									</td>
									<td width="6%" align="left">至
										<input name="endDate" type="text" class="Wdate" style="width:50px;height:20px;"
											id="endDate" value="${endDate }" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'MM-dd'});"/>
									</td>
									<td width="16%">
										<input type="button" value="重置" class="button2" onclick="reset2();"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'"/>
										<input type="submit" value="查询" class="button2"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'" />
										<input type="hidden" value="0" name="pager.curPageNum" />
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
										学费导入
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
								<input type="button" value="数据导入" class="button3"
									onMouseOver="this.className='button3Over'"
									onMouseOut="this.className='button3Out'" onclick="importBatch();" />
							</ld:check>
						</div>
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr class="listtitle">
								<td width="20%"">
									批次号
								</td>
								<td width="30%">
									导入时间
								</td>
								<td width="20%">
									操作人
								</td>
								<td>
									操作
								</td>
							</tr>
							<c:forEach items="${batchList }" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="loadPatientDetail">onclick="javascript:void(0);"</ld:check>>
									<td>
										${item.batchId }
									</td>		
									<td>
										<f:formatDate value="${item.inTime }" pattern="yyyy-MM-dd HH:mm:ss"/>
									</td>
									<td>
										${item.operator }
									</td>
									<td>
										<div class="button3body">
											<table border="0" align="center" cellpadding="0"
												cellspacing="2">
												<tr>
												  <ld:check mark="updatePatient">
													<td>
															<input type="button" value="查看缴费情况" class="button3"
																onMouseOver="this.className='button3Over'"
																onMouseOut="this.className='button3Out'"
																onclick="showInfo(${item.batchId});" />
													</td>
												  </ld:check>
												    <td>
												    		<input type="button" value="下载对账文件" class="button3"
																onMouseOver="this.className='button3Over'"
																onMouseOut="this.className='button3Out'"
																onclick="downloadFile(${item.batchId});" />
												    	
												    </td>
													<td width="17" class="line">
														&nbsp;
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="${basePath}core/tenementAction!loadBatch.action"
								method="post" name="pagerForm" class="dmg-listli-item2">
								<input type="hidden" name="batch.batchId" value="${batch.batchId }"/>
								<input type="hidden" name="year" value="${year }"/>
								<input type="hidden" name="beginDate" value="${beginDate }"/>
								<input type="hidden" name="endDate" value="${endDate }"/>
								<ld:pager type="form" action="pagerForm"/>   <!-- 分页 -->
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

