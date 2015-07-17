function selectInnerBox(obj) {
  try{
    fireClickEventOnChild(obj,'input');
  }
  catch(e){}
}
/**
 * 触发click事件
 */
function fireClickEventOnChild(obj, tag) {
  var tagA = window.event.srcElement.nodeName.toLowerCase();
  if(tagA == "a") return;
  if (obj.hasChildNodes) {
    for (i=0; i<obj.childNodes.length; i++) {
      if(obj.childNodes[i].hasChildNodes){
        for (j=0; j<obj.childNodes[i].childNodes.length; j++) {
          if (obj.childNodes[i].childNodes[j].nodeName.toLowerCase() == tag.toLowerCase()) {
            if (obj.childNodes[i].childNodes[j].click) {
              obj.childNodes[i].childNodes[j].click();
              if(obj.childNodes[i].childNodes[j].type.toLowerCase() == 'checkbox'){
                if(obj.childNodes[i].childNodes[j].checked == true){
                  obj.style.backgroundColor = over_color;
                }
                else{
                  obj.style.backgroundColor = "";
                }
              }
              if(obj.childNodes[i].childNodes[j].type.toLowerCase() == 'radio'){
                clearSelected(magictableId);
                if(obj.childNodes[i].childNodes[j].checked == true){
                  obj.style.backgroundColor = over_color;
                }
                else{
                  obj.style.backgroundColor = "";
                }
              }
              return;
            }
          }
        }
      }
    }
  }
}

//判断是否为字母或者点号的组合
//是:返回true
//否:返回false
function isNumAndD(s) {
	var regu = "^[A-Za-z\.]+$";
	var re = new RegExp(regu);
	if (s.search(re) == -1) {
		return false;
	} else {
		return true;
	}
}
//判断是否为数字、逗号或者减号的组合
//是:返回true
//否:返回false
function isNumAndDG(s) {
	var regu = "^[0-9\,\-]+$";
	var re = new RegExp(regu);
	if (s.search(re) == -1) {
		return false;
	} else {
		return true;
	}
}

function checkAll(items, trueOrFalse) {
	if (document.getElementsByName(items)) {
		var items = document.getElementsByName(items);
		for (i = 0; i < items.length; i++) {
			items[i].checked = trueOrFalse;
		}
	}
}
function formatBankNo(BankNo) {
	if (BankNo.value == "") {
		return;
	}
	var account = new String(BankNo.value);
	account = account.substring(0, 22);
	/*帐号的总数, 包括空格在内 */
	if (account.match(".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null) {
		/* 对照格式 */
		if (account.match(".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}|" + ".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null) {
			var accountNumeric = accountChar = "", i;
			for (i = 0; i < account.length; i++) {
				accountChar = account.substr(i, 1);
				if (!isNaN(accountChar) && (accountChar != " ")) {
					accountNumeric = accountNumeric + accountChar;
				}
			}
			account = "";
			for (i = 0; i < accountNumeric.length; i++) {
				/* 可将以下空格改为-,效果也不错 */
				if (i == 4) {
					account = account + " ";
				}
				/* 帐号第四位数后加空格 */
				if (i == 8) {
					account = account + " ";
				}
				/* 帐号第八位数后加空格 */
				if (i == 12) {
					account = account + " ";
				}
				/* 帐号第十二位后数后加空格 */
				account = account + accountNumeric.substr(i, 1);
			}
		}
	} else {
		account = " " + account.substring(1, 5) + " " + account.substring(6, 10) + " " + account.substring(14, 18) + "-" + account.substring(18, 25);
	}
	if (account != BankNo.value) {
		BankNo.value = account;
	}
}
function checkBankNo(BankNo) {
	if (BankNo.value == "") {
		return;
	}
	if (BankNo.value.match(".[0-9]{4}-[0-9]{4}-[0-9]{4}-[0-9]{7}") == null) {
		if (BankNo.value.match("[0-9]{19}") != null) {
			formatBankNo(BankNo);
		}
	}
}
function checkEnterForFindListing(e) {
	var characterCode;
	if (e && e.which) {
		e = e;
		characterCode = e.which;
	} else {
		e = event;
		characterCode = e.keyCode;
	}
	if (characterCode == 22) {
		document.forms[getNetuiTagName("findListingForm")].submit();
		return false;
	} else {
		return true;
	}
}

//字符串类型添加endWith方法
String.prototype.endWith = function (oString) {
	var reg = new RegExp(oString + "$");
	return reg.test(this);
};
function getEndYearDate() {
	var day = new Date();
	var Year = 0;
	Year = day.getFullYear();
	return Year + "-01-01";
}
function getNowFormatDate() {
	var day = new Date();
	var Year = 0;
	var Month = 0;
	var Day = 0;
	var CurrentDate = "";
			   //初始化时间
			   //Year       = day.getYear();//有火狐下2008年显示108的bug
	Year = day.getFullYear();//ie火狐下都可以
	Month = day.getMonth() + 1;
	Day = day.getDate();
	CurrentDate += Year + "-";
	if (Month >= 10) {
		CurrentDate += Month + "-";
	} else {
		CurrentDate += "0" + Month + "-";
	}
	if (Day >= 10) {
		CurrentDate += Day;
	} else {
		CurrentDate += "0" + Day;
	}
	return CurrentDate;
}
			
			
//判断是否为数字或字母的组合
//是:返回true
//否:返回false
function isNumberAndAlpha(s) {
	var regu = "^[A-Za-z0-9]+$";
	var re = new RegExp(regu);
	if (s.search(re) == -1) {
		return false;
	} else {
		return true;
	}
}

//判断是否为数字
//是:返回true
//否:返回false
function isNumber(s) {
	var regu = "^[0-9]+$";
	var re = new RegExp(regu);
	if (s.search(re) == -1) {
		return false;
	} else {
		return true;
	}
}
function ismoney(value) {
	var mny = /^\d{1,10}(\.\d{1,2})?$/;
	return mny.test(value);
}
function isRate(value) {
	var mny = /^\d{1}(\.\d{1,4})?$/;
	return mny.test(value);
}
 


//判断是字符中的各个元素是否相同
//否:返回true
//是:返回false
function isSame(str) {
	var reg = /(\w)\B(?!\1)(\w)*/ig;
	var result = reg.test(str);
	return result;
}

//判断是否为数字或字母的组合
//是:返回true
//否:返回false
function isW(s) {
	var regex = /^([A-Za-z0-9]){1}([\w-])*([A-Za-z0-9]){1}$/;
	return regex.test(s);
}

//trim函数
String.prototype.trim = function () {
	return this.replace(/(^\s*)|(\s*$)/g, "");
};

//是否为空
//是:返回true
//否:返回false		
function isNull(value) {
	if ((value == null) || (value.trim() == undefined) || (value == "") || (value.trim() == "")) {
		return true;
	} else {
		return false;
	}
}

//是否为有效的电子邮件地址
//是:返回true
//否:返回false
function isValidEmail(s) {
	var regex = /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/;
	return regex.test(s);
}
function isValidNum(s) {
	var regex = /^([0-9])+$/;
	return regex.test(s);
}
function isValidZipCode(s) {
	var regex = /^([0-9]){6}$/;
	return regex.test(s);
}
function isValidUsername(s, len) {
	//alert(s.toLowerCase());
	var maxLen = 20;
	if (parseInt(len) > 0) {
		maxLen = parseInt(len);
	}
	if (isNull(s)) {
		return false;
	}
	if (!isW(s)) {
		return false;
	}
	if (!isValidLen(s, 6, 20)) {
		return false;
	}
	if (s.toLowerCase() == "system" || s.toLowerCase() == "null" || s.toLowerCase() == "admin") {
		//alert("system");
		return false;
	}
	//alert(s.length);
	return true;
}
function isValidPwd(value) {
	var regex = /^([0-9]|[a-z]|[A-Z]){6,16}$/;
	return regex.test(value);
}
function isFloat(value) {
	var regex = /^[0-9]+.?[0-9]*$/;
	return regex.test(value);
	
}

//检验字符串S是否为有效长度
function isValidLen(s, min, max) {
	var minLen = 0;
	var maxLen = 16;
	if (parseInt(min) != 0) {
		minLen = parseInt(min);
	}
	if (parseInt(max) > 0) {
		maxLen = parseInt(max);
	}
	if (s.length < minLen) {
		return false;
	}
	if (s.length > maxLen) {
		return false;
	}
	return true;
}
function isMaxLimit(s, max) {
	var maxLen = 16;
	//alert("length:"+s.length+" max:"+max);
	if (parseInt(max) > 0) {
		maxLen = parseInt(max);
	}
	if (s.length > maxLen) {
		return false;
	}
	return true;
}
function isMinLimit(s, min) {
	var minLen = 0;
	if (parseInt(min)) {
		minLen = parseInt(min);
	}
	if (s.length < minLen) {
		return false;
	}
	return true;
}

//判断是否为卡号
function isCardNo(value) {
	var mny = /^([0-9]){4,19}$/;
	return mny.test(value);
}

//判断是否为一定宽度的数字
function isLimitNumber(value, min, max) {
	if (typeof (min) != "number") {
		min = 0;
	}
	var regStr;
	if (typeof (max) != "number") {
		regStr = "^[0-9]{" + min + "}$";
	} else {
		regStr = "^[0-9]{" + min + "," + max + "}$";
	}
	var reg = new RegExp(regStr);
	return reg.test(value);
}

//清空表格
function clearTable(tableId) {
	var tableEle = document.getElementById(tableId);
	var tBody = tableEle.getElementsByTagName("TBODY")[0];
	while (tBody.rows.length > 0) {
		tBody.deleteRow(tBody.rows.length - 1);
	}
}

//只允许输入浮点数
function onlyDouble(oldValue) {
	var keycode = window.event.keyCode;
	if (keycode == 8 || keycode == 9 || keycode == 35 || keycode == 36 || keycode == 37 || keycode == 39 || keycode == 46) {
		return true;
	}
	if ((keycode >= 48 && keycode <= 57)|| (keycode >= 96 && keycode <= 105)) {
		return true;
	}
	var oValue = trim(oldValue);
	if ((keycode == 190) && (oValue.length > 0 && oValue.indexOf(".") == -1)) {
		return true;
	}
	//小键盘的.键
	if ((keycode == 110) && (oValue.length > 0 && oValue.indexOf(".") == -1)) {
		return true;
	}else {
		window.event.returnValue = false;
	}
}

//只允许输入金额数值
function onlyAmount(oldValue) {
	var keycode = window.event.keyCode;
	if (keycode == 8 || keycode == 9 || keycode == 35 || keycode == 36 || keycode == 37 || keycode == 39 || keycode == 46) {
		return true;
	}
	//小键盘的数字键
	if ((keycode >= 48 &&keycode<= 57) || (keycode >= 96 && keycode <= 105)) {
		return true;
	}
	var oValue = trim(oldValue);
	if ((keycode == 190) && (oValue.length > 0 && oValue.indexOf(".") == -1)) {
		return true;
	}
	//小键盘的.键
	if ((keycode == 110) && (oValue.length > 0 && oValue.indexOf(".") == -1)) {
		return true;
	}
	if (document.selection.createRange().text == oldValue) {
		oValue = String.fromCharCode(keycode);
	} else {
		oValue = oldValue + String.fromCharCode(keycode);
	}
	if (!ismoney(oValue)) {
		window.event.returnValue = false;
	}
}

//只允许输入数字
function onlyNum() {
	var keycode = window.event.keyCode;
	if (keycode == 8 || keycode == 9 || keycode == 35 || keycode == 36 || keycode == 37 || keycode == 39 || keycode == 46) {
		return true;
	}
	if (!((window.event.keyCode >= 48 && window.event.keyCode <= 57) || (window.event.keyCode >= 96 && window.event.keyCode <= 105))) {
		window.event.returnValue = false;
	}
}

//验证数字(整数、浮点数都可以通过)
function isfloat(oNum) {
	if (!oNum) {
		return false;
	}
	var strP = /^\d+(\.\d+)?$/;
	if (!strP.test(oNum)) {
		return false;
	}
	try {
		if (parseFloat(oNum) != oNum) {
			return false;
		}
	}
	catch (ex) {
		return false;
	}
	return true;
}

//只允许输入英文字母
function onlyEng() {
	var keycode = window.event.keyCode;
	if (keycode == 8 || keycode == 9 || keycode == 35 || keycode == 36 || keycode == 37 || keycode == 39 || keycode == 46) {
		return true;
	}
	if (!(window.event.keyCode >= 65 && window.event.keyCode <= 90)) {
		window.event.returnValue = false;
	}
}

//只允许输入英文字母和数字的组合
function onlyEngNum() {
	//alert(window.event.keyCode);
	var keycode = window.event.keyCode;
	if (keycode == 8 || keycode == 9 || keycode == 35 || keycode == 36 || keycode == 37 || keycode == 39 || keycode == 46) {
		return true;
	}
	if (!((keycode >= 48 && keycode <= 57) || (keycode >= 65 && keycode <= 90) || (keycode >= 96 && keycode <= 105))) {
		window.event.returnValue = false;
	}
}

//只允许输入英文字母和数字以及-_的组合
function onlyW() {
	//alert(window.event.keyCode);
	var keycode = window.event.keyCode;
	if (keycode == 8 || keycode == 9 || keycode == 35 || keycode == 36 || keycode == 37 || keycode == 39 || keycode == 46 || keycode == 189) {
		return true;
	}
	if (!((keycode >= 48 && keycode <= 57) || (keycode >= 65 && keycode <= 90) || (keycode >= 96 && keycode <= 105))) {
		window.event.returnValue = false;
	}
}

//是否为有效的昵称
function isValidNickname(nickname) {
	var regex = /^([\u4E00-\u9FA5]|[0-9]|[a-z]|[A-Z]){2,20}$/;
	if (regex.test(nickname) == false) {
		return false;
	}
	var chinesePattern = /^[\u4E00-\u9FA5]$/;
	var len = 0;
	for (var index = 0; index < nickname.length; index++) {
		var c = nickname.charAt(index);
		if (chinesePattern.test(c)) {
			len += 2;
		} else {
			len += 1;
		}
	}
	if ((len > 20) || (len < 4)) {
		return false;
	}
	return true;
}

//计算字符的长度,汉字算2个字符,英文字母和数字算一个字符
function Length(s) {
	var chinesePattern = /^[\u4E00-\u9FA5]$/;
	var len = 0;
	for (var index = 0; index < s.length; index++) {
		var c = s.charAt(index);
		if (chinesePattern.test(c)) {
			len += 2;
		} else {
			len += 1;
		}
	}
	return len;
}
function SubString(s, lens) {
	var chinesePattern = /^[\u4E00-\u9FA5]$/;
	var len = 0;
	if (Length(s) < lens) {
		return s;
	}
	for (var index = 0; index < s.length; index++) {
		var c = s.charAt(index);
		if (chinesePattern.test(c)) {
			len += 2;
		} else {
			len += 1;
		}
		if (len == lens) {
			len = index + 1;
			//alert(len);
			break;
		}
		if (len == lens + 1) {
			len = index;
			break;
		}
	}
	s = s.substring(0, len);
	return s;
}

//校验搜索关键字
function isSearch(s) {
	var regex = /^[^`~!@#$%^&*()+=|\\\[\]\{\}:;\��\,.<>\/?]{1}[^`~!@$%^&()+=|\\\[\]\{\}:;\��\,.<>?]{0,19}$/;
	return regex.test(s);
}
function filter(obj) {
	var oldStr = obj.value;
	var newStr = "";
	for (var i = 0; i < oldStr.length; i++) {
		if (oldStr.charCodeAt(i) < 32) {
			newStr += "";
		} else {
			newStr += oldStr.charAt(i);
		}
	}
	obj.value = newStr;
}



//输入框文字切换
function clearValue(id, default_value) {
	if (document.getElementById(id).value == default_value) {
		document.getElementById(id).value = "";
	} else {
		if (trim(document.getElementById(id).value) == "") {
			document.getElementById(id).value = default_value;
		} else {
		}
	}
}

//去左空格; 
function ltrim(s) {
	return s.replace(/^\s*/, "");
} 
//去右空格; 
function rtrim(s) {
	return s.replace(/\s*$/, "");
} 
//去左右空格; 
function trim(s) {
	return rtrim(ltrim(s));
}
function add_value(id, value, default_value) {
	if (document.getElementById(id)) {
		if (document.getElementById(id).value == default_value) {
			document.getElementById(id).value = value;
		} else {
			document.getElementById(id).value = document.getElementById(id).value + ";" + value;
		}
	}
}
//等比缩小onload="drawImage(this,114,82)"
function drawImage(ImgD, FitWidth, FitHeight) {
	var image = new Image();
	image.src = ImgD.src;
	if (image.width > 0 && image.height > 0) {
		if (image.width / image.height >= FitWidth / FitHeight) {
			if (image.width > FitWidth) {
				ImgD.width = FitWidth;
				ImgD.height = (image.height * FitWidth) / image.width;
			} else {
				ImgD.width = image.width;
				ImgD.height = image.height;
			}
		} else {
			if (image.height > FitHeight) {
				ImgD.height = FitHeight;
				ImgD.width = (image.width * FitHeight) / image.height;
			} else {
				ImgD.width = image.width;
				ImgD.height = image.height;
			}
		}
	}
} 
	
//判断对象是否为空
function isObjectNull(e) {
	if (!e && typeof (e) != "undefined" && e != 0) {
		return true;
	} else {
		return false;
	}
}
/**
  *判断数组array中石佛包含元素e
  *
  */
function arrayContains(array, e) {
	for (var i = 0; i < array.length; i++) {
		if (array[i] == e) {
			break;
		}
	}
	return !(i == array.length);
}
	
//打开窗口
var appRoot = "/pushLifeTms/";
function openDialogFrame(fileName, title, width, height, resize) {
	if (resize == null || resize == "") {
		return window.showModalDialog(appRoot + "dialog.jsp?title=" + title + "&src=" + escape(fileName) + "&scroll=no&height=" + height + "&width=" + width, 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:auto;help:no;status:no");
	} else {
		return window.showModalDialog(appRoot + "dialog.jsp?title=" + title + "&src=" + escape(fileName) + "&height=" + height + "&width=" + width, 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:" + resize + ";help:no;status:no");
	}
}

//判断输入是否为非符号字符
function checkChar(inputChar, minLen, maxLen) {
	var regStr = "^[a-zA-Z0-9\u4e00-\u9fff-]{" + minLen + "," + maxLen + "}$";
	var reg = new RegExp(regStr);
	return reg.test(inputChar);
}

//设置input为不可用(设置样式+readOnly)
function setInputDisable(ele) {
	if (typeof (ele) == "string") {
		ele = document.getElementById(ele);
	}
	ele.className = "dmg-input-disable";
	ele.readOnly = true;
	ele.value = ele.value + "";
}

//设置inout为可用(设置样式+取消readOnly)
function setInputEnable(ele) {
	if (typeof (ele) == "string") {
		ele = document.getElementById(ele);
	}
	ele.className = "dmg-input";
	ele.readOnly = false;
	ele.value = ele.value + "";
}

//设置select为不可用(隐藏select，显示div)
function setSelectDisable(selectEle, divEle) {
	selectEle = document.getElementById(selectEle);
	divEle = document.getElementById(divEle);
	selectEle.style.display = "none";
	divEle.style.display = "";
	divEle.innerHTML = selectEle.options[selectEle.selectedIndex].text;
}

//设置select为可用(显示select，隐藏div)
function setSelectEnable(selectEle, divEle) {
	selectEle = document.getElementById(selectEle);
	divEle = document.getElementById(divEle);
	selectEle.style.display = "block";
	divEle.style.display = "none";
}

//设置时间选择框为不可用
function setDateInputDisable(ele) {
	if (typeof (ele) == "string") {
		ele = document.getElementById(ele);
	}
	ele.className = "dmg-input-disable";
	ele.value = ele.value + "";
	ele.onfocus = function () {
		$dp.hide();
		return false;
	};
	ele.onclick = function () {
		$dp.hide();
		return false;
	};
}
//设置时间选择框为可用
function setDateInputEnable(ele, pattern) {
	if (typeof (ele) == "string") {
		ele = document.getElementById(ele);
	}
	ele.className = "dmg-input Wdate";
	ele.onfocus = function () {
		if (ele.className != "dmg-input-disable") {
			return WdatePicker({dateFmt:pattern});
		}
	};
	ele.value = ele.value + "";
}

//设置radio为不可用
function setRadioDisable(radioEles, radioGroup, divEle) {
	radioEles = document.getElementsByName(radioEles);
	radioGroup = document.getElementById(radioGroup);
	divEle = document.getElementById(divEle);
	radioGroup.style.display = "none";
	for (var i = 0; i < radioEles.length; i++) {
		if (radioEles[i].checked) {
			var text;
			try {
				text = radioEles[i].nextSibling.data;
			}
			catch (e) {
				text = radioEles[i].nextSibling.nextSibling.data;
			}
			divEle.innerHTML = text;
		}
	}
	divEle.style.display = "";
}

//设置radio为可用(显示select，隐藏div)
function setRadioEnable(radioEles, radioGroup, divEle) {
	radioEles = document.getElementsByName(radioEles);
	radioGroup = document.getElementById(radioGroup);
	divEle = document.getElementById(divEle);
	radioGroup.style.display = "block";
	divEle.style.display = "none";
}
function setSelectByText(ele, text) {
	if (typeof (ele) == "string") {
		ele = document.getElementById(ele);
	}
	for (var i = 0; i < ele.options.length; i++) {
		if (ele.options[i].text == text) {
			ele.options[i].selected - true;
			break;
		}
	}
}
function rightShow(obj, tar) {
	show(obj, tar);
}
function show(obj, tar) {
	var flag = false;
	for (var i = 2; i <= 9; i++) {
		var ss = parent.parent.parent.document.getElementById("content" + i).src;
		if (ss.endWith("/") || ss == "") {
			parent.parent.parent.menuFrame.addDiv(obj, tar, i);
			flag = true;
			break;
		}
	}
	if (!flag) {
		if (confirm("\u6807\u7b7e\u680f\u5df2\u8fbe\u5230\u6700\u5927\u503c\uff0c\u662f\u5426\u9700\u8981\u5173\u95ed\u6240\u6709\u6807\u7b7e\u9875")) {
			parent.parent.parent.menuFrame.resetMenu();
		}
	}
}
function checkData(isRequire, dataId, tipName, min, max) {
	var data = document.getElementById(dataId).value;
	var reg = eval("/^[a-zA-Z0-9\\u4E00-\\u9FFF\\-]{" + min + "," + max + "}$/");
	if (isRequire && isNull(trim(data))) {
		alert(tipName + "\u4e0d\u4e3a\u7a7a");
		return false;
	}
	if (!isNull(trim(data))) {
		if (!reg.test(trim(data))) {
			alert(tipName + "\u5fc5\u987b\u7531" + min + "\u81f3" + max + "\u4f4d\u5b57\u6bcd\u3001\u6570\u5b57\u6216\u6c49\u5b57\u7ec4\u6210!");
			return false;
		}
	}
	return true;
}
/** 
*删除数组指定下标
*/
Array.prototype.remove = function (obj) {
	for (var i = 0; i < this.length; i++) {
		var temp = this[i];
		if (!isNaN(obj)) {
			temp = i;
		}
		if (temp == obj) {
			for (var j = i; j < this.length; j++) {
				this[j] = this[j + 1];
			}
			this.length = this.length - 1;
		}
	}
};
/**
 * @param o 文本框对象
 * @param n 保留几位小数
 */
function fixNumber(o, n) {
	if (o.value == "" || isNaN(o.value) || o.value == Infinity) {
		o.value = parseFloat("0").toFixed(n);
	} else {
		o.value = parseFloat(o.value).toFixed(n);
	}
}
function getRadioValue(formName, radioName) {
	var radios = eval("document." + formName + "['" + radioName + "']");
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			return radios[i].value;
		}
	}
	return null;
}
function checkWeekValid(startWeekStr, endWeekStr) {
	var startDate = new Date(startWeekStr.substr(4, 10).replace(/\-/g, "/"));
	var endDate = new Date(endWeekStr.substr(4, 10).replace(/\-/g, "/"));
	if (startDate > endDate) {
		return false;
	}
	return true;
}

//获取季度开始日期字符串
function getQuarterlyStartStr(year, quarterly) {
	year = parseInt(year);
	quarterly = parseInt(quarterly);
	if (quarterly == 1) {
		return year + "-01-01";
	}
	if (quarterly == 2) {
		return year + "-04-01";
	}
	if (quarterly == 3) {
		return year + "-07-01";
	}
	if (quarterly == 4) {
		return year + "-10-01";
	}
	return year + "-01-01";
}

//获取季度结束日期字符串
function getQuarterlyEndStr(year, quarterly) {
	year = parseInt(year);
	quarterly = parseInt(quarterly);
	if (quarterly == 1) {
		return year + "-03-31";
	}
	if (quarterly == 2) {
		return year + "-06-30";
	}
	if (quarterly == 3) {
		return year + "-09-30";
	}
	if (quarterly == 4) {
		return year + "-12-31";
	}
	return year + "-12-31";
}

