package com.estore.action.back;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.estore.util.Locale;
import com.landicorp.core.action.BaseActionSupport;

public class CategoryLocaleAction extends BaseActionSupport {

	private ICategoryService categoryService;
	private List<Category> categoryList;
	private Category category;
	private Integer categoryId;
	
	public String loadLocale(){
		
		return "loadLocale";
	}
	
	public String categoryLocaleTree(){
		
		this.categoryList = this.categoryService.getForTree();
		
		return "categoryLocaleTree";
	}
	
	public String categoryLocaleSearch(){
		
		this.categoryList = this.categoryService.getLocaleById(this.categoryId,null);
		
		return "categoryLocaleSearch";
	}
	
	public String prepare(){
			
		this.categoryList = this.categoryService.getLocaleById(categoryId, Locale.ZHCN);
		
		if(this.categoryList.size() > 0){
			
			this.category = this.categoryList.get(0);
		}
		
		return "prepare";
	}
	public String addCategoryLocale(){
		
		this.categoryService.addLocale(this.category);
		
		return "addCategoryLocale";
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
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
}
