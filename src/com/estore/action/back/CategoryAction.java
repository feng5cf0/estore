package com.estore.action.back;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.estore.util.Locale;
import com.landicorp.core.action.BaseActionSupport;

public class CategoryAction extends BaseActionSupport {

	private ICategoryService categoryService;
	private Category category;
	private List<Category> categoryList;
	private Integer[] delete;
	private String parentCode;
	
	public String categoryManageFrame(){
		
		return "categoryManageFrame";
	}
	
	public String loadCategoryForTree(){
		
		this.categoryList = this.categoryService.getForTree();
		
		return "loadCategoryForTree"; 
	}
	
	public String loadCategoryByParentId(){
		if(category == null || category.getParentCategory() == null || category.getParentCategory() == 0){
			category.setParentCategory(1);
		}
		if(category == null || category.getCategoryCode() == null || "".equals(category.getCategoryCode())){
			category.setCategoryCode("001");
		}
		
		this.categoryList = this.categoryService.getByParentId(category.getParentCategory(),getPager());
		
		return "loadCategoryByParentId";
	}
	public String addPrepare(){
		this.parentCode = this.category.getCategoryCode();
		return "addPrepare";
	}
	public String addCategory(){
		
		String _code = category.getCategoryCode();
		category.setCategoryCode(this.parentCode+_code);
		category.setLocaleType(Locale.ZHCN);
		
		this.categoryService.add(category);
		
		return "addCategory";
	}

	public String deleteCategory(){
		
		this.categoryService.delete(delete);
		
		setOperateSuccess(true);
		
		return "deleteCategory";
	}
	
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public Integer[] getDelete() {
		return delete;
	}
	public void setDelete(Integer[] delete) {
		this.delete = delete;
	}
	public String getParentCode() {
		return parentCode;
	}
	public void setParentCode(String parentCode) {
		this.parentCode = parentCode;
	}
	
}
