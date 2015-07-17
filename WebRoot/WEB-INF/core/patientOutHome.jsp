<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>新增病人</title>
		<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
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
	if (!checkData(true, "patient.outTime", "住院日期", 2, 100)) {
		return false;
	}
	//var bedNum = document.getElementById("patient.bedNum");
	//var inTime = document.getElementById("patient.inTime");
 	//if(bedNum.value == "" || bedNum.value == null){
	//	alert("床号不能为空！");
	//	return false;
	//}
	//if(inTime.value == "" || inTime.value == null){
	//	alert("入住时间不能为空！");
	//	return false;
	//}
	return true;
}
</script>
	</head>

	<body style="overflow: auto">
		<form action="core/patient!outHome.action" method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：医院管理 &gt; 病人信息管理 &gt; 病人出院
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
										<input name="patient.patientId" type="hidden" value="${patient.patientId }"/>
										<input name="patient.patientName" type="text" class="dmg-input" readonly="readonly"
											id="patient.patientName" value="${patient.patientName}" maxlength="8" />
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td class="tableitem4">
										床号：
									</td>
									<td class="tableitem2">
										<input name="patient.bedNum" value="${patient.bedNum }" id="patient.bedNum" readonly="readonly"/>
										<font color=red>*</font>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem1">
										出院日期：
									</td>
									<td class="tableitem3">
										<input type="text" class="Wdate" id="patient.outTime" readonly="readonly"
											name="patient.outTime" value="${patient.outTime}" maxlength="8" onfocus="WdatePicker({maxDate:'%y-%M-%d',dateFmt:'yyyy-MM-dd'});"/>
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
											<ld:check mark="outHome">
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


