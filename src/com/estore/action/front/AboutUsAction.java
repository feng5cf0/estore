package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.landicorp.core.action.BaseActionSupport;

public class AboutUsAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	//跳转到关于我们页面
		public String toAboutUs(){
			this.categoryList = this.categoryService.getForFront();
			return "toaboutus";
		}
		public List<Category> getCategoryList() {
			this.categoryList = this.categoryService.getForFront();
			return categoryList;
		}
		public void setCategoryList(List<Category> categoryList) {
			this.categoryList = categoryList;
		}
		public ICategoryService getCategoryService() {
			return categoryService;
		}
		public void setCategoryService(ICategoryService categoryService) {
			this.categoryService = categoryService;
		}
		

}
