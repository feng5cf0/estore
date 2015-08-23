package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Brand extends BaseEntity {
	
	private String brandName;
	private String brandPic;
	
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandPic() {
		return brandPic;
	}
	public void setBrandPic(String brandPic) {
		this.brandPic = brandPic;
	}
}
