package com.estore.util;




import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class DateJsonValueProcessor implements JsonValueProcessor {

	/**
	 * datePattern
	 */
	private static final String datePattern = "yyyy-MM-dd HH:mm:ss";

	/**
	 * JsonDateValueProcessor
	 */
	public DateJsonValueProcessor() {
		super();
	}

	 

	/**
	 * @param value
	 * @param jsonConfig
	 * @return Object
	 */
	public Object processArrayValue(Object value, JsonConfig jsonConfig) {
		return process(value);
	}

	/**
	 * @param key
	 * @param value
	 * @param jsonConfig
	 * @return Object
	 */
	public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
		return process(value);
	}

	/**
	 * process
	 * 
	 * @param value
	 * @return
	 */
	private Object process(Object value) {
		try {
			if (value instanceof Date) {
				SimpleDateFormat sdf = new SimpleDateFormat(datePattern, Locale.UK);
				return sdf.format((Date) value);
			}
			return value == null ? "" : value.toString();
		} catch (Exception e) {
			return "";
		}

	}
 
	public static Date getDate(String value){
		SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
		try {
			return  sdf.parse(value);
		} catch (ParseException e) { 
			e.printStackTrace();
			return null;
		}
	}

	
}