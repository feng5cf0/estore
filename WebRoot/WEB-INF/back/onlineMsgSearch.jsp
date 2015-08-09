<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 在线留言管理
					</div>
				</div>
			</div>
			<div class="roadbody1">
				<div class="roadbody">
					<div class="roadbody">
						<form action="${basePath}core/userSearch!searchUser.action">
							<table class="rightseach2">
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											登录名称：
										</label>
									</td>
									<td width="16%" align="left">
										<input name="user.userAlias" type="text" class="dmg-input"
											id="user.userAlias" value="${user.userAlias}" />
									</td>
									<td width="7%" align="right">
										<label for="textfield">
											用户编码：
										</label>
									</td>
									<td width="12%" align="left">
										<input name="user.userNum" type="text" class="dmg-input"
											id="user.userNum" value="${user.userNum}" />
									</td>
									<td width="24%"></td>
								</tr>
								<tr>
									<td width="16%" align="right">
										<label for="textfield">
											用户全称：
										</label>
									</td>
									<td width="16%" align="left">
										<input name="user.userName" type="text" class="dmg-input"
											id="user.userName" value="${user.userName}" />
									</td>
									<td width="16%" align="right">
										<label for="textfield">
											用户状态：
										</label>
									</td>
									<td width="16%" align="left">
										<ld:select id="user.available" name="user.available"
											groupName="availableAll" value="${user.available}"
											className="dmg-select" />
									</td>
									<td width="24%">
										<input type="submit" value="查询" class="button2"
											onmouseover="this.className='button2Over'"
											onmouseout="this.className='button2Out'" />
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
										在线留言管理
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
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
						<%-- 	<form action="${basePath}core/userSearch!searchUser.action"
								method="post" name="statusForm" id="statusForm">
								<input name="user.userName" type="hidden"
									value="${user.userName}" />
								<input name="user.userAlias" type="hidden"
									value="${user.userAlias}" />
								<input name="user.userNum" type="hidden" value="${user.userNum}" />
								<input name="user.available" type="hidden"
									value="${user.available}" />
							</form> --%>
							<tr class="listtitle">
								<td>
									序号
								</td>
								<td>
									留言人
								</td>
								<td>
									留言时间
								</td>
								<td>
									公司
								</td>
								<td>
									联系人
								</td>
								<td>
									联系电话
								</td>
								<td>
									邮箱
								</td>
								<td>
									公司地址
								</td>
								<td>
									邮政编码
								</td>
								<td>
									传真
								</td>
								<td>
									内容
								</td>
							</tr>

							<c:forEach items="${onlineMsgList }" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="userDetail">onclick="showItem(${item.id});"</ld:check>>
									<td>
										${status.count}
									</td>
									<td>
										<c:out value="${item.createName}" />
									</td>
									<td>
										<fmt:formatDate value="${item.createTime }"  pattern="yyyy/MM/dd  HH:mm:ss" />
									</td>
									<td>
										<c:out value="${item.company}" />
									</td>
									<td>
										<c:out value="${item.linkMan}" />
									</td>
									<td>
										<c:out value="${item.linkPhone}" />
									</td>
									<td>
									 	<c:out value="${item.email}" /> 
									</td>
									<td>
										<c:out value="${item.companyAddress}" />
									</td>
									<td>
										<c:out value="${item.zipCode}" />
									</td>
									<td>
										<c:out value="${item.fax}" />
									</td>
									<td>
										<c:out value="${item.memo}" />
									</td>
									<td>
										<a style="color:red" href="front/memberAction!memberDelete.action?memberId=${item.id }">删除</a>
									</td>
									
									
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="tablebottom">
						<div class="tablebottomright">
							<form
								action="${basePath}core/userSearch!searchUser.action"
								method="post" name="pagerForm" class="dmg-listli-item2">
								<input name="user.userName" type="hidden"
									value="${user.userName}" />
								<input name="user.userAlias" type="hidden"
									value="${user.userAlias}" />
								<input name="user.userNum" type="hidden" value="${user.userNum}" />
								<input name="user.available" type="hidden"
									value="${user.available}" />
								<ld:pager type="form" action="pagerForm" />
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

