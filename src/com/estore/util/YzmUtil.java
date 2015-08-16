package com.estore.util;


import org.apache.commons.collections.map.LRUMap;
import org.apache.commons.lang.StringUtils;

/**
 * 验证码
 *
 */
public class YzmUtil {

	private final static String YZM_KEY="xet_yzm_";
	private static LRUMap smsMap=new LRUMap(10000);
	
	/**
	 * 保存验证码
	 * @param request
	 * @param code
	 */
	public static void saveYzm(String yzm,String requestSessionId){
	    smsMap.put(YZM_KEY+requestSessionId, yzm);
	}
	
	/**
	 * 效验验证码
	 * @param request
	 * @param code
	 */
	public static boolean checkYzm(String yzm,String requestSessionId){
	    
		if(StringUtils.isNotBlank(yzm) && smsMap.containsKey(YZM_KEY+requestSessionId)&&smsMap.get(YZM_KEY+requestSessionId).toString().equals(yzm)){
            return true;
        }else{
            return false;
        }
	}
	
	
}
