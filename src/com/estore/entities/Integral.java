package com.estore.entities;

import java.util.Date;

import com.landicorp.core.entities.base.BaseEntity;

public class Integral extends BaseEntity{

	/**
	 * hzp
	 * 积分
	 * 20150830
	 */
	private static final long serialVersionUID = 1L;
	private Integer memberId;//关联会员表
	/**
	 * 调整日期
	 * */
	private Date updateDate;
	
	/**
	 * 调整额度
	 * */
	private String updateCount;
	/**
	 * 积分余额
	 * */
	private String remain;
	/**
	 * 积分来源
	 * */
	private String source;
	
	
	public Integral() {
		super();
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateCount() {
		return updateCount;
	}
	public void setUpdateCount(String updateCount) {
		this.updateCount = updateCount;
	}
	public String getRemain() {
		return remain;
	}
	public void setRemain(String remain) {
		this.remain = remain;
	}
	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public Integer getMemberId() {
		return memberId;
	}
	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
	
	

}
