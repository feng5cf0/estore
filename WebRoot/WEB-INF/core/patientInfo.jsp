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
			function inHome(patientId){
				showLargeDialog("${basePath}/core/patient!inHome.action?patient.patientId="+patientId);
				window.pagerForm.submit();
			}
			function outHome(patientId){
				showLargeDialog("${basePath}/core/patient!outHome.action?patient.patientId="+patientId);
				window.pagerForm.submit();
			}
			function delPatient(patientId){
				var res = confirm("确定要删除记录？");
				if(res == true){
					location.href="${basePath}core/patient!deletePatient.action?patient.patientId="+patientId;
				}
			}
			function editItem(patientId) {
				showLargeDialog("${basePath}core/patient!updatePrepare.action?patient.patientId="
					+ patientId);
				document.pagerForm.submit();
				//window.updateJsp.submit();
			}			
			function checkInfo(){
				var inTimeBegin = document.getElementById("inTimeBegin").value;
				var inTimeEnd = document.getElementById("inTimeEnd").value;
				var outTimeBegin = document.getElementById("outTimeBegin").value;
				var outTimeEnd = document.getElementById("outTimeEnd").value;
				
				if(inTimeEnd != "" && inTimeBegin >inTimeEnd){
					alert("住院开始时间晚于结束时间！");
					document.getElementById("inTimeBegin").value = "";
					document.getElementById("inTimeEnd").value = "";
					return false;
				}
				if(outTimeEnd != "" && outTimeBegin > outTimeEnd){
					alert("出院开始时间晚于结束时间！");
					document.getElementById("outTimeBegin").value = "";
					document.getElementById("outTimeEnd").value = "";
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
			
		</script>
		<script type="text/javascript">

			function addItem() {
				showLargeDialog("${basePath}core/patient!addPatientPrepare.action");
				window.updateJsp.submit();
			}
			function deleteItems(){
					if(isCheckboxSelected('deleteForm'))
						document.deleteForm.submit();

			}
		
			function showItem(id){
				showDialog("${basePath}core/patient!loadPatientDetail.action?patient.patientId="+id+"&pager.curPageNum=${pager.curPageNum}");

			}
		</script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：医院管理 &gt; 病人信息管理
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="${basePath}core/patient!loadPatient.action" onsubmit="return checkInfo();" method="post">
							<table class="rightseach2">
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											病人姓名：
										</label>
									</td>
									<td width="16%" align="left">
										<input name="patient.patientName" type="text" class="dmg-input"
											id="patientName" value="${patient.patientName}" />
									</td>
									<td width="7%" align="right">
										<label for="textfield">
											性别：
										</label>
									</td>
									<td width="12%" align="left">
										<select name="patient.patientSex" id="patientSex">
											<s:if test='patient.patientSex == "男" '>
												<option value="">===请选择===</option>
												<option value="男" selected="selected">男</option>
												<option value="女">女</option>											
											</s:if>
											<s:if test='patient.patientSex == "女"'>
												<option value="">===请选择===</option>
												<option value="男">男</option>
												<option value="女" selected="selected">女</option>
											</s:if>
											<s:if test='patient == null || patient.patientSex == "" || patient.patientSex == null'>
												<option value="" selected="selected">===请选择===</option>
												<option value="男">男</option>
												<option value="女">女</option>
											</s:if>
										</select>
									</td>
									<td width="24%"></td>
								</tr>
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											住院日期：
										</label>
									</td>
									<td width="16%" align="right">从
										<input name="inTimeBegin" type="text" class="Wdate"
											id="inTimeBegin" value="<s:date name="inTimeBegin" format="yyyy-MM-dd"/>" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});"/>
									</td>
									<td width="16%" align="left">
										到
										<input name="inTimeEnd" type="text" class="Wdate"
											id="inTimeEnd" value="<s:date name="inTimeEnd" format="yyyy-MM-dd"/>" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});"/>
									</td>
								</tr>
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											出院日期：
										</label>
									</td>
									<td width="16%" align="right">从
										<input name="outTimeBegin" type="text" class="Wdate"
											id="outTimeBegin" value="<s:date name="outTimeBegin" format="yyyy-MM-dd"/>" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});"/>
									</td>
									<td width="16%" align="left">
										到
										<input name="outTimeEnd" type="text" class="Wdate"
											id="outTimeEnd" value="<s:date name="outTimeEnd" format="yyyy-MM-dd"/>" readonly="readonly" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});"/>
									</td>
									<td width="24%">
										<input type="button" value="重置" class="button2" onclick="reset2();"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'"/>
										<input type="submit" value="查询" class="button2"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'" onclick="inValue();"/>
										<input type="hidden" value="0" name="pager.curPageNum" />
									</td>
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
										病人管理
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
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="addItem();" />
							</ld:check>
						</div>
						<div class="divbutton2">
							<ld:check mark="deletePatient">
								<input type="button" value="删除" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="deleteItems();" />
							</ld:check>
						</div>
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<form action="${basePath}core/userSearch!searchUser.action"
								method="post" name="statusForm" id="statusForm">
								<input name="user.userName" type="hidden"
									value="${user.userName}" />
								<input name="user.userAlias" type="hidden"
									value="${user.userAlias}" />
								<input name="user.userNum" type="hidden" value="${user.userNum}" />
								<input name="user.available" type="hidden"
									value="${user.available}" />
							</form>
							<tr class="listtitle">
								<td>
									选择
								</td>
								<td>
									序号
								</td>
								<td>
									病人姓名
								</td>
								<td>
									住院日期
								</td>
								<td>
									出院日期
								</td>
								<ld:check mark="inHome">
								<td>
									住院
								</td>
								<td>
									出院
								</td>
								</ld:check>
								<td>
									登记人
								</td>
								<td>
									操作
								</td>
							</tr>
							<form action="core/patient!deletePatients.action" method="post" name="deleteForm">
							<c:forEach items="${patientList }" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="loadPatientDetail">onclick="showItem(${item.patientId});"</ld:check>>
									<td>
										<c:if test="${item.inTime !=null && item.outTime != null }">
											<input type="checkbox" name="patientIds" value="${item.patientId }"/>
										</c:if>									
										<c:if test="${item.inTime == null }">
											<input type="checkbox" name="patientIds" value="${item.patientId }"/>
										</c:if>
										<c:if test="${item.inTime != null && item.outTime == null }">
											<input type="checkbox" name="patientIds" value="${item.patientId }" disabled="disabled"/>
											<div>(未出院)</div>
										</c:if>
									</td>
									<td>
										${status.count}
									</td>
									<td>
										<c:out value="${item.patientName}" />
									</td>
									<td>
										<c:if test="${item.inTime == null }">
											-
										</c:if>
										<c:if test="${item.inTime !=null }">
											<f:formatDate value="${item.inTime }" pattern="yyyy-MM-dd"/>
										</c:if>
									</td>
									<td>
										<c:if test="${item.outTime == null }">-</c:if>
										<c:if test="${item.outTime != null }">
											<f:formatDate value="${item.outTime }" pattern="yyyy-MM-dd"/>
										</c:if>
									</td>
                                    <ld:check mark="inHome">
									  <td>
									  
										<c:if test="${item.inTime == null }">
											<input type="button" value="住院" class="button3"
													onMouseOver="this.className='button3Over'"
													onMouseOut="this.className='button3Out'"
													onclick="javascript:inHome(${item.patientId});" />
										</c:if>
										<c:if test="${item.inTime != null }">-</c:if>
								
								   </td>
								   <td>
									  
										<c:if test="${item.inTime != null && item.outTime == null}">
											<input type="button" value="出院" class="button3"
												onMouseOver="this.className='button3Over'"
												onMouseOut="this.className='button3Out'"
												onclick="javascript:outHome(${item.patientId});" />
										</c:if>
										<c:if test="${item.outTime != null }">-</c:if>
										<c:if test="${item.inTime == null && item.outTime == null }">-</c:if>
									  
									</td>
									</ld:check>
									<td>
										<c:out value="${item.recordPeople}" />
									</td>
									<td>
										<div class="button3body">
											<table border="0" align="center" cellpadding="0"
												cellspacing="2">
												<tr>
												  <ld:check mark="updatePatient">
													<td>
															<input type="button" value="编辑" class="button3"
																onMouseOver="this.className='button3Over'"
																onMouseOut="this.className='button3Out'"
																onclick="editItem(${item.patientId});" />
													</td>
												  </ld:check>
													<td width="17" class="line">
														&nbsp;
													</td>
												</tr>
											</table>
										</div>
									</td>
								</tr>
							</c:forEach>
						   </form>
						</table>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="${basePath}core/patient!loadPatient.action"
								method="post" name="pagerForm" class="dmg-listli-item2">
								<input type="hidden" name="patient.patientName" value="${patient.patientName }"/>
								<input type="hidden" name="inTimeBegin" value="<f:formatDate value="${inTimeBegin }" pattern="yyyy-MM-dd"/>"/>
								<input type="hidden" name="inTimeEnd" value="<f:formatDate value="${inTimeEnd }" pattern="yyyy-MM-dd"/>"/>
								<input type="hidden" name="outTimeBegin" value="<f:formatDate value="${outTimeBegin }" pattern="yyyy-MM-dd"/>"/>
								<input type="hidden" name="outTimeEnd" value="<f:formatDate value="${outTimeEnd }" pattern="yyyy-MM-dd"/>"/>
								<input type="hidden" name="patient.patientSex" value="${patient.patientSex }"/>
								<ld:pager type="form" action="pagerForm" />   <!-- 分页 -->
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 刷新页面使用 -->
		<form action="core/patient!loadPatient.action" id="updateJsp">
		
		</form>
	</body>
</html>

