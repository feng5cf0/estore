package com.estore.util;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;

/**
 * 
* @ClassName: Property 
* @Description: TODO() 
* @author 码农
* @date 2012-6-1 上午10:37:35 
*
 */
@SuppressWarnings("serial")
public class Property extends HashMap {
	public Property() {
		super();
	}
 
	@SuppressWarnings("unchecked")
	public void setString(String key, String value) {
		super.put(key.toLowerCase(), value);
	}

	public String getAsString(String key) {
		Object obj = super.get(key.toLowerCase());
		if(obj==null) return "";
		return (String) obj;
	}

	@SuppressWarnings("unchecked")
	public void setStringArray(String key, String[] value) {
		super.put(key.toLowerCase(), value);
	}

	public String[] getAsStringArray(String key) { 
		Object obj = super.get(key.toLowerCase());
		if (obj == null)
			return null;
		String[] objArrayreturn = null;
		if (obj instanceof JSONArray) {
			Object[] objArray = ((JSONArray) obj).toArray();
			objArrayreturn = new String[objArray.length];
			for (int i = 0; i < objArray.length; i++) {
				objArrayreturn[i]  = String.valueOf(objArray[i]);
			}
		} else {
			objArrayreturn = (String[]) obj;
		}
		return objArrayreturn;
	}

	@SuppressWarnings("unchecked")
	public void setBoolean(String key, Boolean value) {
		super.put(key.toLowerCase(), value);
	}

	public Boolean getAsBoolean(String key) {
		Object value = super.get(key.toLowerCase());
		if(value==null)
			return null;
		return (Boolean)value;
	}

	@SuppressWarnings("unchecked")
	public void setBooleanArray(String key, Boolean[] value) {
		super.put(key.toLowerCase(), value);
	}

	public Boolean[] getAsBooleanArray(String key) {
		Object obj = super.get(key.toLowerCase());
		if (obj == null)
			return null;
		Boolean[] objArrayreturn = null;
		if (obj instanceof JSONArray) {
			Object[] objArray = ((JSONArray) obj).toArray();
			objArrayreturn = new Boolean[objArray.length];
			for (int i = 0; i < objArray.length; i++) {
				objArrayreturn[i]  = (Boolean) objArray[i];
			}
		} else {
			objArrayreturn = (Boolean[]) obj;
		}
		return objArrayreturn;
	}

	@SuppressWarnings("unchecked")
	public void setDate(String key, Date value) {
		super.put(key.toLowerCase(), value);
	}

	/**
	 * @param key
	 * @return
	 */
	public Date getAsDate(String key) {
		Object obj = super.get(key.toLowerCase());
		Date date = null;
		if (obj == null)
			return null;
		if (obj instanceof java.lang.String)
			date = DateJsonValueProcessor.getDate((String) obj);
		else if (obj instanceof java.util.Date)
			date = (Date) obj;
		return date;
	}

	@SuppressWarnings("unchecked")
	public void setDateArray(String key, Date[] value) {
		super.put(key.toLowerCase(), value);
	}

	/**
	 * @param key
	 * @return
	 */
	public Date[] getAsDateArray(String key) {
		Object obj = super.get(key.toLowerCase());
		if (obj == null)
			return null;
		Date[] objArrayreturn = null;
		if (obj instanceof JSONArray) {
			Object[] objArray = ((JSONArray) obj).toArray();
			objArrayreturn = new Date[objArray.length];
			for (int i = 0; i < objArray.length; i++) {
				objArrayreturn[i] = DateJsonValueProcessor.getDate((String) objArray[i]);
			}
		} else {
			objArrayreturn = (Date[]) obj;
		}
		return objArrayreturn;
	}

	@SuppressWarnings("unchecked")
	public void setInteger(String key, int value) {
		super.put(key.toLowerCase(), value);
	}

	public Integer getAsInteger(String key) {
		Object object =  super.get(key.toLowerCase());
		if(object==null)
			return null;
		return (Integer)object;
	}

	@SuppressWarnings("unchecked")
	public void setIntegerArray(String key, Integer[] value) {
		super.put(key.toLowerCase(), value);
	}

	public Integer[] getAsIntegerArray(String key) {
		Object obj = super.get(key.toLowerCase());
		if (obj == null)
			return null;
		Integer[] objArrayreturn = null;
		if (obj instanceof JSONArray) {
			Object[] objArray = ((JSONArray) obj).toArray();
			objArrayreturn = new Integer[objArray.length];
			for (int i = 0; i < objArray.length; i++) {
				objArrayreturn[i]  = (Integer) objArray[i];
			}
		} else {
			objArrayreturn = (Integer[]) obj;
		}
		return objArrayreturn;
	}

	@SuppressWarnings("unchecked")
	public void setDouble(String key, Double value) {
		super.put(key.toLowerCase(), value);
	}

	public Double getAsDouble(String key) {
		Object object= super.get(key.toLowerCase());
		if(object==null)
			return null;
		return (Double) object;
	}

	@SuppressWarnings("unchecked")
	public void setDoubleArray(String key, Double[] value) {
		super.put(key.toLowerCase(), value);
	}

	public Double[] getAsDoubleArray(String key) {
		Object obj = super.get(key.toLowerCase());
		if (obj == null)
			return null;
		Double[] objArrayreturn = null;
		if (obj instanceof JSONArray) {
			Object[] objArray = ((JSONArray) obj).toArray();
			objArrayreturn = new Double[objArray.length];
			for (int i = 0; i < objArray.length; i++) {
				objArrayreturn[i]  = Double.valueOf( String.valueOf(objArray[i]) );
			}
		} else {
			objArrayreturn = (Double[]) obj;
		}
		return objArrayreturn;
	}

	public Object getValue(String key){
		Object obj = super.get(key.toLowerCase());
		if (obj == null)
			return null;
		if (obj instanceof JSONArray) {
			Object[] objArray = ((JSONArray) obj).toArray();
			return objArray;
		} else {
			return obj;
		}
	}
	
	
	
	
	public static void main(String[] args) {
		Property p= new Property();
		p.setString("ccc", "33");
		p.setString("aaa", "11");
		p.setString("bbb", "22");
		
		Property p2= new Property();
		p2.setString("pp1", "2");
		Property p3= new Property();
		p3.setString("pp2", "3");
		List list = new ArrayList();
		list.add(p);
		list.add(p2);
		list.add(p3);
		Map map = new HashMap();
		map.put("root", list);
		
		System.out.println(JsonUtil.getJsonStrByList(list).toLowerCase());
	}
}
