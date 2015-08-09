package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.landicorp.core.action.BaseActionSupport;

public class ProductPromotionAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	

		//跳转到产品促销页面
		public String toProductPromotion(){
			this.categoryList = this.categoryService.getForFront();
			return "toproductpromotion";
		}
		//跳转到产品促销-团购页面
		public String toTG(){
			this.categoryList = this.categoryService.getForFront();
			return "totg";
		}
		//跳转到产品促销-优惠券页面
		public String toYHQ(){
			this.categoryList = this.categoryService.getForFront();
			return "toyhq";
		}
		//跳转到产品促销-限时限量页面
		public String toXSXL(){
			this.categoryList = this.categoryService.getForFront();
			return "toxsxl";
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
