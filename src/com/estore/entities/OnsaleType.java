package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class OnsaleType extends BaseEntity {
	private String onsaleTypeName;

	public String getOnsaleTypeName() {
		return onsaleTypeName;
	}
	public void setOnsaleTypeName(String onsaleTypeName) {
		this.onsaleTypeName = onsaleTypeName;
	}
}
