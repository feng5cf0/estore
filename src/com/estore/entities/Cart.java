package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class Cart extends BaseEntity {

	private Integer goodsId;
	private Integer goodsAttributeId;
	private Integer localeType;
	private Integer memberId;
	private Integer total;
	private Float amount;
	private Date makeDate;
	private Integer status;  //购物车状态  1-正常  2-删除
	
	private GoodsAttribute goodsAttribute;
	
	private Goods goods;
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Float getAmount() {
		return amount;
	}
	public void setAmount(Float amount) {
		this.amount = amount;
	}
	public Date getMakeDate() {
		return makeDate;
	}
	public void setMakeDate(Date makeDate) {
		this.makeDate = makeDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getLocaleType() {
		return localeType;
	}
	public void setLocaleType(Integer localeType) {
		this.localeType = localeType;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Integer getGoodsAttributeId() {
		return goodsAttributeId;
	}
	public void setGoodsAttributeId(Integer goodsAttributeId) {
		this.goodsAttributeId = goodsAttributeId;
	}
	public GoodsAttribute getGoodsAttribute() {
		return goodsAttribute;
	}
	public void setGoodsAttribute(GoodsAttribute goodsAttribute) {
		this.goodsAttribute = goodsAttribute;
	}
	
}
