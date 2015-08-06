package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;

public class PageJumpAction {
	private List<Category> categoryList;
	private ICategoryService categoryService;
	
	public String toMain(){
		
		this.categoryList = this.categoryService.getForFront();
		
		return "toMain";
	}
	//跳转到最新产品页面
	public String toNewProduct(){
		
		return "toNewProduct";
	}
	//跳转到产品促销页面
	public String toProductPromotion(){
		
		return "toProductPromotion";
	}
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
}
