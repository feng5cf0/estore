package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class AttributeValue extends BaseEntity {
	
	private Integer attributeId;
	private String attributeValue;
	private Attribute attribute;

	public Integer getAttributeId() {
		return attributeId;
	}
	public void setAttributeId(Integer attributeId) {
		this.attributeId = attributeId;
	}
	public String getAttributeValue() {
		return attributeValue;
	}
	public void setAttributeValue(String attributeValue) {
		this.attributeValue = attributeValue;
	}
	public Attribute getAttribute() {
		return attribute;
	}
	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}
	
}
