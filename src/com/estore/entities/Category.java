package com.estore.entities;

import java.util.Set;

import com.landicorp.core.entities.base.BaseEntity;

public class Category extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String categoryName;
	private Integer parentCategory;
	private Integer isAvaliable;
	private Integer isLeaf;
	private String picture;
	
	private Set<Category> subCategory;

	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Integer getParentCategory() {
		return parentCategory;
	}
	public void setParentCategory(Integer parentCategory) {
		this.parentCategory = parentCategory;
	}
	public Integer getIsAvaliable() {
		return isAvaliable;
	}
	public void setIsAvaliable(Integer isAvaliable) {
		this.isAvaliable = isAvaliable;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Set<Category> getSubCategory() {
		return subCategory;
	}
	public void setSubCategory(Set<Category> subCategory) {
		this.subCategory = subCategory;
	}
	public Integer getIsLeaf() {
		return isLeaf;
	}
	public void setIsLeaf(Integer isLeaf) {
		this.isLeaf = isLeaf;
	}
}
