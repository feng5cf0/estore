package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.landicorp.core.action.BaseActionSupport;

public class NewProductAction extends BaseActionSupport{
		/**
	 * 
	 */
		private static final long serialVersionUID = 1L;
		private List<Category> categoryList;
		private ICategoryService categoryService;
		

		//跳转到最新产品页面
		public String toNewProduct(){
			this.categoryList = this.categoryService.getForFront();
			return "toNewProduct";
		}

		public List<Category> getCategoryList() {
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
