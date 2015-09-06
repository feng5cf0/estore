package com.estore.action.front;

import java.util.List;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IOnsaleService;
import com.opensymphony.xwork2.ActionSupport;

public class OnsaleFrontAction extends ActionSupport{
	private IOnsaleService onsaleService;
	
	private ICategoryService categoryService;
	private List<Category> categoryList;
	private IBrandService brandService;
	private List<Brand> brandList;
	private List<Goods> goodsList;
	public String prepare(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();

		this.goodsList = this.onsaleService.getOnsaleGoods();
		
		return "prepare";
	}
	
	public String get(){
		
		return "get";
	}
	
	public IOnsaleService getOnsaleService() {
		return onsaleService;
	}
	public void setOnsaleService(IOnsaleService onsaleService) {
		this.onsaleService = onsaleService;
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
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
}
