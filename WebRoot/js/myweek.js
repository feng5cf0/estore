document
		.write("<div id='CalendarLayer' style='position: absolute; z-index: 9999; width: 180px; height: 216px; display: none;border:#C5D9E8 solid 1px'>");
document
		.write("<iframe name='CalendarIframe' scrolling='no' frameborder='0' width='100%' height='100%' style='background-color:white;'></iframe></div>");
function writeIframe() {
	var strIframe = "<html><head><meta http-equiv='Content-Type' content='text/html; charset=GBK'><style type='text/css'>"
			+ "*{font-size: 12px; font-family: 宋体}"
			+ ".weeklist{font-size:12px;line-height:24px;cursor:default;}"
			+ ".td_year{ font-family:'宋体'; font-size:12px; line-height:22px; cursor:default;}"
			+ ".but_bgcolor{background-color:#EEEEEE;font-family:'宋体'; font-size:12px; line-height:22px; cursor: pointer;}</style></head>"
			+ "<body onselectstart='return false' style='margin: 0px' oncontextmenu='return false'><form name='form_'>";
	strIframe += "<script language=javascript>"
			+ "function document.onkeydown(){ switch(window.event.keyCode){  case 27 : parent.hiddenCalendar(); break;"
			+ "case 37 : parent.prevY(); break; case 38 : parent.weekPageUp(); break; case 39 : parent.nextY(); break; case 40 : parent.weekPageDown(); break;"
			+ "case 84 : parent.returnthisweek(); break;case 78 : parent.returnNextWeek(); break;} window.event.keyCode = 0; window.event.returnValue= false;}"
			+ "</script>";

	strIframe += "<select name='tmpYearSelect'  onblur='parent.hiddenSelect(this)' style='z-index:1;position:absolute;top:3;left:63;display:none'"
			+ " onchange='parent.WebCalendar.thisYear =this.value; parent.hiddenSelect(this); parent.writeCalendar();'></select>";

	strIframe += "<table id='top_t' width='100%' border='0' cellspacing='1' cellpadding='0'><tr align='center'>"
			+ "<td width='40' class='but_bgcolor' onMouseOver=\"this.style.backgroundColor='#76D7DC'\" onMouseOut=\"this.style.backgroundColor=''\" title='向前翻 1 年&#13;快捷键：←'  onclick='parent.prevY()'><img src='../images/week/left.gif' width='5' height='9'></td>"
			+ "<td class='td_year' onMouseOver=\"this.style.backgroundColor='#EEEEEE'\" onMouseOut=\"this.style.backgroundColor=''\" id='yearHead' title='点击此处选择年份' onclick='parent.funYearSelect(parseInt(this.innerText, 10))'>&nbsp;</td>"
			+ "<td width='40' onMouseOver=\"this.style.backgroundColor='#76D7DC'\" onMouseOut=\"this.style.backgroundColor=''\" class='but_bgcolor' title='向后翻 1 年&#13;快捷键：→' onclick='parent.nextY()'><img src='../images/week/right.gif' width='5' height='9'></td></tr></table>";
	strIframe += "<table id='main_t' width='100%' border='0' cellspacing='0' cellpadding='0'> "
			+ "<tr><td align='center' height='12' bgcolor='#BDEBEE' id='weekli8' title='向上翻&#13;快捷键：↑'><img src='../images/week/up.gif' width='9' height='5'></td></tr>";
	for ( var x = 0; x < 6; x++) {
		strIframe += "<tr><td class='weeklist' id='weekli" + x
				+ "'>&nbsp;</td></tr>"
	}
	strIframe += "<tr><td align='center' height='12' bgcolor='#BDEBEE' id='weekli7' title='向下翻&#13;快捷键：↓'><img src='../images/week/down.gif' width='9' height='5'></td></tr></table>";
	strIframe += "<table id='bottom_t' width='100%' border='0' cellspacing='1' cellpadding='0' align='center'><tr align='center'>"
			+ "<td class='but_bgcolor' title='下一周&#13;快捷键：N' onClick='parent.returnNextWeek();' onMouseOver=\"this.style.backgroundColor='#76D7DC'\" onMouseOut=\"this.style.backgroundColor=''\" width='60' id='upweek'>下一周</td><td class='but_bgcolor' title='本  周&#13;快捷键：T' onClick=\"parent.returnthisweek()\" onMouseOver=\"this.style.backgroundColor='#76D7DC'\" onMouseOut=\"this.style.backgroundColor=''\" id='thisweek'>本周</td>"
			+ "<td class='but_bgcolor' title='关 闭&#13;快捷键：Esc' onMouseOver=\"this.style.backgroundColor='#76D7DC'\" onMouseOut=\"this.style.backgroundColor=''\" id='wclose' width='60' onclick='parent.hiddenCalendar()'>关闭</td></tr></table></form></body></html>";
	with (WebCalendar.iframe) {
		document.writeln(strIframe);
		document.close();

		for ( var i = 0; i < 6; i++) {
			WebCalendar.weekObj[i] = eval("weekli" + i);
			WebCalendar.weekObj[i].onmouseover = weekMouseOver;
			WebCalendar.weekObj[i].onmouseout = weekMouseOut;
			WebCalendar.weekObj[i].onclick = returnDate;
		}
		//向下翻
		WebCalendar.weekObj[7] = eval("weekli7");
		WebCalendar.weekObj[7].onmouseover = weekMouseOver;
		WebCalendar.weekObj[7].onmouseout = weekMouseOut;
		WebCalendar.weekObj[7].onclick = weekPageDown;
		//向上翻
		WebCalendar.weekObj[8] = eval("weekli8");
		WebCalendar.weekObj[8].onmouseover = weekMouseOver;
		WebCalendar.weekObj[8].onmouseout = weekMouseOut;
		WebCalendar.weekObj[8].onclick = weekPageUp;
	}
}

function WebCalendar() // 初始化日历的设置
{
	this.regInfo = "关闭的快捷键：[Esc]";
	this.daysMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
	this.weekObj = new Array(8); // 定义日期展示控件数组
	this.weekArray = new Array(); //定义周数组
	this.objExport = null; // 日历回传的显示控件
	this.objHidExport = null; // 日历回传的隐藏控件
	this.eventSrc = null; // 日历显示的触发控件
	this.weeknum = null; // 当前的周数
	this.weekcount = null; //周总数 
	this.thisYear = new Date().getFullYear(); // 定义年的变量的初始值
	this.thisMonth = new Date().getMonth(); // 定义月的变量的初始值
	this.thisDay = new Date().getDate(); // 定义日的变量的初始值
	this.today = new Date(parseInt(this.thisYear), parseInt(this.thisMonth),
			parseInt(this.thisDay), 0, 0, 0, 0); // 今天(d/m/yyyy)
	this.iframe = window.frames["CalendarIframe"]; // 日历的 iframe 载体
	this.calendar = getObjectById("CalendarLayer"); // 日历的层

	this.yearFall = 20; // 定义年下拉框的年差值
	this.weekshow_beginNum = null; //显示列表开始周数
	this.weekshow_endNum = null; //显示列表结束周数

	this.weekColor = "#DAFFFF"; //今天在周历上的标示背景色
}
var WebCalendar = new WebCalendar();
function calendar() // 主调函数
{

	var e = window.event.srcElement;

	writeIframe();
	var o = WebCalendar.calendar.style;
	WebCalendar.eventSrc = e;

	WebCalendar.objExport = e;

	//WebCalendar.objHidExport = eval(arguments[0]);

	var t = e.offsetTop, h = e.clientHeight, l = e.offsetLeft, p = e.type;
	//alert(e.offsetTop + " " + e.clientHeight + " " + e.offsetLeft + "  "	+ e.type);
	while (e = e.offsetParent) {
		t += e.offsetTop;
		l += e.offsetLeft;
	}
	o.display = "";
	WebCalendar.iframe.document.body.focus();
	var cw = WebCalendar.calendar.clientWidth, ch = WebCalendar.calendar.clientHeight;
	var dw = document.body.clientWidth, dl = document.body.scrollLeft, dt = document.body.scrollTop;

	if (document.body.clientHeight + dt - t - h >= ch)
		o.top = (p == "image") ? t + h : t + h + 6;
	else
		o.top = (t - dt < ch) ? ((p == "image") ? t + h : t + h + 6) : t - ch;
	if (dw + dl - l >= cw)
		o.left = l;
	else
		o.left = (dw >= cw) ? dw - cw + dl : dl;
	writeCalendar();
}

function GetNextNumDate(nowDate_, num_) {
	var y_ = nowDate_.getFullYear();
	var m_ = nowDate_.getMonth();
	var d_ = nowDate_.getDate();

	var ry_, rm_, rd_; //返回结果的年月日
	var num = num_ + d_;
	ry_ = y_, rm_ = m_;
	rd_ = d_;
	if (num > WebCalendar.daysMonth[m_]) {
		if ((m_ + 1) > 11) { //当月份大于11时
			rm_ = m_ + 1 - 12;
			ry_ = y_ + 1;
		} else {
			rm_ = m_ + 1;
		}
		rd_ = num - WebCalendar.daysMonth[m_];
	} else {
		//当日期推移的日期未超过本月时
		rd_ = num_ + d_;
	}

	return new Date(parseInt(ry_), parseInt(rm_), parseInt(rd_), 0, 0, 0);

}

function clearinnerText(obj) {
	obj.innerText = '';
}
function prevY() {
	WebCalendar.thisDay = 1;
	WebCalendar.thisYear--;
	writeCalendar();
}// 往前翻 Year
function nextY() {
	WebCalendar.thisDay = 1;
	WebCalendar.thisYear++;
	writeCalendar();
}// 往后翻 Year
function hiddenSelect(e) {
	for ( var i = e.options.length; i > -1; i--)
		e.options.remove(i);
	e.style.display = "none";
}
function getObjectById(id) {
	if (document.all)
		return (eval("document.all." + id));
	return (eval(id));
}
function hiddenCalendar() {
	getObjectById("CalendarLayer").style.display = "none";
};
function appendZero(n) {
	return (("00" + n).substr(("00" + n).length - 2));
}// 日期自动补零程序
// String.prototype.trim(){return this.replace(/(^\s*)|(\s*$)/g,"");}

function funYearSelect() // 年份的下拉框
{
	var n = WebCalendar.yearFall;
	var e = WebCalendar.iframe.document.forms[0].tmpYearSelect;
	var y = isNaN(parseInt(WebCalendar.thisYear, 10)) ? new Date()
			.getFullYear() : parseInt(WebCalendar.thisYear);
	y = (y <= 1000) ? 1000 : ((y >= 9999) ? 9999 : y);
	var min = (y - n >= 1000) ? y - n : 1000;
	var max = (y + n <= 9999) ? y + n : 9999;
	min = (max == 9999) ? max - n * 2 : min;
	max = (min == 1000) ? min + n * 2 : max;
	for ( var i = min; i <= max; i++)
		e.options.add(new Option(i + "年", i));
	e.style.display = "";
	e.value = y;
	e.focus();
}
function returnNextWeek() {
	if (WebCalendar.weeknum == 52)
		return;
	if (WebCalendar.objExport) {
		var returnValue, returnShowValue;
		returnShowValue = WebCalendar.weekArray[WebCalendar.weeknum].toString();
		returnValue = returnShowValue.substr(1, 2);

		//	WebCalendar.objHidExport.value = returnValue;
		WebCalendar.objExport.value = returnShowValue;
		hiddenCalendar();
	}
}
function returnthisweek() {

	if (WebCalendar.objExport) {
		var returnValue, returnShowValue;
		returnShowValue = WebCalendar.weekArray[WebCalendar.weeknum - 1]
				.toString();
		returnValue = returnShowValue.substr(1, 2);

		//WebCalendar.objHidExport.value = returnValue;
		WebCalendar.objExport.value = returnShowValue;
		hiddenCalendar();
	}
}
function weekMouseOver() {
	this.style.backgroundColor = "#DAF3F5";

}
function weekMouseOut() {
	this.style.backgroundColor = '';
}

function returnDate() // 根据日期格式等返回用户选定的日期
{
	if (WebCalendar.objExport) {
		var returnValue, returnShowValue;
		returnShowValue = this.innerText.toString();
		returnValue = returnShowValue.substr(1, 2);

		//WebCalendar.objHidExport.value = returnValue;
		WebCalendar.objExport.value = returnShowValue;
		hiddenCalendar();
	}
}
function writeCalendar() //对日历显示的数据的处理程序
{
	var yearFirstDate, yearFirstWeekDay, yearDayCount;
	var weekStartDate, weekEndDate;
	var y = WebCalendar.thisYear;
	var m = WebCalendar.thisMonth;
	var d = WebCalendar.thisDay;
	//alert(y +"  "+ m+"   "+d);
	if (!(y <= 9999 && y >= 1000 && parseInt(m, 10) > 0 && parseInt(m, 10) < 13 && parseInt(
			d, 10) > 0)) {
		alert("对不起，你输入了错误的日期！");
		WebCalendar.thisYear = new Date().getFullYear();
		WebCalendar.thisMonth = new Date().getMonth() + 1;
		WebCalendar.thisDay = new Date().getDate();
		y = WebCalendar.thisYear;
		m = WebCalendar.thisMonth;
		d = WebCalendar.thisDay;

	}
	WebCalendar.daysMonth[1] = (0 == y % 4 && (y % 100 != 0 || y % 400 == 0)) ? 29
			: 28;//闰年二月为29天
	WebCalendar.iframe.yearHead.innerText = y + " 年";

	if (WebCalendar.daysMonth[1] == 28)// 获取一年的天数
		yearDayCount = 365
	else
		yearDayCount = 366
	yearFirstDate = new Date(parseInt(WebCalendar.thisYear), 0, 1, 0, 0, 0, 0)// 获取一年的第一天
	yearFirstWeekDay = yearFirstDate.getDay()// 获取第一天为星期几

	WebCalendar.weekcount = 1;
	WebCalendar.weeknum = 0;
	var n = 0;
	while (n < yearDayCount) {
		//考虑第一周各种情况
		if (WebCalendar.weekcount == 1) {
			if (yearFirstWeekDay == 0 || yearFirstWeekDay > 4) {
				if (yearFirstWeekDay == 0) { //当为星期天时
					weekStartDate = GetNextNumDate(yearFirstDate, 1);
					n = n + 7;
				} else {//当为星期五或星期六时
					weekStartDate = GetNextNumDate(yearFirstDate,
							8 - yearFirstWeekDay);
					n = n + 7 - yearFirstWeekDay;
				}
			} else {//当为星期一至星期四时
				weekStartDate = GetNextNumDate(yearFirstDate,
						-(yearFirstWeekDay - 1));
				n = n + (7 - yearFirstWeekDay);
			}
		} else {
			weekStartDate = GetNextNumDate(weekEndDate, 1);
			n = n + 7;
		}

		weekEndDate = GetNextNumDate(weekStartDate, 6);

		//	alert("n="+n+"  yearDayCount="+yearDayCount+"  weekcount="+WebCalendar.weekcount);

		//获得当前周数
		if ((weekStartDate <= WebCalendar.today)
				&& (weekEndDate >= WebCalendar.today)) {
			WebCalendar.weeknum = WebCalendar.weekcount;
		}

		//考虑最后一周时，判断是否超过4天
		if (n - yearDayCount >= 4) {
			break;
		}

		var startm = parseInt(weekStartDate.getMonth()) + 1;
		var start_m = startm >= 10 ? startm : "0" + startm;
		var start_d = weekStartDate.getDate() >= 10 ? weekStartDate.getDate()
				: "0" + weekStartDate.getDate();
		var endm = parseInt(weekEndDate.getMonth()) + 1;
		var end_m = endm >= 10 ? endm : "0" + endm;
		var end_d = weekEndDate.getDate() >= 10 ? weekEndDate.getDate() : "0"
				+ weekEndDate.getDate();
		var w = WebCalendar.weekcount >= 10 ? WebCalendar.weekcount : "0"
				+ WebCalendar.weekcount;
		WebCalendar.weekArray[WebCalendar.weekcount - 1] = w + "周("
				+ weekStartDate.getFullYear() + "-" + start_m + "-" + start_d
				+ "至" + weekEndDate.getFullYear() + "-" + end_m + "-" + end_d
				+ ")";

		if (n >= yearDayCount) {

			break;
		}
		WebCalendar.weekcount++;
	}
	//alert(WebCalendar.weekArray);
	//显示周数
	if (WebCalendar.weeknum <= 6) {
		for ( var a = 0; a < 6; a++) {
			WebCalendar.weekObj[a].innerText = WebCalendar.weekArray[a];
			if (a == WebCalendar.weeknum - 1) {
				WebCalendar.weekObj[a].bgColor = WebCalendar.weekColor;
			} else {
				WebCalendar.weekObj[a].bgColor = '';
			}
		}
		WebCalendar.weekshow_beginNum = 1;
		WebCalendar.weekshow_endNum = 6;
		WebCalendar.weekObj[7].title = "向下翻 快捷键：↓";

	} else if (WebCalendar.weeknum == WebCalendar.weekcount) {
		for ( var a = WebCalendar.weekcount - 6, b = 0; b < 6; a++, b++) {
			WebCalendar.weekObj[b].innerText = WebCalendar.weekArray[a];
			if (a == WebCalendar.weeknum - 1) {
				WebCalendar.weekObj[b].bgColor = WebCalendar.weekColor;
			} else {
				WebCalendar.weekObj[b].bgColor = '';
			}
		}
		WebCalendar.weekshow_beginNum = WebCalendar.weekcount - 6 + 1;
		WebCalendar.weekshow_endNum = WebCalendar.weekcount;
		WebCalendar.weekObj[8].title = "向上翻 快捷键：↑";
	} else {
		for ( var a = WebCalendar.weeknum - 5, b = 0; b < 6; a++, b++) {
			WebCalendar.weekObj[b].innerText = WebCalendar.weekArray[a];
			if (a == WebCalendar.weeknum - 1) {
				WebCalendar.weekObj[b].bgColor = WebCalendar.weekColor;
			} else {
				WebCalendar.weekObj[b].bgColor = '';
			}
		}
		WebCalendar.weekshow_beginNum = WebCalendar.weeknum - 4;
		WebCalendar.weekshow_endNum = WebCalendar.weeknum + 1;

		WebCalendar.weekObj[7].title = "向下翻 快捷键：↓";
		WebCalendar.weekObj[8].title = "向上翻 快捷键：↑";
	}
}
//向上翻
function weekPageUp() {
	var num = WebCalendar.weekshow_beginNum;

	if (WebCalendar.weekshow_beginNum == 1) {
		return;
	}

	if (num - 6 < 1) { //当第一页
		for ( var a = num, b = 0; b < 6; a--, b++) {
			if (b > a) {
				WebCalendar.weekObj[b].innerText = ' ';
				WebCalendar.weekObj[b].onclick = function() {
					return false;
				};
			} else {
				WebCalendar.weekObj[b].innerText = WebCalendar.weekArray[b];
			}
			WebCalendar.weekObj[b].bgColor = "";
		}
		WebCalendar.weekshow_beginNum = 1;
		WebCalendar.weekshow_endNum = num - 1;
	} else {
		for ( var a = num - 6 - 1, b = 0; b < 6; a++, b++) {
			WebCalendar.weekObj[b].innerText = WebCalendar.weekArray[a];
			WebCalendar.weekObj[b].bgColor = "";
		}
		WebCalendar.weekshow_beginNum = num - 6;
		WebCalendar.weekshow_endNum = num - 1;
	}
}
//周数向下翻
function weekPageDown() {
	var num = WebCalendar.weekshow_endNum;

	if (num == WebCalendar.weekcount) {
		return;
	}
	if (num + 6 > WebCalendar.weekcount) { //当最后一页
		for ( var a = num, b = 0; b < 6; a++, b++) {
			if (a >= WebCalendar.weekcount) {
				WebCalendar.weekObj[b].innerText = ' ';
				WebCalendar.weekObj[b].onclick = function() {
					return false;
				};
			} else {
				WebCalendar.weekObj[b].innerText = WebCalendar.weekArray[a];
			}
			WebCalendar.weekObj[b].bgColor = "";

		}
		WebCalendar.weekshow_beginNum = num + 1;
		WebCalendar.weekshow_endNum = WebCalendar.weekcount;
	} else {
		for ( var a = num, b = 0; b < 6; a++, b++) {
			WebCalendar.weekObj[b].innerText = WebCalendar.weekArray[a];
			WebCalendar.weekObj[b].bgColor = "";

		}
		WebCalendar.weekshow_beginNum = num + 1;
		WebCalendar.weekshow_endNum = num + 6;
	}
};

document.onclick = function() {
	if (WebCalendar.eventSrc != window.event.srcElement) {
		hiddenCalendar();
	}
}
