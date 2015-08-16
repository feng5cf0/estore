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
						您当前位置：系统管理 &gt; 会员信息管理
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
										<input name="member.memberAlias" type="text" class="dmg-input"
											id="memberAlias" />
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
										<input name="member.memberRealname" type="text" class="dmg-input"
											id="memberRealname" />
									</td>
									<td width="16%" align="right">
										<label for="textfield">
											用户状态：
										</label>
									</td>
									<td width="16%" align="left">
										<select name="member.avaliable">
											<option value="2">全部</option>
											<option value="1">有效</option>
											<option value="0">无效</option>
										</select>
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
										会员信息管理
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
									用户名
								</td>
								<td>
									真实名字
								</td>
								<td>
									会员类型
								</td>
								<td>
									密码
								</td>
								<td>
									积分
								</td>
								<td>
									状态
								</td>
								<td>
									是否邮箱注册
								</td>
								<td>
									上次登录时间
								</td>
								<td>
									上次登录ip
								</td>
								<td>
									注册时间
								</td>
								<td>
									上次修改时间
								</td>
								<td>
									登录时间								
								</td>
								<td>
									登录ip
								</td>
								<td>
									备注
								</td>
								<td>
									 操作
								</td>
							</tr>

							<c:forEach items="${memberList }" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="userDetail">onclick="showItem(${item.id});"</ld:check>>
									<td>
										${status.count}
									</td>
									<td>
										<c:out value="${item.memberAlias}" />
									</td>
									<td>
										<c:out value="${item.memberRealname}" />
									</td>
									<td>
										<c:out value="${item.memberType}" />
									</td>
									<td>
										<c:out value="${item.memberPassword}" />
									</td>
									<td>
										<c:out value="${item.integral}" />
									</td>
									<td>
										<c:if test="${item.avaliable eq 1}">
											<c:out value="有效"></c:out>
										</c:if>
										<c:if test="${item.avaliable eq 0}">
											<c:out value="无效"></c:out>
										</c:if>
									</td>
									<td>
										<c:if test="${item.isEmailAvaliable eq 1}">
											<c:out value="是"></c:out>
										</c:if>
										<c:if test="${item.isEmailAvaliable eq 0}">
											<c:out value="否"></c:out>
										</c:if>
									</td>
									<td>
										<fmt:formatDate value="${item.lastLoginTime }"  pattern="yyyy/MM/dd  HH:mm:ss" />
									</td>
									<td>
									 	<c:out value="${item.lastLoginIp}" /> 
									</td>
									<td>
										<%-- <c:out value="${item.createTime}" /> --%>
										<fmt:formatDate value="${item.createTime}"  pattern="yyyy/MM/dd  HH:mm:ss" />
									</td>
									<td>
										<%-- <c:out value="${item.lastModifyTime}" /> --%>
										<fmt:formatDate value="${item.lastModifyTime}"  pattern="yyyy/MM/dd  HH:mm:ss" />
									</td>
									<td>
										<%-- <c:out value="${item.loginTime}" /> --%>
										<fmt:formatDate value="${item.loginTime}"  pattern="yyyy/MM/dd  HH:mm:ss" />
									</td>
									<td>
										<c:out value="${item.loginIp}" />
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

