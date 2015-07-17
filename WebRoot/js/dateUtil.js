//格式化日期：yyyy-MM-dd      
function formatDatezx(date) {       
    var myyear = date.getFullYear();      
    var mymonth = date.getMonth()+1;      
    var myweekday = date.getDate();        
    if(mymonth < 10){      
        mymonth = "0" + mymonth;      
    }       
    if(myweekday < 10){      
        myweekday = "0" + myweekday;      
    }      
    return (myyear+"/"+mymonth + "/" + myweekday);       
}
//
function getXDatezx(year,weeks,weekDay){
	weekDay%=7;
	var date = new Date(year,"0","1");
	var time = date.getTime();
	weekDay==0 ? time+=weeks*7*24*3600000 : time+=(weeks-1)*7*24*3600000;//
	date.setTime(time);
	return getNextDatezx(date,weekDay);
}
function getNextDatezx(nowDate,weekDay){
	var day = nowDate.getDay();
	var time = nowDate.getTime();
	var sub = weekDay-day;
	time+=sub*24*3600000;
	nowDate.setTime(time);
	return nowDate;
}
//注意，其中的参数：第一个为年，第二个为第几周，第三个为周数，0为周日，1为周一；
//alert("1983第1周的星期46是:"+formatDatezx(getXDatezx(1983,46,1)) + "   1983第1周的星期日是:"+formatDatezx(getXDatezx(1983,46,0)));
//alert("1983第1周的星期日是:"+formatDate(getXDate(1983,46,0)));