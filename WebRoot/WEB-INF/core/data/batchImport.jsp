<%@page language="java" contentType="text/html; charset=utf-8"%>
<%@include file="/tagDeclare.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<%@include file="/headDeclare.jsp"%>
		<script type="text/javascript">
/**
 window.onload = function checkSubmit() {//测试id=progressBar的遮罩层效果
 $("#progressBar").mask("正在处理中，请稍后...");
 }
 **/

function checkSubmit() {
	var checkFile = document.getElementById('upload');
	if (checkFile != null && checkFile.value != null && checkFile.value != "") {
		$("#progressBar").mask("正在校验excel文件，请稍后...");//打开遮罩层
		window.setInterval('getMaskInfo()', 10);//定时获取后台关于进度的信息
		return true;
	} else {
		alert("请上传文件.");
	}
	return false;
}

//获取后台关于进度的信息
function getMaskInfo() {
	var url = "${basePath}core/ttAction!getMaskInfo.action";
	$.ajax( {
		url : url,
		type : 'post',
		data : {},
		dataType : 'text',
		timeout : 60000,
		error : function(e) {
		},
		success : function(result) {
			if (result != null && result != '') {
				if ($("#progressBar").isMasked()) {
					$("#progressBar").unmask();//关闭遮罩层
		$("#progressBar").mask(result);
	}
}
}
	});
}
</script>
	</head>

	<body id="progressBar">
		<form action="${basePath}core/ttAction!importBatch.action"
			name="fileForm" enctype="multipart/form-data" method="post">
			<div id="rightcontent">
				<div id="road" class="road">
					<div class="roadItem">
						<div class="roadIcon"></div>
						<div class="roadItem2">
							您当前位置：数据管理 &gt; 导入缴费信息 
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
											用户导入
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
									选择导入的文件：
								</td>
								<td class="tableitem3">
									<input type="file" name="upload" id="upload"
										class="img-input-disable" />
									<FONT color=red>*</FONT>
								</td>
							</tr>
							<tr>
								<td class="tableitem4">
									用户导入模版下载：
								</td>
								<td class="tableitem2">
									<a href="template/pay.xls"
										style="color: #ff7800">下载用户导入模板</a>
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
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</form>
	</body>
</html>

