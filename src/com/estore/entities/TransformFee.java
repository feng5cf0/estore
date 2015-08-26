package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class TransformFee extends BaseEntity {
	
	private String locationCode;
	private Float price;
	
	public String getLocationCode() {
		return locationCode;
	}
	public void setLocationCode(String locationCode) {
		this.locationCode = locationCode;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}

}
