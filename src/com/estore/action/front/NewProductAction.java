package com.estore.action.front;

import java.util.List;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.opensymphony.xwork2.ActionSupport;

public class NewProductAction extends ActionSupport{
		/**
	 * 
	 */
		private static final long serialVersionUID = 1L;
		private List<Category> categoryList;
		private ICategoryService categoryService;
		private IBrandService brandService;
		private List<Brand> brandList;

		//跳转到最新产品页面
		public String toNewProduct(){
			this.categoryList = this.categoryService.getForFront();
			this.brandList = this.brandService.getAll();
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

		public IBrandService getBrandService() {
			return brandService;
		}

		public void setBrandService(IBrandService brandService) {
			this.brandService = brandService;
		}

		public List<Brand> getBrandList() {
			return brandList;
		}

		public void setBrandList(List<Brand> brandList) {
			this.brandList = brandList;
		}	
		

}	
