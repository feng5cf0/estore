<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>新增病人</title>
		<script type="text/javascript">
function checkSubmit() {
	/**
	 var username = document.getElementById('user.userName');
	 var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{4,8}$/;
	 if (!reg.test(trim(username.value))||username.value == '') {
	 username.focus();
	 alert("用户全称不可为空，且必须由4至8位字母、数字或汉字组成!");
	 return false;
	 }
	 **/
	if (!checkData(true, 'patient.patientName', "病人姓名", 2, 100)) {
		return false;
	}

	if (!checkData(true, 'patient.patientBirth', "病人出生日期", 2, 100)) {
		return false;
	}
	if (!checkData(true, 'patient.recordPeople', "登记人员", 2, 100)) {
		return false;
	}
	if (!checkData(true, 'patient.recordTime', "登记时间", 2, 100)) {
		return false;
	}
	
	if(document.patientInfo.isZhu[0].checked == true)
		if(document.getElementById("patient.bedNum").value == null || document.getElementById("patient.bedNum").value == ""){
			alert("病床号不能为空！");
			return false;
		}

	return confirm("确定要添加此条病人信息？");
}
</script>
	</head>

	<body style="overflow: auto">
		<form action="core/patient!addPatient.action" method="post" name="patientInfo" id="patientInfo">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：医院管理 &gt; 病人信息管理 &gt; 新增病人
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
										</td>
									</tr>
								</table>
							</div>
							<div class="tab4" id="error">
								<%--${error}--%>
							</div>
						</div>
						<div class="buttonbg1"></div>
						<div class="divtable">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<input type="hidden" name="pager.curPageNum" value="${pager.curPageNum}" />
								<tr>
									<td width="200" class="tableitem1">
										病人姓名：
									</td>
									<td class="tableitem3">
										<input name="patient.patientName" type="text" class="dmg-input"
											id="patient.patientName" value="${patient.patientName}" maxlength="8" />
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										性别：
									</td>
									<td class="tableitem2">
										<s:radio list="{'男','女'}" name="patient.patientSex"></s:radio>
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem1">
										出生日期：
									</td>
									<td class="tableitem3">
										<input type="text" class="Wdate" id="patient.patientBirth" readonly="readonly"
											name="patient.patientBirth" value="${patient.patientBirth}" maxlength="8" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});"/>
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										是否住院：
									</td>
									<td class="tableitem2">
										<input type="radio" name="isZhu" value="y" onclick="document.getElementById('bednum').style.display='block';"/>是
										<input type="radio" name="isZhu" value="n" onclick="document.getElementById('bednum').style.display='none'"/>否
										<div id="bednum" style="display:none">床号:<span><input name="patient.bedNum" id="patient.bedNum"/></span></div>
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										登记人员(只读)：
									</td>
									<td class="tableitem3">
										<input type="text" class="dmg-input" id="patient.recordPeople"
											name="patient.recordPeople" value="${user.userAlias}" maxlength="8" readonly="readonly"/>
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										登记时间：
									</td>
									<td class="tableitem2">
										<input type="text" class="Wdate" id="patient.recordTime" readonly="readonly"
											name="patient.recordTime" value="${patient.recordTime}" maxlength="8" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});"/>
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										备注：
									</td>
									<td class="tableitem3">
										<label for="textarea"></label>
										<textarea name="patient.mark" id="patient.mark" cols="45" rows="5">${patient.mark}</textarea>
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
											<ld:check mark="addPatient">
												<input type="submit" value="确 定" class="button4"
													onMouseOver="this.className='button4Over'"
													onMouseOut="this.className='button4Out'"
													onclick="return checkSubmit();" />
											</ld:check>
										</td>
										<td>
											&nbsp;
										</td>
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
		</form>
	</body>
</html>


