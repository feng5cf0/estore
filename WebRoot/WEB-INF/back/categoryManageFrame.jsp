<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>

	<body height="100%">
		<div id="categorycontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						&nbsp;您当前位置：商品管理&gt; 类别管理
					</div>
				</div>
			</div>
			<div class="quxxcontent">
				<table width="100%" height="100%" border="0" cellspacing="0"
					cellpadding="0">
					<tr>
						<td width="18%" valign="top" class="tree">
							<ld:check mark="categoryManager">
								<iframe
									src="${basePath}back/categoryAction!loadCategoryForTree.action"
									name="categoryTree" width="200" height="100%" marginwidth="1"
									marginheight="1" frameborder="0">
								</iframe>
							</ld:check>
						</td>
						<td width="82%" valign="top">
							<ld:check mark="categoryManager">
								<iframe
									src="${basePath}back/categoryAction!loadCategoryByParentId.action?category.parentCategory=1"
									name="categoryList" width="100%" height="600" marginwidth="1"
									marginheight="1" frameborder="0">
								</iframe>
							</ld:check>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</body>
</html>


