package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Attribute extends BaseEntity {
	/**
	 * 属性名
	 */
	private String attributeName;
	/**
	 * 属性值
	 */
	private String attributeValue;
	
	public String getAttributeName() {
		return attributeName;
	}
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
	public String getAttributeValue() {
		return attributeValue;
	}
	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}
	
}
