<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
function checkSubmit() {
	var versionNum = document.getElementById("checkstandVersion.versionNum");
	var versionName = document.getElementById("checkstandVersion.versionName");
	if (!checkData(true, 'checkstandVersion.versionNum', "版本编码", 1, 5)) {
		return false;
	}
	if (versionName.value == "") {
		alert("请输入版本名称！！！");
		versionName.focus();
		return false;
	}

	if (Length(versionName.value) > 30) {
		alert("版本名称长度过长，请重新输入！！！");
		return false;
	}

	var upload = document.getElementById('upload');
	if (upload.value == "") {
		alert("请上传文件!");
		return false;
	}
	return true;
}
</script>
	</head>
	<body>
		<form action="${basePath}core/checkstandVersionInsert!insert.action"
			method="post" name="form1" enctype="multipart/form-data">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 软件升级 &gt; 新增软件版本
						</div>
					</div>
				</div>
				<div class="roadbody1">
					<div class="roadbody">
						<div class="righttitle">
							<div class="tab2">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td class="tabl">
											&nbsp;
										</td>
										<td class="tabm">
											新增软件版本信息
										</td>
										<td class="tabr">
											&nbsp;
										</td>
									</tr>
								</table>
							</div>
							<div class="tab4" id="error">
								<%--${error}--%>
							</div>
						</div>

					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr>
								<td class="tableitem1">
									项目名称
								</td>
								<td class="tableitem3">

									<ld:select id="checkstandVersion.project.id"
										name="checkstandVersion.project.id" groupName="projectList"
										className="dmg-select" value="${checkstandVersion.project.id}" />
									<FONT color=red>*</FONT>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									平台
								</td>
								<td class="tableitem2">
									<ld:select id="checkstandVersion.platform.id"
										name="checkstandVersion.platform.id" groupName="platformList"
										className="dmg-select"
										value="${checkstandVersion.platform.id}" />
									<FONT color=red>*</FONT>
								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									终端类型
								</td>
								<td class="tableitem3">

									<ld:select id="checkstandVersion.posType.id"
										name="checkstandVersion.posType.id" groupName="posType"
										className="dmg-select" value="${checkstandVersion.posType.id}" />
									<FONT color=red>*</FONT>

								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									是否强制升级
								</td>
								<td class="tableitem2">

									<ld:select name="checkstandVersion.isForceUpdate"
										groupName="yesOrNoInt" className="dmg-select"
										value="${checkstandVersion.isForceUpdate}"
										exceptValue="${options.common.ALL}" />
									<FONT color=red>*</FONT>

								</td>
							</tr>
							<tr>
								<td class="tableitem1">
									版本编码
								</td>
								<td class="tableitem3">
									<input type="text" id="checkstandVersion.versionNum"
										value="${checkstandVersion.versionNum}"
										name="checkstandVersion.versionNum" maxlength="5"
										class="dmg-input" onkeydown='return onlyNum()' />
									<FONT color=red>*</FONT>

								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									版本名称
								</td>
								<td class="tableitem2">
									<input type="text" id="checkstandVersion.versionName"
										value="${checkstandVersion.versionName}"
										name="checkstandVersion.versionName" maxlength="30"
										class="dmg-input" />
									<FONT color=red>*</FONT>
								</td>

							</tr>
							<tr>
								<td class="tableitem1">
									文件路径
								</td>
								<td class="tableitem3">
									<input type="file" id="upload" name="upload"
										class="img-input-disable" />
									<FONT color=red>*</FONT>
								</td>
							</tr>
						</table>
					</div>
					<div class="tablebottom">
						<div class="button5body">
							<table width="100%" border="0" align="center" cellpadding="0"
								cellspacing="1">
								<tr>
									<td align="center">
										<input type="submit" value="确 定" class="button4"
											onMouseOver="this.className='button4Over'"
											onMouseOut="this.className='button4Out'"
											onclick="return checkSubmit();" />
									</td>
									<td width="120" align="center">
										<input type="button" value="关 闭" class="button4"
											onmouseover="this.className='button4Over'"
											onmouseout="this.className='button4Out'"
											onclick="window.close();" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>

