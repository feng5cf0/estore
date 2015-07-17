<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script language="javascript">

function checkSubmit() {
	if (!checkData(true, 'area.areaName', "部门名称", 2, 10)) {
		return false;
	}
	if (!checkData(false, 'area.memo', "备注", 1, 255)) {
		return false;
	}

	return true;
}
</script>
	</head>
	<body>
		<form action="${basePath}core/areaInsert!insertArea.action"
			method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：系统管理 &gt; 部门管理 &gt; 新增部门
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
											部门管理
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
					<input type="hidden" name="pager.curPageNum"
						value="${pager.curPageNum}" />
					<input type="hidden" value="${area.superAreaId}"
						name="area.superAreaId" />
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr>
								<td class="tableitem1">
									部门名称：
								</td>
								<td class="tableitem3">
									<input type="text" name="area.areaName" id="area.areaName"
										value="${area.areaName}" maxlength="10" />
									<FONT color=red>*</FONT>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									有效：
								</td>
								<td class="tableitem2">
									<ld:select groupName="available" name="area.available"
										value="${area.available}" />
								</td>
							</tr>
							<tr>
								<td width="200" class="tableitem1">
									备注：
								</td>
								<td class="tableitem3">
									<textarea name="area.memo" id="area.memo" cols="45" rows="5"
										maxlength="255">${area.memo}</textarea>
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
										<ld:check mark="userInsertCommit">
											<input type="submit" value="确 定" class="button4"
												onMouseOver="this.className='button4Over'"
												onMouseOut="this.className='button4Out'"
												onclick="return checkSubmit();" />
										</ld:check>
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

