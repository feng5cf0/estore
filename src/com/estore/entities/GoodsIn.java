package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class GoodsIn extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer goodsId;
	private String goodsName;
	private Float inPrice;
	private String supplier;
	private Integer inOperator;
	private Date inDate;
	private Integer storeOperator;
	private Date storeDate;
	private Integer inNumber;
	private Integer status;    //1-进货  2-入库
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Float getInPrice() {
		return inPrice;
	}
	public void setInPrice(Float inPrice) {
		this.inPrice = inPrice;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public Date getInDate() {
		return inDate;
	}
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}
	public Date getStoreDate() {
		return storeDate;
	}
	public void setStoreDate(Date storeDate) {
		this.storeDate = storeDate;
	}
	public Integer getInNumber() {
		return inNumber;
	}
	public void setInNumber(Integer inNumber) {
		this.inNumber = inNumber;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public Integer getInOperator() {
		return inOperator;
	}
	public void setInOperator(Integer inOperator) {
		this.inOperator = inOperator;
	}
	public Integer getStoreOperator() {
		return storeOperator;
	}
	public void setStoreOperator(Integer storeOperator) {
		this.storeOperator = storeOperator;
	}
	
}
