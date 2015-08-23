package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class AttributeValue extends BaseEntity {
	
	private Integer attributeId;
	private String attributeValue;
	private Attribute attribute;

	@Override
	public boolean equals(Object obj) {

		if(obj == null){
			return false;
		}else if(obj instanceof com.estore.entities.AttributeValue){
			AttributeValue attr = (AttributeValue)obj;
			if(this.id == attr.getId()){
				return true;
			}else{
				return false;
			}
		}else{
			return false;
		}
	}
	
	@Override
	public int hashCode() {

		return this.id;
	}
	
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
