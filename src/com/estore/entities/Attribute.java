package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Attribute extends BaseEntity {
	/**
	 * 属性名
	 */
	private String attributeName;
	
	public String getAttributeName() {
		return attributeName;
	}
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
	
}
