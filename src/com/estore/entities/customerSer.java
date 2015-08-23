package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class customerSer extends BaseEntity{

	/**2015 08 16
	 * hzp
	 * 客服entities
	 */
	private static final long serialVersionUID = 1L;
	private String name;
	private String qqCode;
	private Date createTime;
	private String createUser;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getQqCode() {
		return qqCode;
	}
	public void setQqCode(String qqCode) {
		this.qqCode = qqCode;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	
}
