package com.estore.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
	public Date dateFormat(String birthday,String format){
		Date date = null;
    	SimpleDateFormat sdf=new SimpleDateFormat(format);//小写的mm表示的是分钟  
    	try {
    		 date=sdf.parse(birthday);
		} catch (java.text.ParseException e) {
			e.printStackTrace();
		}
    	return date;
	}
}
