
var over_color = "#ffffcc";
var sFeatures = "dialogHeight:200px;dialogWidth:350px;edge:Raised;center: Yes;help: no;resizable:no;status: no;";
var appRoot = "/pushLifeTms/";
/**
 * ѡ�����е�checkbox
 *
 * @items
 * @trueOrFalse
 **/
function checkAll(items, trueOrFalse) {
	if (document.all(items)) {
		var items = document.all(items);
		if (items.length > 1) {
			for (i = 0; i < items.length; i++) {
				items[i].checked = trueOrFalse;
				if (items[i].checked == true) {
					items[i].parentNode.parentNode.style.backgroundColor = over_color;
				} else {
					items[i].parentNode.parentNode.style.backgroundColor = "";
				}
			}
		} else {
			items.checked = trueOrFalse;
			if (items.checked == true) {
				items.parentNode.parentNode.style.backgroundColor = over_color;
			} else {
				items.parentNode.parentNode.style.backgroundColor = "";
			}
		}
	}
}
/**
 * �жϽű������Ƿ���[no object]����
 */
function isNoObjectError(e) {
	if ((e.number & 65535) == 5007 || (e.number & 65535) == 438) {
		return true;
	} else {
		return false;
	}
}
function execFrameAction(frame, action) {
	frame.actionExecutor.value = action;
	frame.actionExecutor.onclick();
}
/**
 *��һ��dialog,����ҳ����ʾ��dialog�ڵ�һ��֡��
 *params:
 *  fileName: �ļ���,ע����/dialog.jsp�����·��������system/add_org.jsp
 *  title: �Ի���ı���
 *  height: �߶�
 *  width: ���
 *  resize: �Ƿ���Ե����С
 **/
function openDialogFrame(fileName, title, width, height, resize) {
	if (resize == null || resize == "") {
		return window.showModalDialog(appRoot + "dialog.jsp?title=" + title + "&src=" + escape(fileName) + "&scroll=no", 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:auto;help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:auto;help:no;scroll:no;status:no' );
	} else {
		return window.showModalDialog(appRoot + "dialog.jsp?title=" + title + "&src=" + escape(fileName), 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:" + resize + ";help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:'+ resize +';help:no;scroll:no;status:no' );
	}
}
function openDialogFrame_refresh(fileName, title, width, height, resize) {
	if (resize == null || resize == "") {
		return window.showModalDialog(appRoot + "dialog_refresh.jsp?title=" + title + "&src=" + escape(fileName) + "&scroll=no", 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:auto;help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:auto;help:no;scroll:no;status:no' );
	} else {
		return window.showModalDialog(appRoot + "dialog_refresh.jsp?title=" + title + "&src=" + escape(fileName), 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:" + resize + ";help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:'+ resize +';help:no;scroll:no;status:no' );
	}
}
/**
 *��һ��dialog,����ҳ����ʾ��dialog�ڵ�һ��֡��
 *params:
 *  fileName: �ļ���,ע����/dialogCF.jsp�����·��������system/add_org.jsp
 *  title: �Ի���ı���
 *  height: �߶�
 *  width: ���
 *  resize: �Ƿ���Ե����С
 *  author:bianzk
 **/
function openDialogFrameCF(fileName, title, width, height, resize) {
	if (resize == null || resize == "") {
		return window.showModalDialog(appRoot + "dialogCF.jsp?title=" + title + "&src=" + escape(fileName) + "&scroll=no", 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:auto;help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:auto;help:no;scroll:no;status:no' );
	} else {
		return window.showModalDialog(appRoot + "dialogCF.jsp?title=" + title + "&src=" + escape(fileName), 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:" + resize + ";help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:'+ resize +';help:no;scroll:no;status:no' );
	}
}
/**
 *��һ��dialog,����ҳ����ʾ��dialog�ڵ�һ��֡��(���в���( ȷ����ȡ�� )
 *params:
 *  fileName: �ļ���,ע����/dialog.jsp�����·��������system/add_org.jsp
 *  title: �Ի���ı���
 *  height: �߶�
 *  width: ���
 *  resize: �Ƿ���Ե����С
 *  auther: weng
 **/
function openDialogNoOkCancel(fileName, title, width, height, resize) {
	if (resize == null || resize == "") {
		return window.showModalDialog(appRoot + "issue_dialog.jsp?title=" + title + "&src=" + escape(fileName) + "&scroll=no", 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:auto;help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:auto;help:no;scroll:no;status:no' );
	} else {
		return window.showModalDialog(appRoot + "issue_dialog.jsp?title=" + title + "&src=" + escape(fileName), 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:" + resize + ";help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:'+ resize +';help:no;scroll:no;status:no' );
	}
}
/**
 *��һ��dialog,����ҳ����ʾ��dialog�ڵ�һ��֡��(���а�( �ر� )
 *params:
 *  fileName: �ļ���,ע����/dialog.jsp�����·��������system/add_org.jsp
 *  title: �Ի���ı���
 *  height: �߶�
 *  width: ���
 *  resize: �Ƿ���Ե����С
 *  auther: goodhq
 **/
function openDialogOnlyClose(fileName, title, width, height, resize) {
	if (resize == null || resize == "") {
		return window.showModalDialog(appRoot + "close_dialog.jsp?title=" + title + "&src=" + escape(fileName) + "&scroll=no", 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:auto;help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:auto;help:no;scroll:no;status:no' );
	} else {
		return window.showModalDialog(appRoot + "close_dialog.jsp?title=" + title + "&src=" + escape(fileName), 0, "dialogHeight:" + height + "px;dialogWidth:" + width + "px;resizable:" + resize + ";help:no;status:no");
//    return window.showModalDialog(appRoot + fileName,0,'dialogHeight:' + height + 'px;dialogWidth:'+width+'px;resizable:'+ resize +';help:no;scroll:no;status:no' );
	}
}
/*
*���methodName�жϷ����Ƿ����
*/
function methodIsExsit(frameObj, methodName) {
	if (frameObj == null) {
		return false;
	}
	var sObj = frameObj.document.getElementsByTagName("script");
	var sLen = sObj.length;
	if (sLen > 0) {
		for (i = 0; i < sLen; i++) {
			var scriptText = sObj[i].innerHTML;
			if (scriptText.indexOf("function " + methodName) != -1) {
				return true;
			}
		}
	}
	return false;
}
/**
 * ���ô򿨴��ڷ���
 */
function defaultIssueCard(items, entity, entityName) {
	if (items == null) {
		showInformation("\xfb\ufffd\u043f\ufffd\ufffd\u0534\udabe\ude35\ufffd" + entityName);
		return;
	}
	var itemStr = checkboxToUrlStr(items, "checkedItems");
	if (itemStr != null) {
//      var returnValue = openDialogNoOkCancel(entity +"Action.do?action=beginIssueCard&" + itemStr, "����" + entityName, 700, 470);
		var returnValue = openDialogFrameCF(entity + "Action.do?action=beginIssueCard&" + itemStr, "\ufffd\ufffd\ufffd\ufffd" + entityName, 700, 470);
		if (returnValue != null) {
			doRefresh();
		}
	} else {
		showInformation("\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\u0461\ufffd\ufffd\u04bb\ufffd\ufffd" + entityName);
	}
}
/**
 * ȱʡ��onDelete����
 */
function defaultEntityDelete(items, entity, entityName) {
	if (items == null) {
		showInformation("\xfb\ufffd\u043f\ufffd\ufffd\ufffd\u027e\ufffd\ufffd\ufffd" + entityName);
		return;
	}
	var itemStr = checkboxToUrlStr(items, "checkedItems");
	if (itemStr != null) {
		var doit = showQuestion("\ufffd\u01f7\ufffd\u027e\ufffd\ufffd\u0461\ufffd\u0435\ufffd" + entityName);
		if (doit == true) {
			var returnValue = openDialogFrame(entity + "Del.do?" + itemStr, "\u027e\ufffd\ufffd" + entityName, 350, 200);
			if (returnValue != null) {
				doRefresh();
			}
		}
	} else {
		showInformation("\ufffd\ufffd\u0461\ufffd\ufffd\ufffd\ufffd\u04aa\u027e\ufffd\ufffd\ufffd" + entityName);
	}
}
/**
 * ��ͨ�����ͽڵ�onDelete����
 */
function commonEntityDelete(item, entity, entityName) {
	if (item == null) {
		showInformation("\xfb\ufffd\u043f\ufffd\ufffd\ufffd\u027e\ufffd\ufffd\ufffd" + entityName);
		return;
	}
	if (item != null) {
		var doit = showQuestion("\ufffd\u01f7\ufffd\u027e\ufffd\ufffd\u0461\ufffd\u0435\ufffd" + entityName);
		if (doit == true) {
			var returnValue = openDialogFrame(entity + "Del.do?subroleid=" + item, "\u027e\ufffd\ufffd" + entityName, 350, 200);
			if (returnValue != null) {
				doRefresh();
			}
		}
	} else {
		showInformation("\ufffd\ufffd\u0461\ufffd\ufffd\ufffd\ufffd\u04aa\u027e\ufffd\ufffd\ufffd" + entityName);
	}
}
/**
 * �Զ���ĶԻ���
 **/
var strMessage = "";
function showError(strMessage) {
	return window.showModalDialog(appRoot + "common/systemdialog/error.jsp", strMessage, sFeatures);
}
function showExclamation(strMessage) {
	return window.showModalDialog(appRoot + "common/systemdialog/exclamation.jsp", strMessage, sFeatures);
}
function showInformation(strMessage) {
	return window.showModalDialog(appRoot + "common/systemdialog/information.jsp", strMessage, sFeatures);
}
function showQuestion(strMessage) {
	return window.showModalDialog(appRoot + "common/systemdialog/question.jsp", strMessage, sFeatures);
}
/**
 * ��checkbox�Ķ���ѡ�е�ֵ���һ��name=value&���ִ�
 */
function checkboxToUrlStr(items, param) {
	var str = "";
	if (items == undefined) {
		return null;
	}
	if (items.length > 1) {
		for (i = 0; i < items.length; i++) {
			if (items[i].checked) {
				str = str + param + "=" + items[i].value + "&";
			}
		}
		if (str.length > 0) {
			str = str.substring(0, str.length - 1);
		}
	} else {
		if (items.checked) {
			str = param + "=" + items.value;
		}
	}
	if (str.length == 0) {
		return null;
	} else {
		return str;
	}
}
/**
 * ��dialog����ֵ
 */
function backValue(value) {
	parent.parent.parent.window.returnValue = value;
	parent.parent.parent.window.close();
}
/**
 * ����¼��ķ���
 **/
function rowOverColor(rowObj) {
	if (rowObj.style.backgroundColor != over_color) {
		rowObj.style.backgroundColor = "#ffffcd";
	}
}
function rowOutColor(rowObj) {
	if (rowObj.style.backgroundColor != over_color) {
		rowObj.style.backgroundColor = "";
	}
}
function selectInnerBox(obj) {
	try {
		fireClickEventOnChild(obj, "input");
	}
	catch (e) {
	}
}
function selectInnerBox2(obj) {
	try {
		var tagA = window.event.srcElement.nodeName.toLowerCase();
   // alert("tagA="+tagA);
		var tmpobj = searchObjByTagName2(window.event.srcElement, "TR");
    // alert("tmpobj="+tmpobj.nodeName.toLowerCase());
		fireClickEventOnChild(tmpobj, "input");
		/*    
    alert("len="+obj.childNodes.length);
    if(obj.hasChildNodes){
    for (i=0; i<obj.childNodes.length; i++) {
        alert("child="+obj.childNodes[i].nodeName);
    	var obj2 = obj.childNodes[i];
    	alert("len2="+obj2.childNodes.length);
    	if(obj2.hasChildNodes){
    	for (j=0; j<obj2.childNodes.length; j++) {
    	    alert("child2="+obj2.childNodes[i].nodeName);
    		var obj3 = obj2.childNodes[j];
    		fireClickEventOnChild(obj3,'input');
    	}
      }
    }
    
   }
*/
	}
	catch (e) {
	}
}
function searchObjByTagName2(obj, tag) {
	while (obj != null && typeof (obj.tagName) != "undefind") {
		if (obj.tagName == tag.toUpperCase()) {
			return (obj);
		}
		obj = obj.parentElement;
	}
	return null;
}
/**
 * ����click�¼�
 */
function fireClickEventOnChild(obj, tag) {
	var tagA = window.event.srcElement.nodeName.toLowerCase();
	if (tagA == "a") {
		return;
	}
	if (obj.hasChildNodes) {
		for (i = 0; i < obj.childNodes.length; i++) {
			if (obj.childNodes[i].hasChildNodes) {
				for (j = 0; j < obj.childNodes[i].childNodes.length; j++) {
					if (obj.childNodes[i].childNodes[j].nodeName.toLowerCase() == tag.toLowerCase()) {
						if (obj.childNodes[i].childNodes[j].click) {
							obj.childNodes[i].childNodes[j].click();
							if (obj.childNodes[i].childNodes[j].type.toLowerCase() == "checkbox") {
								if (obj.childNodes[i].childNodes[j].checked == true) {
									obj.style.backgroundColor = over_color;
								} else {
									obj.style.backgroundColor = "";
								}
							}
							if (obj.childNodes[i].childNodes[j].type.toLowerCase() == "radio") {
								clearSelected(magictableId);
								if (obj.childNodes[i].childNodes[j].checked == true) {
									obj.style.backgroundColor = over_color;
								} else {
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

//Trim����ȥ��һ�ַ�}�ߵĿո�
function Trim(his) {
  //�ҵ��ַ�ʼλ��
	Pos_Start = -1;
	for (var i = 0; i < his.length; i++) {
		if (his.charAt(i) != " ") {
			Pos_Start = i;
			break;
		}
	}
  //�ҵ��ַ����λ��
	Pos_End = -1;
	for (var i = his.length - 1; i >= 0; i--) {
		if (his.charAt(i) != " ") {
			Pos_End = i;
			break;
		}
	}
  //���ص��ַ�
	Str_Return = "";
	if (Pos_Start != -1 && Pos_End != -1) {
		for (var i = Pos_Start; i <= Pos_End; i++) {
			Str_Return = Str_Return + his.charAt(i);
		}
	}
	return Str_Return;
}
function isEmpty(s) {
	return ((Trim(s) == null) || (Trim(s).length == 0));
}
function isCharsInBag(s, bag) {
	var i;
  // Search through string's characters one by one.
  // If character is in bag, append to returnString.
	for (i = 0; i < s.length; i++) {
    // Check that current character isn't whitespace.
		var c = s.charAt(i);
		if (bag.indexOf(c) == -1) {
			return false;
		}
	}
	return true;
}
function isInt(s) {
	if (isEmpty(s)) {
		return false;
	}
	var validChar = "0123456789";
	if (!isCharsInBag(s, validChar)) {
		return false;
	}
	return true;
}
function isDate(s, symbol) {
	var validChar = "0123456789" + symbol;
	if (!isCharsInBag(s, validChar)) {
		return false;
	}
	var i = s.indexOf(symbol);
	var j = s.lastIndexOf(symbol);
	if (i == j || i == -1 || j == -1) {
		return false;
	}
	var y = s.substring(0, i);
	var m = s.substring(i + 1, j);
	var d = s.substring(j + 1, s.length);
	if (!isInt(y) || !isInt(m) || !isInt(d)) {
		return false;
	}
	if (y < 1800 || y > 2200 || m < 1 || m > 12 || d < 1 || d > 31) {
		return false;
	}
	return true;
}
function isPrice(s, item) {
	if (isEmpty(s)) {
		showInformation(item + "\ufffd\ufffd\ufffd\ufffd\u03aa\ufffd\u0563\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ub8e1");
		return false;
	}
	if (s.indexOf(".") == 0) {
		showInformation("\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd" + item + s + "\ufffd\ufffd\ufffd\ufffd\u0427\ufffd\ufffd" + item + "\ufffd\ufffd\n\n\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\u03f7\ufffd\ufffd\ufffd" + item + "\ufffd\ufffd");
		return false;
	}
	var validChar = "0123456789.";
	if (!isCharsInBag(s, validChar) || s.indexOf(".") != s.lastIndexOf(".")) {
		showInformation("\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd" + item + s + "\ufffd\ufffd\ufffd\ufffd\u0427\ufffd\ufffd" + item + "\ufffd\ufffd\n\n\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\u03f7\ufffd\ufffd\ufffd" + item + "\ufffd\ufffd");
		return false;
	}
	if (s.lastIndexOf(".") != -1 && (s.length - s.lastIndexOf(".")) > 3) {
		showInformation("\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd" + item + s + "\ufffd\ufffd\ufffd\ufffd\u0427\ufffd\ufffd" + item + "\ufffd\ufffd\n\n\ufffd\ufffd\ufffd\ufffd\ufffd\ufffd\u03f7\ufffd\ufffd\ufffd" + item + "\ufffd\ufffd");
		return false;
	}
	return true;
}
function reloadFrames() {
	var len = parent.parent.frames.length;
	if (len) {
		for (i = 1; i < len; i++) {
			var cLocation = parent.parent.frames[i].location.href;
			parent.parent.frames[i].location.href = cLocation;
		}
	}
}


//-----------------����������һ������룬�Զ�j��Ĺ���---------------------------
//-----------------auth:yaoxj  2011-8-12---------------------
//-----------------ע������:���·���û�н���ģ�黯��ƣ����������ID ����---------
//-----------------��ҳ��ֱ�Ӵ��ݵģ�����Ҫ��֤ҳ���id�����js�����IDһ��--------
//-----------------���㣺��ҳ�����жϡ������ڿͻ��˻���һ�㸺����-------------
function orgChangeFun(obj) {
  	//onchange="document.all.inputOrgan.value=this.text;document.all.inputOrgan.focus();"
  	//alert(obj.options[obj.selectedIndex].text);
	document.all.inputOrgan.value = obj.options[obj.selectedIndex].text;
	eacTheSelect();
	document.all.inputOrgan.focus();
}
  

 
//������ʾֵ
function showTips() {
	obj = event.srcElement;
	if (obj.value) {
		var sel = document.getElementById("dispalySel");
		var origId = document.getElementById("origId");
		// var origId=document.getElementById("propertyInfo");
		sel.length = 0;
		  //g��ʾƥ�����еģ�i��ʾ����ִ�Сд
		  //var re=new RegExp(obj.value,"gi");
		var re = new RegExp("/*" + obj.value + "/*", "gi");
		var j = 0;
		if (!origId) {//���������Ϊ�յ�ʱ��ȡ��Ȩ��
			origId = document.getElementById("propertyInfo");
		}
		if (origId) {
			for (i = 0; i < origId.length; i++) {
				var orgTxt = origId.options[i].text;
			//  if(orgTxt.indexOf(obj.value)>0){
				if (re.test(orgTxt) == true) {
					sel.style.display = "";
					sel.add(new Option(orgTxt, origId.options[i].value));
					j++;
				}
			}
			sel.size = (j > 1) ? j : 2;
		}
	}
}

//����ֵ
function enterTips() {
	e = event.keyCode;
	var sel = document.getElementById("dispalySel");
	if (sel.style.display != "none") {
		if (e == 13) {
			event.srcElement.value = sel.value;
			sel.style.display = "none";
		}
		if (e == 40) {
			sel.focus();
		}
	}
}
//����ֵ
function retBackValue(value) {
	var sel = document.getElementById("dispalySel");
	var inputOrganId = document.getElementById("inputOrganId");
	var origId = document.getElementById("origId");
 //alert(sel.options[sel.selectedIndex].text);
 //sel.value;
	if (!origId) {//���������Ϊ�յ�ʱ��ȡ��Ȩ��
		origId = document.getElementById("propertyInfo");
	}
	if (sel && sel.selectedIndex >= 0) {
		inputOrganId.value = sel.options[sel.selectedIndex].text;
		origId.value = sel.value;
		eacTheSelect();
	}
}
//�˳����
function eacTheSelect() {
	var sel = document.getElementById("dispalySel");
	var inputOrganId = document.getElementById("inputOrganId");
	if (sel && inputOrganId) {
		sel.style.display = "none";
 	//��ƥ����ʱ�����ֵ
		if (sel.length < 0) {
			inputOrganId.value = "";
		}
	}
 //inputOrganId.focus();
}
document.onclick = eacTheSelect;

//---------------END---------------------------------



//-----------------����������һ������룬�Զ�j��Ĺ���---------------------------
//-----------------auth:yaoxj  2011-9-8---------------------
//-----------------ע������:ûȥ�޸�ԭ4���Զ�j�빦�ܣ��������һ���޸ģ��Ժ���������ƵĹ��ܣ�����ʹ�����ͨ�õ�--------
//----------------��2��ط�����id��4�������Ӿ����迼��id�Ĳ�һ������showAutoTips(attrId) ��retBackAutoValue(attrId) ����attrId��select��id---------------
//----------------select �������input���̶��ġ�����������ȥ�޸ġ�����
//----------------�ô���������ʹ��ajaxȥ����ݡ���������
//-----------------���㣺1����ҳ�����жϡ������ڿͻ��˻���һ�㸺�������������-------------
//-------------------2,document.onclick=eacTheAutoSelect; ���Ҫ��ҳ���������¡������js�����Ѿ���д�ˣ���д�Ͳ���Ч���ˣ�������鷳������-----------


  
 
//������ʾֵ
function showAutoTips(attrId) {
	obj = event.srcElement;
	if (obj.value) {
		var sel = document.getElementById("dispalyAutoSel");
		var dynamicId = document.getElementById(attrId);
		sel.length = 0;
		  //g��ʾƥ�����еģ�i��ʾ����ִ�Сд
		  //var re=new RegExp(obj.value,"gi");
		var re = new RegExp("/*" + obj.value + "/*", "gi");
		var j = 0;
		if (dynamicId) {
			for (i = 0; i < dynamicId.length; i++) {
				var dynaTxt = dynamicId.options[i].text;
			//  if(orgTxt.indexOf(obj.value)>0){
				if (re.test(dynaTxt) == true) {
					sel.style.display = "";
					sel.add(new Option(dynaTxt, dynamicId.options[i].value));
					j++;
				}
			}
			sel.size = (j > 1) ? j : 2;
			 
			 //added by linfux
			 //if(document.getElementById("smallCls2")!=undefined){//��ֹ��-��smallCls2�����ڸ�ס�����ط�Ҫ�ڸǵĵط���ͬ��Ҫ��д�ķ���,�ŵ�jsp��)
			 //	document.getElementById("smallCls2").innerHTML = "";
			 //}
			if (sel.value != "") {//Ĭ��dispalyAutoSel��ѡ��һ��������õ�dynamicId
				dynamicId.value = sel.value;
				dynamicId.onchange();
	 			//obj.value=dynamicId.options[dynamicId.selectedIndex].text;ûЧ��
			}
			//end
		}
	}
}

//����ֵ
function enterAutoTips() {
	e = event.keyCode;
	var sel = document.getElementById("dispalyAutoSel");
	if (sel.style.display != "none") {
		if (e == 13) {//Enter

		//modified by linfux
	   //event.srcElement.value=sel.value;
			if (sel.selectedIndex >= 0) {//�����ж�
				event.srcElement.value = sel.options[sel.selectedIndex].text;
			}
		//end
			sel.style.display = "none";
		}
		if (e == 40) {//Down
			sel.focus();
		}
	}
}
//����ֵ
function retBackAutoValue(attrId) {
	var sel = document.getElementById("dispalyAutoSel");
	var inputAutoId = document.getElementById("inputAutoId");
	var dynamicId = document.getElementById(attrId);
	if (sel && sel.selectedIndex >= 0) {
		inputAutoId.value = sel.options[sel.selectedIndex].text;
		dynamicId.value = sel.value;
		dynamicId.onchange();//��j��ʱ�������� add by linfux
		eacTheAutoSelect();
	}
}
//�˳����
function eacTheAutoSelect() {
	var sel = document.getElementById("dispalyAutoSel");
	var inputAutoId = document.getElementById("inputAutoId");
	if (sel && inputAutoId) {
		sel.style.display = "none";
 	//��ƥ����ʱ�����ֵ
		if (sel.length < 0) {
			inputAutoId.value = "";
		}
	}
 //inputOrganId.focus();
}


//document.onclick=eacTheAutoSelect;

//---------------END---------------------------------
//显示所属单位选择树
function showAreaTree(compId, compName) {
	var returnValue = openDialogFrame("${basePath}core/areaSearch!searchAreaForAreaTree.action", "\u9009\u62e9\u5355\u4f4d", 400, 400);
	if (!!returnValue) {
		document.getElementById(compId).value = returnValue[0];
		document.getElementById(compName).value = returnValue[1];
		document.getElementById(compName).focus = true;
	}
}
			
//清除选中的所属单位
function clearSelectArea(compId, compName) {
	document.getElementById(compId).value = "";
	document.getElementById(compName).value = "";
}

//删除行
function deleteRow(id) {
	if(confirm("确定要删除此条记录？")){
		var e = document.getElementById("tr" + id);
		e.parentNode.removeChild(e);
	}
}

