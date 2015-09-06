package com.estore.action.front;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.aspectj.util.ConfigParser.ParseException;

import com.estore.entities.DownCenter;
import com.estore.service.IDownCenterService;
import com.opensymphony.xwork2.ActionSupport;

public class DownCenterAction extends ActionSupport {

	/**
	 * 下载中心
	 * hzp
	 * 20150904
	 */
	private static final long serialVersionUID = 1L;
	
    private File file;
    private String fileContentType; 
    private String fileFileName;
    private String temp; 
    private IDownCenterService downCenterService;
    private DownCenter downCenter;
    
    public String toupload(){
    	return "toupload";
    }
    
	/**
	 * 上传文件
	 * @return
	 * @throws IOException
	 */
	public String upload() throws IOException{
		
		String realPath = ServletActionContext.getServletContext().getRealPath("/downcenter");
    	String lj = realPath+"\\"+fileFileName;
    	String SavePath=fileFileName;
    	try{
	    	if(file != null){
	    		File savefile = new File(new File(realPath),fileFileName);
	    		if(!savefile.getParentFile().exists()){
	    			savefile.getParentFile().mkdirs();
	    		}
	    		FileUtils.copyFile(file, savefile);
	    	}else{
	    		SavePath=temp;
	    	}
    	}catch(IOException e){
    		e.printStackTrace();
    	}catch(ParseException e){
    		e.printStackTrace();
    	}
    	downCenter.setFile(SavePath);
    	downCenterService.upload(downCenter);
		return "main";
	}
	
	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getTemp() {
		return temp;
	}

	public void setTemp(String temp) {
		this.temp = temp;
	}

	public IDownCenterService getDownCenterService() {
		return downCenterService;
	}

	public void setDownCenterService(IDownCenterService downCenterService) {
		this.downCenterService = downCenterService;
	}

	public DownCenter getDownCenter() {
		return downCenter;
	}

	public void setDownCenter(DownCenter downCenter) {
		this.downCenter = downCenter;
	}
	
}
