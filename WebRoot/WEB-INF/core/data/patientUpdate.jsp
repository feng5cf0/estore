<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
	
		<script type="text/javascript">
			function checkInfo(){
			
				if(confirm("确定要修改此条病人记录？")){
					window.updateInfo.submit();
				}
				
			}
		</script>
	</head>
	
	<body>
		<form action="core/patient!updatePatient.action" method="post" name="updateInfo" id="updateInfo">
		<div id="rightcontent">
			<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：医院管理&gt; 病人信息管理  &gt; 编辑病人信息
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
										病人信息
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
									病人编号：
								</td>
								<td class="tableitem3">
									<input type="text" name="patient.patientId" value="<s:property value="patient.patientId"/>" readonly="readonly"/>
								</td>
							</tr>	
							<tr>
								<td width="200" class="tableitem1">
									病人姓名：
								</td>
								<td class="tableitem3">
									<input type="text" value="${patient.patientName}" name="patient.patientName"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									性别：
								</td>
								<td class="tableitem2">
									<s:if test='patient.patientSex == "男"'>
										<input type="radio" name="patient.patientSex" value="男" checked="checked"/>男
										<input type="radio" name="patient.patientSex" value="女"/>女
									</s:if>
									<s:else>
										<input type="radio" name="patient.patientSex" value="男"/>男
										<input type="radio" name="patient.patientSex" value="女" checked="checked"/>女
									</s:else>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									出生日期：
								</td>
								<td class="tableitem2">
									<input id="patient.patientBirth" class="Wdate" name="patient.patientBirth" value="<f:formatDate value="${patient.patientBirth }" pattern="yyyy-MM-dd"/>" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem1">
									录入人员：
								</td>
								<td class="tableitem3">
									${patient.recordPeople }
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									录入时间：
								</td>
								<td class="tableitem2">
									<f:formatDate value="${patient.recordTime }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									最近修改人：
								</td>
								<td class="tableitem3">
									${patient.lastModifyPeople}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									住院时间：
								</td>
								<td class="tableitem2">
									<f:formatDate value="${patient.inTime }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									出院时间：
								</td>
								<td class="tableitem3">
									<f:formatDate value="${patient.outTime }" pattern="yyyy-MM-dd"/>
								</td>
							</tr>							
							<tr>
								<td class="tableitem4">
									备注：
								</td>
								<td class="tableitem2">
									<textarea rows="6" cols="40" name="patient.mark">${patient.mark }</textarea>
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




