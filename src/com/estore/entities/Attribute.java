package com.estore.entities;

import java.util.Set;

import com.landicorp.core.entities.base.BaseEntity;

public class Attribute extends BaseEntity {
	/**
	 * 属性名
	 */
	private String attributeName;
	
	private Set<AttributeValue> attributeValueSet;
	
	
	public Boolean isSame(Attribute attribute){
		if(attribute == null){
			return false;
		}else if(this.id != attribute.getId()){
			return false;
		}else{
			return true;
		}
	}
	
	
	
	@Override
	public boolean equals(Object obj) {
		
		if(obj == null){
			return false;
		}else if(obj instanceof com.estore.entities.Attribute){
			Attribute attr = (Attribute)obj;
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


    public String getAttributeName() {
		return attributeName;
	}
	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}
	public Set<AttributeValue> getAttributeValueSet() {
		return attributeValueSet;
	}
	public void setAttributeValueSet(Set<AttributeValue> attributeValueSet) {
		this.attributeValueSet = attributeValueSet;
	}
}
