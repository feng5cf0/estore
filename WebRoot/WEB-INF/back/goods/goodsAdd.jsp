<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<style> 
  			.black_overlay{  
  				display: none;  
  				position: absolute;  
  				top: 0%;  left: 0%;  width: 100%;  height: 100%;  
  				background-color: white;  z-index:1001;  -moz-opacity: 0.8;  
  				opacity:.80;  filter: alpha(opacity=80);  
  			}
  			.categoryDiv {
  				display: none;  position: absolute;  
  				top: 25%;  left: 25%;  width: 50%;  height: 50%;  
  				padding: 16px;  border: 16px solid orange;  background-color: white;  
  				z-index:1002;  overflow: auto;  
  			}
		</style> 
		<script language="javascript">
			function categorySelect(){

				document.getElementById('categoryDiv').style.display='block';
				document.getElementById('fade').style.display='block'
			}
			function fileValue(id,name,code){
				var _id = id;
				var _name = name;
				var _code = code;
				
				document.getElementById('categoryDiv').style.display='none';
				document.getElementById('fade').style.display='none'
				
				document.getElementById("goods.categoryId").value = _id;
				document.getElementById("categoryName").value = _name;
				document.getElementById("categoryCode").value= _code;
			
			}
function changeArea(areaId, areaName) {
	document.getElementById('areaName').value = areaName;
	document.getElementById('belongAreaId').value = areaId;
	document.getElementById('belongAreaName').innerText = areaName;
}

function checkSubmit() {
	var rightname = document.getElementById('right.rightName');
	var rightmark = document.getElementById('right.rightMark');
	var righturl = document.getElementById('right.rightURL');
	//var error = document.getElementById('error');
	var reg = /^[a-zA-Z0-9\u4E00-\u9FFF]{2,20}$/;
	if (!reg.test(trim(rightname.value))) {
		rightname.focus();
		alert("权限名称不可为空，且必须由2至20位字母、数字和汉字组成!");
		return false;
	}
	/**
	if (rightOnly(trim(rightname.value))) {
		error.innerHTML = "该权限名已存在，请重新输入!";
		document.getElementById('belongAreaId').value = "";
		return false;
	}
	if (isRightUse(trim(rightname.value), trim(rightmark.value),
			trim(righturl.value))) {
		error.innerHTML = "权限名称、权限标识或权限URL已被使用!";
		document.getElementById('belongAreaId').value = "";
		return false;
	}
	 **/
	if (!checkData(false, 'right.rightMark', "权限标识", 1, 50)) {
		return false;
	}
	var rightURL = document.getElementById('right.rightURL').value;
	if (!isNull(trim(rightURL)) && rightURL.length > 100) {
		alert("URL指向由1至100位任意字符组成");
		return false;
	}

	if (!checkData(false, 'right.memo', "备注", 1, 255)) {
		return false;
	}

	return true;
}

function rightOnly(rightname) {
	var flag = false;
	$.post("coreajax/rightInsert!isOnlyRightName.action?", {
		"right.rightName" : rightname
	}, function(result) {
		$(eval(result)).each(function(id, value) {
			if (value.ans == "1") {
				flag = true;
			}
		});
	});
	var t = setTimeout("return flag;", 1000)
}

function isRightUse(name, mark, url) {
	var flag = false;
	$.post("coreajax/rightInsert!isRightUse.action", {
		"right.rightName" : name,
		"right.rightMark" : mark,
		"right.rightURL" : url
	}, function(result) {
		$(eval(result)).each(function(id, value) {
			if (value.isTrue == '1')
				flag = true;
		});
	});
	var t = setTimeout("return flag;", 1000)
}
</script>
	</head>
	<body>
		<form action="${basePath}back/goodsAction!addGoods.action"
			method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：商品管理 &gt; 商品信息  &gt; 新增商品
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
											商品信息
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
						<div class="buttonbg1"></div>
						<div class="divtable">
							<table width="100%" border="0" cellspacing="1" cellpadding="0"
								bgcolor="#cecece">
								<input type="hidden" name="pager.curPageNum"
									value="${pager.curPageNum}" />
								<tr>
									<td width="200" class="tableitem1">
										类别名称：
									</td>
									<td class="tableitem3">
										<input type="hidden" id="goods.categoryId" name="goods.categoryId" value="${goods.categoryId}"/>
										<input type="text" id="categoryName" name="categoryName"
											value="${categoryName}" maxlength="20" readonly="readonly" onclick="categorySelect();"/>
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem4">
										商品名称：
									</td>
									<td class="tableitem2">
										<input type="text" id="goods.goodsName" name="goods.goodsName"
											value="${goods.goodsName}" maxlength="20"/>
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem4">
										商品代码：
									</td>
									<td class="tableitem2">
										<input type="hidden" name="categoryCode" value="${categoryCode}" id="categoryCode"/>
										<input type="text" id="goods.goodsCode" name="goods.goodsCode"
											value="${goods.goodsCode}" maxlength="20"/>
										<FONT color=red>*</FONT>
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem1">
										商品描述：
									</td>
									<td class="tableitem3">
										<input type="text" id="goods.goodsDescription" name="goods.goodsDescription"
											value="${goods.goodsDescription}" maxlength="50" />
									</td>
								</tr>
								<tr>
									<td width="200" class="tableitem4">
										商品图片：
									</td>
									<td class="tableitem2">
										<input type="text" id="goods.picture" name="goods.picture"
											value="${goods.picture}" maxlength="100" />
									</td>
								</tr>
								<tr>
									<td class="tableitem1">
										备注：
									</td>
									<td class="tableitem3">
										<label for="textarea"></label>
										<textarea name="goods.memo" id="goods.memo" cols="45" rows="5"
											maxlength="255">${goods.memo}</textarea>
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
											<ld:check mark="goodsManager">
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
												onclick="window.history.go(-1);" />
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div id="categoryDiv" class="categoryDiv" >
			<table width="100%" id="table1" border="1" cellpadding="0"
				cellspacing="1" bordercolor="98a8cc"
				style="background-color: ffffff; border-collapse: collapse; display: inherit;"
				frame="border">
			<tr>
				<td>
					<script type="text/javascript">
						d = new dTree('d');
						<c:forEach items="${categoryList}" var="item">
							<c:choose>
								<c:when test="${item.isLeaf == 1}">
									var id = ${item.id};
									var name = "${item.categoryName}";
									var code ="${item.categoryCode}";
									d.add(${item.id},${item.parentCategory},'${item.categoryName}','javascript:fileValue(${item.id},\''+name+'\',\''+code+'\');');
								</c:when>
								<c:when test="${item.isLeaf != 1}">
									var id = ${item.id};
									var name = "${item.categoryName}";
									d.add(${item.id},${item.parentCategory},'${item.categoryName}','javascript:alert(\'不能在此类别下添加商品!\')');
								</c:when>
							</c:choose>
						</c:forEach>
						d.config.useSelection = false;
						d.config.useIcons=false;
						document.write(d);
     				</script>
				</td>
			</tr>
		</table>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
			<tr>
				<td>&nbsp;</td>
				<td align="center">
					<input type="button" value="关 闭" class="button4"
						onmouseover="this.className='button4Over'"
						onmouseout="this.className='button4Out'"
						onclick="document.getElementById('categoryDiv').style.display='none';document.getElementById('fade').style.display='none'" />
				</td>
			</tr>
		</table>
		</div>
		<div id="fade" class="black_overlay"></div>
	</body>
</html>


