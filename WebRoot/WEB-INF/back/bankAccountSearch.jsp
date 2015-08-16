<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		    <script type="text/javascript" charset="utf-8" src="js/bankAccount/bankAccount.js"> </script>
	</head>
	<body>
		<div id="rightcontent">
			<div id="road" class="road">
				<div class="roadItem">
					<div class="roadIcon"></div>
					<div class="roadItem2">
						您当前位置：系统管理 &gt; 银行账户管理
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
										银行账号管理
									</td>
									<td class="tabr">
									</td>
								</tr>
							</table>
						</div>
						<div class="tab4">
						</div>
					</div>
					<div class="buttonbg">
						<div class="divbutton2">
							<ld:check mark="saleManager">
								<input type="button" value="新增" class="button2"
									onMouseOver="this.className='button2Over'"
									onMouseOut="this.className='button2Out'" onclick="toAddBankAccount();" />
							</ld:check>
						</div>
					</div>
					
					<div class="buttonbg">
					</div>
					<div class="divtable">
						<table width="100%" border="0" cellspacing="1" cellpadding="0"
							bgcolor="#cecece">
							<tr class="listtitle">
								<td>
									序号
								</td>
								<td>
									编辑者
								</td>
								<td>
									编辑时间
								</td>
								<td>
									 操作
								</td>
							</tr>

							<c:forEach items="${bankAccountList }" var="item" varStatus="status">
								<tr
									onMouseOver="this.className='tableitem9';this.style.cursor='hand';"
									onMouseOut="this.className='tableitem${6-status.index%2}';this.style.cursor='hand';"
									class="tableitem${6-status.index%2}"
									<ld:check mark="userDetail">onclick="showItem(${item.id});"</ld:check>>
									<td>
										${status.count}
									</td>
									<td>
										<c:out value="${item.createUser}" />
									</td>
									<td>
										<fmt:formatDate value="${item.createTime }"  pattern="yyyy/MM/dd  HH:mm:ss" />
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

