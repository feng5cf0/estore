package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Goods extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String goodsName;
	private String goodsDescription;
	private Integer categoryId;
	private Integer isAvaliable;
	private String picture;
	private String goodsUrl;
	private Float goodsPrice;
	private Integer backAccount;
	private Integer frontAccount;
	
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getGoodsDescription() {
		return goodsDescription;
	}
	public void setGoodsDescription(String goodsDescription) {
		this.goodsDescription = goodsDescription;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Integer getIsAvaliable() {
		return isAvaliable;
	}
	public void setIsAvaliable(Integer isAvaliable) {
		this.isAvaliable = isAvaliable;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getGoodsUrl() {
		return goodsUrl;
	}
	public void setGoodsUrl(String goodsUrl) {
		this.goodsUrl = goodsUrl;
	}
	public Float getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(Float goodsPrice) {
		this.goodsPrice = goodsPrice;
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