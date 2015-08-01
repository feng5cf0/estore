package com.estore.util;


import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;




public class JsonUtil {

       
    /**
	* @Title: getObjectArrayByJson 
	* @Description: TODO(将JOSN串分为数组）
	* @param @param jsonString
	* @param @return    设定文件 
	* @return Object[]    返回类型 
	* @author 码农
	* @throws
	 */
	public static Object[] getObjectArrayByJson(String jsonString){
        JSONArray jsonArray = JSONArray.fromObject(jsonString);
        return jsonArray.toArray();
    }
	
	/**
	 * 
	  
	 * getMap(JSON串转为MAP)    
	
	 * 创建人：码农    
	
	 * 创建时间：2012-6-8 下午01:48:23  
	
	 * @param   name    
	   
	 * @param  @return
	   
	 * @return String 
	   
	 * @Exception 异常对象
	 */
	public static Property getMapByJson(String otherPropertyJson) {
		Property map = new Property(); 
		if("".equals(otherPropertyJson)){
			return map;
		}
		JsonConfig config = new JsonConfig(); 
		JSONObject object = JSONObject.fromObject(otherPropertyJson,config);
	    Set  keys = object.keySet();
	    Iterator obj = keys.iterator();
		while(obj.hasNext()){
			String key =(String)obj.next(); 
			map.put(key,object.get(key));
		}
		return map;
	}
	
	/**
	 * 
	  
	 * getJsonStr(LIST转为JSON)    
	
	 * 创建人：码农    
	
	 * 创建时间：2012-6-8 下午01:48:57  
	
	 * @param   name    
	   
	 * @param  @return
	   
	 * @return String 
	   
	 * @Exception 异常对象
	 */
	public static String getJsonStrByList(List<Map>  list){
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
		JSONArray array = JSONArray.fromObject(list,config);
		return (array.toString());  
	}
	
	/**
	 * 
	  
	 * getJsonStr(对象转JSON)    
	
	 * 创建人：码农    
	
	 * 创建时间：2012-6-8 下午01:49:30  
	
	 * @param   name    
	   
	 * @param  @return
	   
	 * @return String 
	   
	 * @Exception 异常对象
	 */
	public static String getJsonStrByObj(Object obj){
		JSONObject object= new JSONObject();
		JSONObject.fromObject(obj);
		return object.toString();
	}
	
	
	/**
	 * 
	  
	 * getJsonStr(MAP转JOSN)    
	
	 * 创建人：码农    
	
	 * 创建时间：2012-6-8 下午01:49:56  
	
	 * @param   name    
	   
	 * @param  @return
	   
	 * @return String 
	   
	 * @Exception 异常对象
	 */
	public static String getJsonStrByMap(Map  map){
		JsonConfig config = new JsonConfig();
		config.registerJsonValueProcessor(Date.class, new DateJsonValueProcessor());
		JSONObject array = JSONObject.fromObject(map,config);
		return (array.toString());  
	}
    

	
	
    public static void main(String[] args){
        
    }
}