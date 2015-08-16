package com.estore.email;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;

/**
 * 公共配置参数
 * @author dinglei
 *
 */
public class CommonConfig {
	
	private static final Logger log = Logger.getLogger(CommonConfig.class);
	
	/**
	 * 配置是否已经加载过
	 */
	public static boolean isConfigLoad = false;
	
	/**
	 * esb接口会话ID
	 */
	public static String ESB_INF_SESSIONID = "1234567890";
	
	/**
	 * 配置属性对象
	 */
	private static Properties properties = new Properties();
	
	/**
	 * 加载配置文件
	 */
	public static void loadConfig(String context){
		String fileName = null;
		if("".equals(context))
			fileName = "config.properties";
		else
			fileName = "config-"+context+".properties";
		
		if(isConfigLoad)
			return;
		InputStream in = null;
		try{
			String catalinaHome = new File("").getAbsolutePath();
			if(catalinaHome.indexOf("bin")==-1){
				//若指向了tomcat根目录，则自动加上bin
				//File.separator window上是/ linux是\
				catalinaHome = catalinaHome + File.separator +"bin";
			}
			File configFile = new File(catalinaHome + File.separator +fileName);
			if(!configFile.exists()){
				log.error("配置文件："+fileName+";不存在目录："+catalinaHome + File.separator +fileName);
			}
			in = new FileInputStream(configFile);
			properties.load(in);
			isConfigLoad = true;
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
		finally{
			if(in!=null){
				try{
					in.close();
				}catch(Exception ex){
					log.error(ex.getMessage());
					ex.printStackTrace();
				}
			}
		}
	}
	
	public static String getString(String propertiesKey){
		return properties.getProperty(propertiesKey, "");
	}
	
	public static boolean getBoolean(String propertiesKey){
		try{
			return Boolean.parseBoolean(properties.getProperty(propertiesKey, "false"));
		}catch(Exception e){
			return false;
		}
	}
	
	public static int getInt(String propertiesKey){
		try{
			return Integer.parseInt(properties.getProperty(propertiesKey, "0"));
		}catch(Exception e){
			return 0;
		}
	}
	
	public static float getFloat(String propertiesKey){
		try{
			return Float.parseFloat(properties.getProperty(propertiesKey, "0.0"));
		}catch(Exception e){
			return 0F;
		}
	}
	
	public static double getDouble(String propertiesKey){
		try{
			return Double.parseDouble(properties.getProperty(propertiesKey, "0.0"));
		}catch(Exception e){
			return 0L;
		}
	}

}
