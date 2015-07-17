 <!--

/**  
 * Calendar  
 * 可选择带时间或不带时间
 * 使用方法：
 * 需要将此js文件导入到页面底部</body>前
 * 无时间: onclick="calendar.show(this,null);"
 * 有时间:onclick="calendar.show(this,null,true);"
 * @param   beginYear           2012  
 * @param   endYear             2050  
 * @param   language            0(zh_cn)|1(en_us)|2(en_en)|3(zh_tw)|4(jp)  
 * @param   patternDelimiter    "-"  
 * @param   date2StringPattern  "yyyy-MM-dd"  
 * @param   string2DatePattern  "ymd"  
 * @version V20060401  
 * @version V20061217  
 * @version V20080809 add to google project  
 * @version V20081226 add language support for japanese   
 * @version V20090104 add fix some bugs in help.html  
                      use style.display replace the style.visibility  
                      some enhancements and changes  
 * @author  KimSoft (jinqinghua [at] gmail.com)  
 * NOTE!    you can use it free, but keep the copyright please  
 * IMPORTANT:you must include this script file inner html body elment   
 * @see http://code.google.com/p/kimsoft-jscalendar/  
 */  
function Calendar(beginYear, endYear, language, patternDelimiter, date2StringPattern, string2DatePattern,showTime) {   
    this.showTime=showTime;   
    this.beginYear = beginYear || 2012;   
    this.endYear   = endYear   || 2050;   
    this.language  = language  || 0;   
    this.patternDelimiter = patternDelimiter     || "-";   
    this.date2StringPattern = date2StringPattern || Calendar.language["date2StringPattern"][this.language];   
    this.string2DatePattern = string2DatePattern || Calendar.language["string2DatePattern"][this.language];   
       
    this.dateControl = null;   
    this.panel  = this.getElementById("__calendarPanel");   
    //this.iframe = window.frames["__calendarIframe"];   
    this.form   = null;   
       
    this.date = new Date();   
    this.year = this.date.getFullYear();   
    this.month = this.date.getMonth();   
    this.hour = this.date.getHours();   
    this.min = this.date.getMinutes();   
    this.second=this.date.getSeconds();   
  
    this.colors = 
        {
            "cur_word"      : "#FFFFFF", //当日日期文字颜色
            "cur_bg"        : "#00FF00", //当日日期单元格背影色
            "sun_word"      : "#FF0000", //星期天文字颜色
            "sat_word"      : "#0000FF", //星期六文字颜色
            "td_word_light" : "#333333", //单元格文字颜色
            "td_word_dark" : "#CCCCCC", //单元格文字暗色
            "td_bg_out"     : "#EFEFEF", //单元格背影色
            "td_bg_over"    : "#FFCC00", //单元格背影色
            "tr_word"       : "#FFFFFF", //日历头文字颜色
            "tr_bg"         : "#666666", //日历头背影色
            "input_border" : "#CCCCCC", //input控件的边框颜色
            "input_bg"      : "#EFEFEF",   //input控件的背影色
            "bg_cur_day":"#00CC33",
            "bg_over":"#EFEFEF",
			"bg_out":"#FFCC00"
        }
};   
  
/**
  * 日历类属性（语言包，可自由扩展） 
  */
Calendar.language = {   
    "year"   : ["年", "", "", "/u5e74","/u5e74"],   
    "months" : [   
                ["一月","二月","三月","四月","五月","六月","七月","八月","九月","十月","十一月","十二月"],   
                ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"],   
                ["JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC"],   
                ["/u4e00/u6708","/u4e8c/u6708","/u4e09/u6708","/u56db/u6708","/u4e94/u6708","/u516d/u6708","/u4e03/u6708","/u516b/u6708","/u4e5d/u6708","/u5341/u6708","/u5341/u4e00/u6708","/u5341/u4e8c/u6708"],   
                ["/u4e00/u6708","/u4e8c/u6708","/u4e09/u6708","/u56db/u6708","/u4e94/u6708","/u516d/u6708","/u4e03/u6708","/u516b/u6708","/u4e5d/u6708","/u5341/u6708","/u5341/u4e00/u6708","/u5341/u4e8c/u6708"]                  
                ],   
    "weeks"  : [["日","一","二","三","四","五","六"],   
                ["Sun","Mon","Tur","Wed","Thu","Fri","Sat"],   
                ["Sun","Mon","Tur","Wed","Thu","Fri","Sat"],   
                ["/u65e5","/u4e00","/u4e8c","/u4e09","/u56db","/u4e94","/u516d"],   
                ["/u65e5","/u6708","/u706b","/u6c34","/u6728","/u91d1","/u571f"],   
            ],   
    "clear"  : ["清空", "Clear", "Clear", "/u6e05/u7a7a", "/u524a/u9664"],   
    "today"  : ["今天", "Today", "Today", "/u4eca/u5929", "/u4eca/u65e5"],   
    "close"  : ["关闭", "Close", "Close", "/u95dc/u9589", "/u623b/u308b"],   
    "date2StringPattern" : ["yyyy-MM-dd", "yyyy-MM-dd", "yyyy-MM-dd", "yyyy-MM-dd", "yyyy-MM-dd"],   
    "string2DatePattern" : ["ymd","ymd", "ymd", "ymd", "ymd"]   
};   
  
Calendar.prototype.draw = function() {   
    calendar = this;   
       
    var _cs = [];   
    _cs[_cs.length] = '<form id="__calendarForm" name="__calendarForm" style="margin: 0px;" method="post">';   
    _cs[_cs.length] = '<table width="100%" border="0" cellpadding="3" cellspacing="1" align="center">';   
    _cs[_cs.length] = ' <tr>';   
    _cs[_cs.length] = '  <th align="left" width="1%"><input  style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:16px;height:20px;" name="goPrevMonthButton" type="button" id="goPrevMonthButton" value="&lt;" /></th>';   
    _cs[_cs.length] = '  <th align="center" width="98%" nowrap="nowrap"><select name="yearSelect" id="yearSelect" style="font-size:12px;"></select><select name="monthSelect" id="monthSelect" style="font-size:12px;"></select></th>';   
    _cs[_cs.length] = '  <th align="right" width="1%"><input  style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:16px;height:20px;" name="goNextMonthButton" type="button" id="goNextMonthButton" value="&gt;" /></th>';   
    _cs[_cs.length] = ' </tr>';   
    _cs[_cs.length] = ' </table>';   
    _cs[_cs.length] = ' <table id="__calendarTable" width="100%" style="border:0px solid #CCCCCC;background-color:#FFFFFF" border="0" cellpadding="3" cellspacing="1">';
    _cs[_cs.length] = ' <tr>';   
    for(var i = 0; i < 7; i++) {   
        _cs[_cs.length] = '<th style="font-weight:normal;background-color:' + calendar.colors["tr_bg"] + ';color:' + calendar.colors["tr_word"] + ';">';   
        _cs[_cs.length] = Calendar.language["weeks"][this.language][i];   
        _cs[_cs.length] = '<//th>';    
    }   
    _cs[_cs.length] = '<//tr>';   
    for(var i = 0; i < 6; i++){   
        _cs[_cs.length] = '<tr align="center">';   
        for(var j = 0; j < 7; j++) {   
            switch (j) {   
                case 0: _cs[_cs.length] = '<td style="cursor:default;color:' + calendar.colors["sun_word"] + ';"> </td>'; break;   
                case 6: _cs[_cs.length] = '<td style="cursor:default;color:' + calendar.colors["sat_word"] + ';"> </td>'; break;   
                default:_cs[_cs.length] = '<td style="cursor:default;"> </td>'; break;   
            }   
        }   
        _cs[_cs.length] = '<//tr>';   
    }   
    _cs[_cs.length] = ' <tr id="trTime" style="background-color:' + calendar.colors["input_bg"] + ';"><td colspan="5">';   
    _cs[_cs.length] = ' <select  id=ddlhour name=ddlhour></select>:<select id=ddlmin name=ddlmin></select>:<select id=ddlsec name=ddlsec></select>';   
    _cs[_cs.length] = ' </td><td colspan="2"><input type="button" name="okButton" id="okButton" value="确定" /></td>';   
    _cs[_cs.length] = ' </td></tr>';   
    _cs[_cs.length] = ' <tr style="background-color:' + calendar.colors["input_bg"] + ';">';   
    _cs[_cs.length] = '  <th colspan="2"><input type="button" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:100%;height:20px;font-size:12px;" name="clearButton" id="clearButton" /></th>';   
    _cs[_cs.length] = '  <th colspan="3"><input type="button" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:100%;height:20px;font-size:12px;" name="selectTodayButton" id="selectTodayButton" /></th>';   
    _cs[_cs.length] = '  <th colspan="2"><input type="button" style="border: 1px solid ' + calendar.colors["input_border"] + ';background-color:' + calendar.colors["input_bg"] + ';width:100%;height:20px;font-size:12px;" name="closeButton" id="closeButton" /></th>';   
    _cs[_cs.length] = ' </tr>';   
    _cs[_cs.length] = '</table>';   
    _cs[_cs.length] = '</form>';   
       
    this.panel.innerHTML = _cs.join("");   
    this.form = document.forms["__calendarForm"];   
    for(var i=0;i<=23;i++){   
        var n=(i<10)?"0"+i:i;   
        this.form.ddlhour.options[this.form.ddlhour.length] = new Option(n, i);   
    }   
    for(var i=0;i<=59;i++){   
        var n=(i<10)?"0"+i:i;   
        this.form.ddlmin.options[this.form.ddlmin.length] = new Option(n,i );   
        this.form.ddlsec.options[this.form.ddlsec.length] = new Option(n,i );   
    }   
    this.form.ddlsec.onchange=this.form.ddlhour.onchange=this.form.ddlmin.onchange=function(){   
        calendar.updateDate(calendar.date.getDate());   
    };   
       
    this.form.clearButton.value = Calendar.language["clear"][this.language];   
    this.form.selectTodayButton.value = Calendar.language["today"][this.language];   
    this.form.closeButton.value = Calendar.language["close"][this.language];   
       
    this.form.goPrevMonthButton.onclick = function () {calendar.goPrevMonth(this);}   
    this.form.goNextMonthButton.onclick = function () {calendar.goNextMonth(this);}   
    this.form.yearSelect.onchange = function () {calendar.update(this);}   
    this.form.monthSelect.onchange = function () {calendar.update(this);}   
       
    this.form.clearButton.onclick = function () {calendar.dateControl.value = "";calendar.hide();}   
    this.form.okButton.onclick=function(){ calendar.dateControl.value = calendar.date.format(calendar.date2StringPattern);calendar.hide();}   
    this.form.closeButton.onclick = function () {calendar.hide();}   
    this.form.selectTodayButton.onclick = function () {   
        var today = new Date();   
        calendar.date = today;   
        calendar.year = today.getFullYear();   
        calendar.month = today.getMonth();   
        calendar.hour = today.getHours();   
        calendar.min = today.getMinutes();   
        calendar.second=today.getSeconds();   
        calendar.dateControl.value = today.format(calendar.date2StringPattern);   
        calendar.hide();   
    }   
};   
  
//年份下拉框绑定数据
Calendar.prototype.bindYear = function() {   
    var ys = this.form.yearSelect;   
    ys.length = 0;   
    for (var i = this.beginYear; i <= this.endYear; i++){   
        ys.options[ys.length] = new Option(i + Calendar.language["year"][this.language], i);   
    }   
};   
 
//月份下拉框绑定数据 
Calendar.prototype.bindMonth = function() {   
    var ms = this.form.monthSelect;   
    ms.length = 0;   
    for (var i = 0; i < 12; i++){   
        ms.options[ms.length] = new Option(Calendar.language["months"][this.language][i], i);   
    }   
};   
  
//向前一月
Calendar.prototype.goPrevMonth = function(e){   
    if (this.year == this.beginYear && this.month == 0){return;}   
    this.month--;   
    if (this.month == -1) {   
        this.year--;   
        this.month = 11;   
    }   
    this.updateDate();   
    this.changeSelect();   
    this.bindData();   
};   
  
  
//向后一月
Calendar.prototype.goNextMonth = function(e){   
    if (this.year == this.endYear && this.month == 11){return;}   
    this.month++;   
    if (this.month == 12) {   
        this.year++;   
        this.month = 0;   
    }   
    this.updateDate();   
    this.changeSelect();   
    this.bindData();   
};   
 
//改变SELECT选中状态 
Calendar.prototype.changeSelect = function() {   
    var ys = this.form.yearSelect;   
    var ms = this.form.monthSelect;   
    for (var i= 0; i < ys.length; i++){   
        if (ys.options[i].value == this.date.getFullYear()){   
            ys[i].selected = true;   
            break;   
        }   
    }   
    for (var i= 0; i < ms.length; i++){   
        if (ms.options[i].value == this.date.getMonth()){   
            ms[i].selected = true;   
            break;   
        }   
    }   
};   
 
Calendar.prototype.updateDate = function (n){   
    if(!n)   
        n=1;   
    if(this.showTime){   
        var h=this.form.ddlhour;   
        this.hour=h.options[h.selectedIndex].value;   
        h=this.form.ddlmin;   
        this.min=h.options[h.selectedIndex].value;   
        h=this.form.ddlsec;   
        this.second=h.options[h.selectedIndex].value;   
        this.date = new Date(this.year, this.month, n,this.hour,this.min,this.second);   
    }   
    else  
        this.date = new Date(this.year, this.month, 1);   
};   

//更新年、月
Calendar.prototype.update = function (e){   
    this.year  = e.form.yearSelect.options[e.form.yearSelect.selectedIndex].value;   
    this.month = e.form.monthSelect.options[e.form.monthSelect.selectedIndex].value;       
    this.updateDate();   
    this.changeSelect();   
    this.bindData();   
};   

//绑定数据到月视图
Calendar.prototype.bindData = function () {   
    var calendar = this;   
    var dateArray = this.getMonthViewDateArray(this.date.getFullYear(), this.date.getMonth());   
    var tds = this.getElementById("__calendarTable").getElementsByTagName("td");   
    var trs = this.getElementById("__calendarTable").getElementsByTagName("tr");
    var panel=this.getElementById("__calendarPanel");   
    if(this.showTime){   
        //panel.style.height="226px";   
    }   
    else{   
        //panel.style.height="196px";   
        trs[7].style.display="none";   
    }   
    this.form.ddlhour.selectedIndex=this.hour;   
    this.form.ddlmin.selectedIndex=this.min;   
    this.form.ddlsec.selectedIndex=this.second;   
    for(var i = 0; i < tds.length-2; i++) {   
        tds[i].style.backgroundColor = calendar.colors["bg_over"];   
        tds[i].onclick = null;   
        tds[i].onmouseover = null;   
        tds[i].onmouseout = null;   
        tds[i].innerHTML = dateArray[i] || " ";           
        if (i > dateArray.length - 1) continue;   
        if (dateArray[i]){   
            tds[i].onclick = function () {   
                if (calendar.dateControl){     
                    var date=new Date(calendar.date.getFullYear(),   
                                        calendar.date.getMonth(),   
                                        this.innerHTML,   
                                        calendar.date.getHours(),calendar.date.getMinutes(),   
                                        calendar.date.getSeconds());   
                    calendar.dateControl.value = date.format(calendar.date2StringPattern);   
                }   
                calendar.hide();   
            }   
            tds[i].onmouseover = function () {this.style.backgroundColor = calendar.colors["bg_out"];}   
            tds[i].onmouseout  = function () {this.style.backgroundColor = calendar.colors["bg_over"];}   
            var today = new Date();   
            if (today.getFullYear() == calendar.date.getFullYear()) {   
                if (today.getMonth() == calendar.date.getMonth()) {   
                    if (today.getDate() == dateArray[i]) {   
                        tds[i].style.backgroundColor = calendar.colors["bg_cur_day"];   
                        tds[i].onmouseover = function () {this.style.backgroundColor = calendar.colors["bg_out"];}   
                        tds[i].onmouseout  = function () {this.style.backgroundColor = calendar.colors["bg_cur_day"];}   
                    }   
                }   
            }   
        }//end if   
    }//end for   
};   
 
//根据年、月得到月视图数据(数组形式) 
Calendar.prototype.getMonthViewDateArray = function (y, m) {   
    var dateArray = new Array(42);   
    var dayOfFirstDate = new Date(y, m, 1).getDay();   
    var dateCountOfMonth = new Date(y, m + 1, 0).getDate();   
    for (var i = 0; i < dateCountOfMonth; i++) {   
        dateArray[i + dayOfFirstDate] = i + 1;   
    }   
    return dateArray;   
};   
  
//显示日历
Calendar.prototype.show = function (dateControl, popuControl,showTime) {   
    this.showTime=(showTime);   
    if(this.showTime){   
        this.date2StringPattern="yyyy-MM-dd hh:mm:ss";   
        this.string2DatePattern="ymdhms";   
    }   
    else{   
            this.date2StringPattern="yyyy-MM-dd";   
    }   
    if (this.panel.style.display == "block") {   
        this.panel.style.display = "none";   
    }   
    if (!dateControl){   
        throw new Error("arguments[0] is necessary!")   
    }   
    this.dateControl = dateControl;   
    popuControl = popuControl || dateControl;   
  
    this.draw();   
    this.bindYear();   
    this.bindMonth();   
    if (dateControl.value.length > 0){   
        this.date  = new Date(dateControl.value.toDate(this.patternDelimiter, this.string2DatePattern));           
        this.year  = this.date.getFullYear();   
        this.month = this.date.getMonth();         
        this.hour = this.date.getHours();   
        this.min = this.date.getMinutes();   
        this.second = this.date.getSeconds();   
    }   
    this.changeSelect();   
    this.bindData();   
  
    var xy = this.getAbsPoint(popuControl);   
    this.panel.style.left = xy.x + "px";   
    this.panel.style.top = (xy.y + dateControl.offsetHeight) + "px";   
    this.panel.style.display = "block";   
};   
  
//隐藏日历
Calendar.prototype.hide = function() {   
    this.panel.style.display = "none";   
};   
 
//扩展 document.getElementById(id) 多浏览器兼容性 from meizz tree source 
Calendar.prototype.getElementById = function(id, object){   
    object = object || document;   
    return document.getElementById ? object.getElementById(id) : document.all(id);   
};   
  
//扩展 object.getElementsByTagName(tagName)
Calendar.prototype.getElementsByTagName = function(tagName, object){   
    object = object || document;   
    return document.getElementsByTagName ? object.getElementsByTagName(tagName) : document.all.tags(tagName);   
};   
  
//取得HTML控件绝对位置
Calendar.prototype.getAbsPoint = function (e){   
    var x = e.offsetLeft;   
    var y = e.offsetTop;   
    while(e = e.offsetParent){   
        x += e.offsetLeft;   
        y += e.offsetTop;   
    }   
    return {"x": x, "y": y};   
};   
  
/**  
 * 格式化日期
 * @param   d the delimiter  
 * @param   p the pattern of your date  
 * @author  meizz  
 * @author  kimsoft add w+ pattern  
 */  
Date.prototype.format = function(style) {   
    var o = {   
        "M+" : this.getMonth() + 1, //month   
        "d+" : this.getDate(),      //day   
        "h+" : this.getHours(),     //hour   
        "m+" : this.getMinutes(),   //minute   
        "s+" : this.getSeconds(),   //second   
        "w+" : "/u65e5/u4e00/u4e8c/u4e09/u56db/u4e94/u516d".charAt(this.getDay()),   //week   
        "q+" : Math.floor((this.getMonth() + 3) / 3),  //quarter   
        "S"  : this.getMilliseconds() //millisecond   
    }   
    if (/(y+)/.test(style)) {   
        style = style.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));   
    }   
    for(var k in o){   
        if (new RegExp("("+ k +")").test(style)){   
            style = style.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));   
        }   
    }   
    return style;   
};   
  
/**  
 * 返回日期
 * @param d the delimiter  
 * @param p the pattern of your date  
 * @rebuilder kimsoft  
 * @version build 2006.12.15  
 */  
String.prototype.toDate = function(delimiter, pattern) {   
    delimiter = delimiter || "-";   
    pattern = pattern || "ymd";   
    if(pattern=="ymd"){   
        var a = this.split(delimiter);   
        var y = parseInt(a[pattern.indexOf("y")], 10);   
        if(y.toString().length <= 2) y += 2000;   
        if(isNaN(y)) y = new Date().getFullYear();   
        var m = parseInt(a[pattern.indexOf("m")], 10) - 1;   
        var d = parseInt(a[pattern.indexOf("d")], 10);   
        if(isNaN(d)) d = 1;   
        return new Date(y, m, d);   
    }   
    //2001-01-01 01:02:03   
    var y=this.substr(0,4);   
    var m=this.substr(5,2);   
    var d=this.substr(8,2);   
    var h=this.substr(11,2);   
    var mm=this.substr(14,2);   
    var s=this.substr(17,2);   
    var date=new Date(y,m-1,d,h,mm,s);   
    return date;   
};   

/**
  *	在要显示日历的页面加上此方法
  */
function useCalendar(){
	var divs = [];   
	divs[divs.length] = '<div id="__calendarPanel" style="position:absolute;display:none;background-color:#FFFFFF;border:1px solid #666666;width:200px;">';   
	divs[divs.length] = '<iframe name="__calendarIframe" id="__calendarIframe" width="100%" height="100%" scrolling="no" frameborder="0" style="margin:0px;"></iframe>';   
	divs[divs.length] = '</div>';   
	document.write(divs.join(""));   
	  
	calendar = new Calendar(); 
}