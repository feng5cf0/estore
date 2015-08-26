package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Location extends BaseEntity {
	
	private String code;
	private String name;
	private String pcode;
	
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
}
