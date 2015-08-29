package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Favorite extends BaseEntity {
	
	private Integer memberId;
	private Integer goodsId;
	private Integer status;
	
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
