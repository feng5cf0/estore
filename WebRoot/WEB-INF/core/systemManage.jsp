<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@include file="/headDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>无标题文档</title>
		<link href="css/css.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">

function changePassword() {
	showInsertDialog("${basePath}core/userUpdatePassword!prepare.action");
}
</script>
	</head>

	<body>
		<div class="dmg-right-body">
			<div class="dmg-right-body1">
				<table width="492" border="0" cellspacing="0" cellpadding="0">

					<tr>
						<td>
							<ld:check mark="checkstandVersionSearch">
								<img src="css/images/menu29.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/menu29.png'"
									onmousemove="this.src='css/images/menu29on.png'"
									onclick="show('软件升级','${basePath}core/checkstandVersionSearch!query.action');" />
							</ld:check>
						</td>
						<td>
							<ld:check mark="userImportPrepare">
								<img src="css/images/menu26.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/menu26.png'"
									onmousemove="this.src='css/images/menu26on.png'"
									onclick="show('用户导入','${basePath}core/userImportPrepare.action');" />
							</ld:check>
						</td>
						<td>
						</td>
					</tr>

					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td align="center">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td>
							<ld:check mark="userManager">
								<img src="css/images/menu37.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/menu37.png'"
									onmousemove="this.src='css/images/menu37on.png'"
									onclick="show('用户管理','${basePath}core/userSearch!searchUser.action');" />
							</ld:check>
						</td>
						<td width="60">
							<ld:check mark="roleManager">
								<img src="css/images/menu38.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/menu38.png'"
									onmousemove="this.src='css/images/menu38on.png'"
									onclick="show('角色管理 ','${basePath}core/roleSearch!searchRole.action');" />
							</ld:check>
						</td>
						<td width="216">
							<ld:check mark="roleUserManager">
								<img src="css/images/menu45.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/menu45.png'"
									onmousemove="this.src='css/images/menu45on.png'"
									onclick="show('用户角色管理','${basePath}core/roleUserManageFrame.action');" />
							</ld:check>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							&nbsp;
						</td>
						<td align="center">
							&nbsp;
						</td>
					</tr>

					<tr>
						<td>
							<ld:check mark="rightManager">
								<img src="css/images/menu39.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/menu39.png'"
									onmousemove="this.src='css/images/menu39on.png'"
									onclick="show('权限管理','${basePath}core/rightManageFrame.action');" />
							</ld:check>
						</td>
						<td width="60">
							<ld:check mark="areaManager">
								<img src="css/images/menu40.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/menu40.png'"
									onmousemove="this.src='css/images/menu40on.png'"
									onclick="show('部门管理','${basePath}core/areaManageFrame.action');" />
							</ld:check>
						</td>
						<td width="216">
							<ld:check mark="systemOptionManage">
								<img src="css/images/sysSet.png" style="cursor: pointer;"
									width="206" height="87"
									onmouseout="this.src='css/images/sysSet.png'"
									onmousemove="this.src='css/images/sysSetOn.png'"
									onclick="show('系统设置','${basePath}core/systemOptionManage!prepare.action');" />
							</ld:check>
						</td>
					</tr>
				</table>
			</div>

		</div>
	</body>
</html>