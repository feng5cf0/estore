/**
 *	Validator	验证类
 *	主要用方法:	valid、validate
 */
Validator = {
	/**
	 *	REQUIRE	判断是否为空
	 *	@param value 控件值
	 */
	REQUIRE : "this._require(value);",
	/**
	 *	REQUIRE	判断是否为空
	 *	@param value 控件值
	 */
	REQUIREB : "this._requireb(value,validItem[1],validItem[2]);",
	/**
	 *	EMAIL	Email地址
	 *	@param value 控件值
	 */
	EMAIL : "this._email(value);",
	/**
	 *	PHONE	电话号码
	 *	@param value 控件值
	 */
	PHONE : "this._phone(value);",
	/**
	 *	MOBILE	手机号码
	 *	@param value 控件值
	 */
	MOBILE : "this._mobile(value);",
	/**
	 *	URL	URL
	 *	@param value 控件值
	 */
	URL : "this._url(value);",
	/**
	 *	IDCARD	身份证号
	 *	@param value 控件值
	 */
	IDCARD : "this._idCard(value);",
	/**
	 *	CURRENCY	金额
	 *	@param value 控件值
	 */
	CURRENCY : "this._currency(value);",
	/**
	 *	NUMBER	正整数
	 *	@param value 控件值
	 */
	NUMBER : "this._number(value);",
	/**
	 *	ZIP	邮政编码
	 *	@param value 控件值
	 */
	ZIP : "this._zip(value);",
	/**
	 *	QQ	QQ号
	 *	@param value 控件值
	 */
	QQ : "this._qq(value);",
	/**
	 *	INTEGER	整数
	 *	@param value 控件值
	 */
	INTEGER : "this._integer(value);",
	/**
	 *	FLOAT	浮点数
	 *	@param value 控件值
	 */
	FLOAT : "this._float(value);",
	/**
	 *	ENGLISH	英文字母
	 *	@param value 控件值
	 */
	ENGLISH : "this._english(value);",
	/**
	 *	CHINESE	中文字
	 *	@param value 控件值
	 */
	CHINESE :  "this._chinese(value);",
	/**
	 *	USERNAME	用户名（英文字母或字母加数字）
	 *	@param value 控件值
	 */
	USERNAME : "this._username(value);",
	/**
	 *	SAFE	安全码（字母加数字加特殊符）用户密码验证
	 *	@param value 控件值
	 */
	SAFE : "this._safe(value);",
	/**
	 *	FILTER	文件类型
	 *	@param value 控件值
	 *	@param validItem[1] 类型列表（以逗号隔开）
	 */
	FILTER : "this._filter(value,validItem[1]);",
	/**
	 *	LIMIT	长度范围
	 *	@param value 控件值
	 *	@param validItem[1] 最小长度
	 *	@param validItem[2] 最大长度
	 */
	LIMIT : "this._limit(value.length,validItem[1],validItem[2]);",
	/**
	 *	LIMITB	字节长度范围
	 *	@param value 控件值
	 *	@param validItem[1] 最小长度
	 *	@param validItem[2] 最大长度
	 */
	LIMITB : "this._limit(this.LenB(value),validItem[1],validItem[2]);",
	/**
	 *	DATE	时间
	 *	@param value 控件值
	 *	@param validItem[1] 可为空 时间格式（ymd、dmy）默认为ymd（YYYY-MM-DD）
	 */
	DATE : "this._date(value,validItem[1]);",
	/**
	 *	DATELESS	时间先后验证（用于开始时间要早于结束时间）
	 *	@param value 控件值
	 *	@param validItem[1] 结束时间空件Id
	 *	@param validItem[2] 结束时间空件名称
	 */
	DATELESS : "this._dateless(value,validItem[1],validItem[2]);",
	/**
	 *	BEFORE	时间先后验证（用于早于某天）
	 *	@param value 控件值
	 *	@param validItem[1] 可为空 比较时间值 默认为今天
	 */
	BEFORE : "this._before(value,validItem[1]);",
	/**
	 *	INTWODATE	与另一个时间在两天内
	 *	@param value 控件值
	 *	@param validItem[1] 另一时间空件Id
	 *	@param validItem[2] 另一时间空件名称
	 */
	INTWODATE : "this._intwodate(value,validItem[1],validItem[2]);",
	/**
	 *	INMONTH	与另一个时间在一个月内
	 *	@param value 控件值
	 *	@param validItem[1] 另一时间空件Id
	 *	@param validItem[2] 另一时间空件名称
	 */
	INMONTH : "this._inmonth(value,validItem[1],validItem[2]);",
	/**
	 *	REPEAT	与另一个控件值相同
	 *	@param value 控件值
	 *	@param validItem[1] 另一空件Id
	 *	@param validItem[2] 另一空件名称
	 */
	REPEAT : "this._repeat(value,validItem[1],validItem[2]);",
	/**
	 *	RANGE	数值范围
	 *	@param value 控件值
	 *	@param validItem[1] 最小值
	 *	@param validItem[2] 最大值
	 */
	RANGE : "this._range(value,validItem[1],validItem[2]);",
	/**
	 *	COMPARE	数值比较
	 *	@param value 控件值
	 *	@param validItem[1] 比较类型（<,<=,>,>=,==,!=）
	 *	@param validItem[2] 比较值
	 */
	COMPARE : "this._compare(value,validItem[1],validItem[2]);",

	DATECOMPARE : "this._datecompare(value,validItem[1],validItem[2]);",
	CUSTOM : "this._exec(value,validItem[1]);",
	GROUP : "this.MustChecked(getAttribute('name'), getAttribute('min'), getAttribute('max'))",
	ErrorItem : [],
	ErrorMessage : ["以下原因导致提交失败：\t\t\t\t"],

	/**
	 *	valid	单个控件验证
	 *	@param valids 验证数组["验证控件id","验证控件label",["验证类型1","参数1","参数2"],["验证类型2","参数1","参数2"],,,]
	 *	@e.g.	["dataForm:id","编号",["Require"],["Number"],["Limit",4,8]]
	 */
	valid : function(valids){
		var valid = valids;
		if(!valid || !valid[0])	return false;
		var elem = document.getElementById(valid[0]);
		if(!elem)	return false;
		var value = (elem.value).trim();
		var label = valid[1];
		var mes = "";
		for(var j=2; j<valid.length; j++){
			var validItem = valid[j];
			var validType = validItem[0].toUpperCase();
			if(typeof(this[validType]) == "undefined")  continue;

			//require的处理
			if(j==2 && validType != "REQUIRE" && value=="")	break;
			if(j==2 && valid.length > 3 && validType == "REQUIRE" && value=="")	continue;

			var rezt = eval(this[validType]);
			if(rezt != null && rezt.length > 1){
				mes = mes + rezt;
			}
		}
		if(mes!="" && mes.length>1){
			//showMes(label+"，"+mes+"请重新输入！");
			alert(label+"，"+mes+"请重新输入！");
			elem.focus();
			return false;
		}
		return true;
	},
	/**
	 *	valid	多个控件验证
	 *	@param valids 验证数组 [[控件验证数组1],[控件验证数组2],,,,]	(控件验证数组:见valid说明)
	 */
	validate : function(valids){

		this.ErrorMessage.length = 1;
		this.ErrorItem.length = 0;

		for(var i=0; i < valids.length; i++){
			var valid = valids[i];
			if(!valid || !valid[0])	continue;
			var elem = document.getElementById(valid[0]);
			if(!elem)	continue;
			var value = (elem.value).trim();
			var label = valid[1];
			var mes = "";
			for(var j=2; j<valid.length; j++){
				var validItem = valid[j];
				var validType = validItem[0].toUpperCase();
				if(typeof(this[validType]) == "undefined")  continue;

				//require的处理
				if(j==2 && validType != "REQUIRE" && value=="")	break;
				if(j==2 && valid.length > 3 && validType == "REQUIRE" && value=="")	continue;

				var rezt = eval(this[validType]);
				if(rezt != null && rezt.length > 1){
					mes = mes + rezt;
				}
			}
			if(mes!="" && mes.length>1){
				this.AddError(elem, label+"，"+mes+"请重新输入！");
			}

		}
		if(this.ErrorMessage.length > 1){
			//showMes(this.ErrorMessage.join("\n"));
			alert(this.ErrorMessage.join("\n"));
			this.ErrorItem[0].focus();
			return false;
		}
		return true;
	},
	LenB : function(str){
		return str.replace(/[^\x00-\xff]/g,"**").length;
	},
	AddError : function(index, str){
		this.ErrorItem[this.ErrorItem.length] = index;
		this.ErrorMessage[this.ErrorMessage.length] = this.ErrorMessage.length + "：" + str;
	},
	_require : function(value){
		var reg = /.+/;
		if(!reg.test(value)){
			return "不能为空，";
		}else{
			return null;
		}
	},
	_requireb : function(value,min,max){
		var reg = /.+/;
		if(!reg.test(value)){
			return "不能为空，";
		}
		min = min || 0;
		max = max || Number.MAX_VALUE;
		if(min <= value.length && value.length <= max){
			return null;
		}else{
			return "长度必须在"+min+"到"+max+"之间，";
		}
	},
	_email : function(value){
		var reg = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
		if(!reg.test(value)){
			return "email格式错误，";
		}else{
			return null;
		}
	},
	_phone : function(value){
		var reg = /^((\(\d{2,3}\))|(\d{3}\-))?(\(0\d{2,3}\)|0\d{2,3}-)?[1-9]\d{6,7}(\-\d{1,4})?$/;
		if(!reg.test(value)){
			return "必须为电话号码，";
		}else{
			return null;
		}
	},
	_mobile : function(value){
		//var reg = /^((\(\d{2,3}\))|(\d{3}\-))?13\d{9}$/;
		var reg = /^((\(\d{3}\))|(\d{3}\-))?13[1234567890]\d{8}|15[1234567890]\d{8}$/;
		if(!reg.test(value)){
			return "必须为手机号码，";
		}else{
			return null;
		}
	},
	_url : function(value){
		var reg = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
		if(!reg.test(value)){
			return "必须为URL，";
		}else{
			return null;
		}
	},
	_currency : function(value){
		var reg = /^\d+(\.\d+)?$/;
		if(!reg.test(value)){
			return "必须为货币金额，";
		}else{
			return null;
		}
	},
	_number : function(value){
		var reg = /^[1-9]\d*$/;
		if(!reg.test(value)){
			return "必须为数字，";
		}else{
			return null;
		}
	},
	_zip : function(value){
		var reg = /^[1-9]\d{5}$/;
		if(!reg.test(value)){
			return "必须为邮政编码，";
		}else{
			return null;
		}
	},
	_qq : function(value){
		var reg = /^[1-9]\d{4,8}$/;
		if(!reg.test(value)){
			return "必须为QQ号码，";
		}else{
			return null;
		}
	},
	_integer : function(value){
		var reg = /^[-\+]?\d+$/;
		if(!reg.test(value)){
			return "必须为整数，";
		}else{
			return null;
		}
	},
	_float : function(value){
		var reg = /^[-\+]?\d+(\.\d+)?$/;
		if(!reg.test(value)){
			return "必须为数值，";
		}else{
			return null;
		}
	},
	_english : function(value){
		var reg = /^[A-Za-z]+$/;
		if(!reg.test(value)){
			return "必须为英文字母，";
		}else{
			return null;
		}
	},
	_chinese : function(value){
		var reg = /^[\u0391-\uFFE5]+$/;
		if(!reg.test(value)){
			return "必须为中文，";
		}else{
			return null;
		}
	},
	_username : function(value){
		var reg = /^[a-z]\w{3,}$/i;
		if(!reg.test(value)){
			return "必须为英文字母或英文字母加数字，";
		}else{
			return null;
		}
	},
	_safe : function(value){
		var reg = /^(([A-Z]*|[a-z]*|\d*|[-_\~!@#\$%\^&\*\.\(\)\[\]\{\}<>\?\\\/\'\"]*)|.{0,5})$|\s/;
		if(reg.test(value)){
			return "必须为字母加数字加特殊符，";
		}else{
			return null;
		}
	},
	_limit : function(len,min,max){
		min = min || 0;
		max = max || Number.MAX_VALUE;
		if(min <= len && len <= max){
			return null;
		}else{
			return "长度必须在"+min+"到"+max+"之间，";
		}
	},
	_filter : function(input, filter){
		var tst = new RegExp("^.+\.(?=EXT)(EXT)$".replace(/EXT/g, filter.split(/\s*,\s*/).join("|")), "gi").test(input);
		if(!tst){
			return "必须为"+filter+"文件，";
		}else{
			return null;
		}
	},
	_repeat : function(value,target,label){
		var elem = document.getElementById(target);
		if(value!=elem.value){
			return "必须与"+label+"相同，";
		}else{
			return null;
		}
	},
	_idCard : function(value){
		if(!this.IsIdCard(value)){
			return "必须为正确的身份证号，";
		}else{
			return null;
		}
	},
	IsIdCard : function(number){
		var date, Ai;
		var verify = "10x98765432";
		var Wi = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
		var area = ['','','','','','','','','','','','北京','天津','河北','山西','内蒙古','','','','','','辽宁','吉林','黑龙江','','','','','','','','上海','江苏','浙江','安微','福建','江西','山东','','','','河南','湖北','湖南','广东','广西','海南','','','','重庆','四川','贵州','云南','西藏','','','','','','','陕西','甘肃','青海','宁夏','新疆','','','','','','台湾','','','','','','','','','','香港','澳门','','','','','','','','','国外'];
		var re = number.match(/^(\d{2})\d{4}(((\d{2})(\d{2})(\d{2})(\d{3}))|((\d{4})(\d{2})(\d{2})(\d{3}[x\d])))$/i);
		if(re == null) return false;
		if(re[1] >= area.length || area[re[1]] == "") return false;
		if(re[2].length == 12){
			Ai = number.substr(0, 17);
			date = [re[9], re[10], re[11]].join("-");
		}
		else{
			Ai = number.substr(0, 6) + "19" + number.substr(6);
			date = ["19" + re[4], re[5], re[6]].join("-");
		}
		if(!this.IsDate(date, "ymd")) return false;
		var sum = 0;
		for(var i = 0;i<=16;i++){
			sum += Ai.charAt(i) * Wi[i];
		}
		Ai +=  verify.charAt(sum%11);
		return (number.length ==15 || number.length == 18 && number == Ai);
	},
	_compare : function(op1,operator,op2){
		var rzt = false;
		switch (operator) {
			case "!=":
				rzt = (op1 != op2);
			case ">":
				rzt = (op1 > op2);
			case ">=":
				rzt = (op1 >= op2);
			case "<":
				rzt = (op1 < op2);
			case "<=":
				rzt = (op1 <= op2);
			default:
				rzt = (op1 == op2);
		}
		if(!rzt){
			return "必须"+operator+""+op2+"，";
		}
	},
	MustChecked : function(name, min, max){
		var groups = document.getElementsByName(name);
		var hasChecked = 0;
		min = min || 1;
		max = max || groups.length;
		for(var i=groups.length-1;i>=0;i--)
			if(groups[i].checked) hasChecked++;
		return min <= hasChecked && hasChecked <= max;
	},
	_range : function(value,min,max){
		if( min > (value|0) || (value|0) > max ){
			return "必须在"+min+"~"+max+"之间，";
		}else{
			return null;
		}
	},
	_exec : function(op, reg){
		if(!(new RegExp(reg,"g").test(op))){
			return "不符合规则，";
		}else{
			return null;
		}
	},
	_date : function(value,format){
		var fmat = "ymd";
		if(format){
			fmat = format;
		}
		if(!this.IsDate(value,fmat)){
			if(fmat=="ymd")
				return "必须为日期类型(2006/01/01)，";
			else
				return "必须为日期类型(30/01/2006)，";
		}else{
			return null;
		}
	},
	_dateless : function(value,e,label){
		var elem = document.getElementById(e);
		var date1 = new Date(Date.parse(value));
		var date2 = new Date(Date.parse(elem.value));
		if(date1 > date2){
			return "必须小于等于"+label+"，";
		}else{
			return null;
		}
	},
	_before : function(value,date){
		var date1 = new Date(Date.parse(value));
		var date2 = new Date();
		if(date)
			date2 = new Date(Date.parse(date));
		if(date1 > date2){
			if(date)
				return "必须小于等于"+date+"，";
			else
				return "必须小于等于今天，";
		}else{
			return null;
		}
	},
	_intwodate : function(value,e,label){
		var elem = document.getElementById(e);
		var date1 = new Date(Date.parse(value));
		var date2 = new Date(Date.parse(elem.value));
		if(( date1.getFullYear() == date2.getFullYear() )&&( date1.getMonth() == date2.getMonth() )
			&&( date1.getDate()-date2.getDate()<=1 && date1.getDate()-date2.getDate()>=-1 )){
			return null;
		}else{
			return "必须小于等于"+label+"，";
		}
	},
	_inmonth : function(value,e,label){
		var elem = document.getElementById(e);
		var date1 = new Date(Date.parse(value));
		var date2 = new Date(Date.parse(elem.value));
		if(( date1.getFullYear() == date2.getFullYear() )&&( date1.getMonth() == date2.getMonth() )){
			return null;
		}else{
			return "必须与"+label+"在同一个月内，";
		}
	},
	IsDate : function(op, formatString){
		formatString = formatString || "ymd";
		var m, year, month, day;
		switch(formatString){
			case "ymd" :
				m = op.match(new RegExp("^((\\d{4})|(\\d{2}))([/])(\\d{1,2})\\4(\\d{1,2})$"));
				if(m == null ) return false;
				day = m[6];
				month = m[5]*1;
				year =  (m[2].length == 4) ? m[2] : GetFullYear(parseInt(m[3], 10));
				break;
			case "dmy" :
				m = op.match(new RegExp("^(\\d{1,2})([/])(\\d{1,2})\\2((\\d{4})|(\\d{2}))$"));
				if(m == null ) return false;
				day = m[1];
				month = m[3]*1;
				year = (m[5].length == 4) ? m[5] : GetFullYear(parseInt(m[6], 10));
				break;
			default :
				break;
		}
		if(!parseInt(month)) return false;
		month = month==0 ?12:month;
		var date = new Date(year, month-1, day);
	       return (typeof(date) == "object" && year == date.getFullYear() && month == (date.getMonth()+1) && day == date.getDate());
		function GetFullYear(y){return ((y<30 ? "20" : "19") + y)|0;}
	}
}