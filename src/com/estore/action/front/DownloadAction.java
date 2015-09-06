package com.estore.action.front;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;

import org.aopalliance.intercept.Invocation;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.util.InvocationSessionStore;

import com.landicorp.core.action.BaseActionSupport;
import com.opensymphony.xwork2.ActionInvocation;

public class DownloadAction extends BaseActionSupport {

	/**
	 * hzp
	 * 20150905
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fileName;
	
	 public InputStream getInputStream() throws Exception {   
		 String filename=this.fileName;
		 InputStream inputStream =ServletActionContext.getServletContext().getResourceAsStream("downcenter/" + fileName);
		 this.fileName = new String(filename.getBytes(), "ISO8859-1");        
		 return inputStream;
	 }
	public String execute(){
		return SUCCESS;
	}

	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) throws UnsupportedEncodingException {
		this.fileName =new String(fileName.getBytes("ISO8859-1"), "utf-8");
	}
	

}
