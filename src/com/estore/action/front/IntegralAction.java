package com.estore.action.front;

import java.util.List;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.opensymphony.xwork2.ActionSupport;

public class IntegralAction extends ActionSupport{

	/**
	 * hzp
	 * 20150830
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private List<Brand> brandList;
	private ICategoryService categoryService;
	private IBrandService brandService;
	/**
	 * 跳转到我的积分
	 * @return
	 */
	public String toMyIntegral(){
		//分类
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "toMyIntegral";
	}
	/**
	 * 跳转到积分历史
	 * @return
	 */
	public String toIntegralHistory(){
		//分类
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "toIntegralHistory";
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
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
	
}
