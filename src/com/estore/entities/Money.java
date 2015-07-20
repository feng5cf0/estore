package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Money extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String moneyName;
	private Float rate;
	
	public String getMoneyName() {
		return moneyName;
	}
	public void setMoneyName(String moneyName) {
		this.moneyName = moneyName;
	}
	public Float getRate() {
		return rate;
	}
	public void setRate(Float rate) {
		this.rate = rate;
	}
}
