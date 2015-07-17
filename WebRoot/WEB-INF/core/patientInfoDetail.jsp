<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>

	<body>
		<div id="rightcontent">
			<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：医院管理&gt; 病人信息管理  &gt; 病人详情信息
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
									病人姓名：
								</td>
								<td class="tableitem3">
									${patient.patientName}
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									性别：
								</td>
								<td class="tableitem2">
									${patient.patientSex}
								</td>
							</tr>
							<tr>
							<td class="tableitem1">
									出生日期：
								</td>
								<td class="tableitem3">
									<f:formatDate value="${patient.patientBirth }" pattern="yyyy-MM-dd" />
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem4">
									录入人员：
								</td>
								<td class="tableitem2">
									${patient.recordPeople}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									录入时间：
								</td>
								<td class="tableitem3">
									<f:formatDate value="${patient.recordTime }" pattern="yyyy-MM-dd HH:dd:ss" />
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									最近修改人：
								</td>
								<td class="tableitem2">
									${patient.lastModifyPeople}
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									最近修改时间：
								</td>
								<td class="tableitem3">
									<f:formatDate value="${patient.lastModifyTime}"
										pattern="yyyy-MM-dd HH:mm:ss" />
								</td>
							</tr>
							<tr>
								<s:if test="patient.inTime == null">
									<td class="tableitem4">
										住院情况：
									</td>
									<td class="tableitem2">未住院</td>
								</s:if>
								<s:else>
									<tr>
										<td class="tableitem4">
											住院时间：
										</td>
										<td class="tableitem2">
											<f:formatDate value="${patient.inTime}"
												pattern="yyyy-MM-dd" />
											(<s:if test="patient.outTime == null">未出院</s:if>
											 <s:else>于<f:formatDate value="${ patient.outTime}" pattern="yyyy-MM-dd"/>出院</s:else>
											)
										</td>
									</tr>
									<tr>
										<td class="tableitem4">病床号：</td>
										<td class="tableitem2">${patient.bedNum }</td>
									</tr>									
								</s:else>
							</tr>
							<tr>
								<td class="tableitem4">
									备注：
								</td>
								<td class="tableitem2">
									${patient.mark }	
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
										<input type="button" value="关 闭" class="button4"
											onMouseOver="this.className='button4Over'"
											onMouseOut="this.className='button4Out'"
											onclick="window.close();" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>




