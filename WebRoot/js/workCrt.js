function CountWords() {
	var countAll = 255;
	var content = document.getElementById('certificate.memo').value;
	if (countAll < Length(content)) {
		alert("备注的长度超过了" + countAll + "的字数限制!\n超过的部分将被截取!");
		content = SubString(content, countAll);
		document.getElementById('certificate.memo').value = content;
	}
}
function openCard() {
	//document.getElementById('error').innerHTML = "正在连接发卡机...";
	if (devread == undefined) {
		alert('请安装OCX控件！');
		return false;
	}
	try {
		var openStatus = devread.csOpenLitPort();
	} catch (err) {
		alert('无法正常使用OCX控件...');
	}
	if (openStatus == '1') {
		csCloseLitPort();//关闭串口
		alert("打开发卡机失败! ");
		document.getElementById('error').innerHTML = "打开发卡机失败! ";
		return false;
	} else {
		//document.getElementById('error').innerHTML = "成功连接发卡机! ";
		return true;
	}
}
function getCardStatus() {
	var cardStatus = devread.csServerJudgeCardStatus();
	//alert(cardStatus);
	if (cardStatus == null || cardStatus == '') {
		document.getElementById('error').innerHTML = "卡状态获取失败!";
		return;
	}
	var cStatus = cardStatus.substring(0, 1);
	if (cStatus == '0') {
		document.getElementById('error').innerHTML = "没有卡!";
		return cStatus;
	}
	if (cStatus == '2') {
		cStatus = cardStatus;
	}
	if (cStatus == '3') {
		document.getElementById('error').innerHTML = "USB 打不开!";
		return cStatus;
	}
	if (cStatus == '4') {
		document.getElementById('error').innerHTML = "与发卡工具LIT 握手失败!";
		return cStatus;
	}
	if (cStatus == '5') {
		document.getElementById('error').innerHTML = "PIN 校验不正确!";
		return cStatus;
	}
	if (cStatus == '6') {
		document.getElementById('error').innerHTML = "未经过预发卡的卡片!";
		return cStatus;
	}
	return cStatus;
}
//关闭发卡机 和遮罩层 
function csCloseLitPort() {
	//Close();
	$$("idBoxClose").onclick();//关闭遮罩层，IE6
	var closeStatus = devread.csCloseLitPort();
	if (closeStatus == '1') {
		alert("关闭发卡机失败！");
		return false;
	}

}
//关闭发卡机  
function justCoseLitPort() {
	var closeStatus = devread.csCloseLitPort();
	if (closeStatus == '1') {
		alert("关闭发卡机失败！");
		return false;
	}

}
function getPublicKey(cardStatus) {
	var publicKey = null;
	if (cardStatus != null && cardStatus == '1'
			|| cardStatus.substring(0, 1) == '2') {
		publicKey = devread.csLitSendDataToServer(cardStatus);
	}
	return publicKey;
}

//去除=号
function getNeedString(alias) {
	var getAlias = "";
	var j = alias.indexOf("=");
	if (j != -1) {
		getAlias = alias.substring(0, j);
	} else {
		getAlias = alias;
	}
	return getAlias;
}
function addExtraMark(str, len, mark) {
	var MarkLength = len - str.length;
	var result = str;
	for ( var i = 0; i < MarkLength; i++) {
		result += mark;
	}
	return result;
}

function isTimeAvilable() {
	var expireTime = document.getElementById('certificate.expireTime').value;
	if (!isNull(expireTime)) {
		$.post("lscajax/workCertificateInsert!checkTime.action", {
			"certificate.expireTime" : expireTime
		}, function(result) {
			if (result == "已过期") {
				alert("证书已过期，请重新选择过期时间")
				document.getElementById('certificate.expireTime').value = "";
			}
		});
	}
}
function changeInstitution(value) {
	var institutionSelect = document.getElementById('institutionSelect');
	institutionSelect.options.length = 1;
	$.post("lscajax/institutionSearch!getOrganInfo.action", {
		"organ.countryId.id" : value
	}, function(result) {
		$(eval(result)).each(function(i, value) {
			var selectOp = new Option(value.organName, value.id);
			institutionSelect.options.add(selectOp);
		});
	});
	getCrtType();
}

function getCrtType() {
	var confMethod = document.getElementById("confMethod").value;
	if (confMethod == 0) {
		cleanInfo();
		var countryId = document.getElementById('country.id').value;
		var organId = document.getElementById('institutionSelect').value;
		var verSelect = document
				.getElementById('certificate.certificateType.id');
		var functionId = document
				.getElementById('certificateType.crtFunction.id').value;
		//alert(functionId)
		$.post("lscajax/certificateTypeSearch!getTypeInfo.action", {
			"certificateType.type" : 3,
			"certificateType.organ.countryId.id" : countryId,
			"certificateType.crtFunction.id" : functionId,
			"certificateType.organ.id" : organId
		}, function(result) {
			if (result == null) {
				return;
			}
			//上级证书类型下拉框
				verSelect.options.length = 1;
				//var pleaseSelectOp = new Option("———请选择———", "");
				//verSelect.options.add(pleaseSelectOp);
				if (result != "[]") {
					$(eval(result)).each(function(i, value) {
						var selectOp = new Option(value.crtTypeName, value.id);
						verSelect.options.add(selectOp);
					});
				}
			});
	}
}
function changeType(typeId) {
	if (typeId == 0) {
		cleanInfo();
	} else {
		$
				.post(
						"lscajax/workCertificateInsert!getInfo.action",
						{
							"certificateType.id" : typeId
						},
						function(result) {
							var isShow = true;
							$(eval(result))
									.each(function(i, value) {
										//i=0,判断上级证书方案是否可用
											//if (isShow == true) {
											if (value.name == "certificateType.replaceLandirootcrt") {
												if (value.info == 1) {
													document
															.getElementById('certificateType.replaceLandirootcrt').innerHTML = "可替换";
												} else {
													document
															.getElementById('certificateType.replaceLandirootcrt').innerHTML = "不可替换";
												}
											} else if (i != 0 && i != 12) {
												document
														.getElementById(value.name).innerHTML = value.info;
											}
											if (value.name == "isParentAvailable") {
												if (value.info == 0) {//不存在
													//cleanInfo();
													alert("该上级证书方案的证书未生成,请先配置");
													//isShow = false;
												}
												if (value.info == 1) {//已过期
													//cleanInfo();
													alert("该上级证书方案的证书已过期");
													//isShow = false;
												}
												document
														.getElementById(value.name).value = value.info;
											}
											//}
										});

						});
	}
}

//提交时输入的校验
function checkSumbit() {
	var selectIndex = document.getElementById('country.id').selectedIndex;
	if (selectIndex == 0) {
		alert("请选择所在国家!");
		return false;
	}
	var selectIndex = document.getElementById('institutionSelect').selectedIndex;
	if (selectIndex == 0) {
		alert("请选择所在机构!");
		return false;
	}
	var selectIndex = document.getElementById('certificateType.crtFunction.id').selectedIndex;
	if (selectIndex == 0) {
		alert("请选择证书功能!");
		return false;
	}
	var selectIndex = document.getElementById('certificate.certificateType.id').selectedIndex;
	if (selectIndex == 0) {
		alert("请选择证书方案!");
		return false;
	}
	var expireTime = document.getElementById('certificate.expireTime');
	if (isNull(expireTime.value)) {
		alert("请选择证书过期时间!");
		expireTime.focus();
		return false;
	}
	return true;
}
//检测配置返回的结果数据
function checkResult(result) {
	if (result.substring(0, 1) == "*") {
		document.getElementById('error').innerHTML = result.substring(1);
		return false;
	} else {
		return true;
	}
}
