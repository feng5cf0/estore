package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class GoodsAttribute extends BaseEntity {

	private Integer goodsId;
	private Integer attributeValueId1;
	private Integer attributeValueId2;
	private Integer attribtueValueId3;
	private Float price;
	private Integer backAccount;
	private Integer frontAccount;
	
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
	public Integer getAttribtueValueId3() {
		return attribtueValueId3;
	}
	public void setAttribtueValueId3(Integer attribtueValueId3) {
		this.attribtueValueId3 = attribtueValueId3;
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
	
}
