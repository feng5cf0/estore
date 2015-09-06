package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class Coupon extends BaseEntity {
	
	private Integer memberId;
	private String description;
	private Integer status;
	private Date endTime;
	private Float limit;
	private Float reduce;
	
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Float getLimit() {
		return limit;
	}
	public void setLimit(Float limit) {
		this.limit = limit;
	}
	public Float getReduce() {
		return reduce;
	}
	public void setReduce(Float reduce) {
		this.reduce = reduce;
	}
}
