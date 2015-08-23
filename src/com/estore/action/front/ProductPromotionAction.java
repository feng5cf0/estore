package com.estore.action.front;

import java.util.List;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.opensymphony.xwork2.ActionSupport;

public class ProductPromotionAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	private IBrandService brandService;
	private List<Brand> brandList;

	// 跳转到产品促销页面
	public String toProductPromotion() {
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "toproductpromotion";
	}

	// 跳转到产品促销-团购页面
	public String toTG() {
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "totg";
	}

	// 跳转到产品促销-优惠券页面
	public String toYHQ() {
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "toyhq";
	}

	// 跳转到产品促销-限时限量页面
	public String toXSXL() {
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
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
