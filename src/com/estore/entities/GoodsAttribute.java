package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class GoodsAttribute extends BaseEntity {

	private Integer goodsId;
	private Integer attributeValueId1;
	private Integer attributeValueId2;
	private Integer attributeValueId3;
	private Float price;
	private Integer backAccount;
	private Integer frontAccount;
	
	private AttributeValue attributeValue1;
	private AttributeValue attributeValue2;
	private AttributeValue attributeValue3;
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getAttributeValueId1() {
		return attributeValueId1;
	}
	public void setAttributeValueId1(Integer attributeValueId1) {
		this.attributeValueId1 = attributeValueId1;
	}
	public Integer getAttributeValueId2() {
		return attributeValueId2;
	}
	public void setAttributeValueId2(Integer attributeValueId2) {
		this.attributeValueId2 = attributeValueId2;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getBackAccount() {
		return backAccount;
	}
	public void setBackAccount(Integer backAccount) {
		this.backAccount = backAccount;
	}
	public Integer getFrontAccount() {
		return frontAccount;
	}
	public void setFrontAccount(Integer frontAccount) {
		this.frontAccount = frontAccount;
	}
	public AttributeValue getAttributeValue1() {
		return attributeValue1;
	}
	public void setAttributeValue1(AttributeValue attributeValue1) {
		this.attributeValue1 = attributeValue1;
	}
	public AttributeValue getAttributeValue2() {
		return attributeValue2;
	}
	public void setAttributeValue2(AttributeValue attributeValue2) {
		this.attributeValue2 = attributeValue2;
	}
	public AttributeValue getAttributeValue3() {
		return attributeValue3;
	}
	public void setAttributeValue3(AttributeValue attributeValue3) {
		this.attributeValue3 = attributeValue3;
	}
	public Integer getAttributeValueId3() {
		return attributeValueId3;
	}
	public void setAttributeValueId3(Integer attributeValueId3) {
		this.attributeValueId3 = attributeValueId3;
	}
	
}
