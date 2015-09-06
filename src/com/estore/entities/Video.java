package com.estore.entities;

import java.util.Date;
import com.landicorp.core.entities.base.BaseEntity;

public class Video extends BaseEntity{

	/**
	 * 下载中心
	 * hzp
	 * 20150903
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String title;
	private String file;
	private String createUser;
	private Date createTime;
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	
	
}
