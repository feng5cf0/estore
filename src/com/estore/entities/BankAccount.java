package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class BankAccount extends BaseEntity{

	/**
	 * 2015-08-12
	 * hzp
	 */
	private static final long serialVersionUID = 1L;
	private String createUser;//创建人
	private String content;//富文本内容
	private Date createTime;//创建时间
	
	
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
	
}
