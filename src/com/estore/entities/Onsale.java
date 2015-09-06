package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class Onsale extends BaseEntity {
	
	private Integer onsaleTypeId;
	private String description;
	private Integer status;
	private Date beginTime;
	private Date endTime;
	private Float percent;
	private Float reduce;
	
	private OnsaleType onsaleType;
	
	public Integer getOnsaleTypeId() {
		return onsaleTypeId;
	}
	public void setOnsaleTypeId(Integer onsaleTypeId) {
		this.onsaleTypeId = onsaleTypeId;
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
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public Float getPercent() {
		return percent;
	}
	public void setPercent(Float percent) {
		this.percent = percent;
	}
	public Float getReduce() {
		return reduce;
	}
	public void setReduce(Float reduce) {
		this.reduce = reduce;
	}
	public OnsaleType getOnsaleType() {
		return onsaleType;
	}
	public void setOnsaleType(OnsaleType onsaleType) {
		this.onsaleType = onsaleType;
	}
	
}
