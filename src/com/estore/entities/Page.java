package com.estore.entities;

import com.landicorp.core.entities.base.BaseEntity;

public class Page extends BaseEntity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer start;
	private Integer pageSize;
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	
	
}
