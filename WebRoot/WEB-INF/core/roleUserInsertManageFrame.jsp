<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>

	<body height="100%">
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 用户角色管理 &gt; 新增用户角色
					</div>
				</div>
			</div>
			<div class="quxxcontent">
				<table width="100%" height="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="18%" valign="top" class="tree">
							<ld:check mark="searchAreaInRoleUser">
								<iframe
									src="${basePath}core/roleUserInsert!searchAreaInRoleUser.action?role.id=${role.id}&areaMark=${areaMark}"
									name="areaTree" width="200" height="100%" marginwidth="1"
									marginheight="1" frameborder="0">
								</iframe>
							</ld:check>
						</td>
						<td width="82%" valign="top">
							<ld:check mark="getUserToInsertRoleUser">
								<iframe
									src="${basePath}core/roleUserInsert!getUserToInsertRoleUser.action?role.id=${role.id}&areaMark=${areaMark}"
									name="userList" width="100%" height="600" marginwidth="1"
									marginheight="1" frameborder="0">
								</iframe>
							</ld:check>
							<ld:check mark="chooseUserInRoleUser">
								<iframe
									src="${basePath}core/roleUserInsert!chooseUser.action?role.id=${role.id}"
									name="userChoose" width="100%" height="200" marginwidth="0"
									marginheight="0" frameborder="0">
								</iframe>
							</ld:check>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>


