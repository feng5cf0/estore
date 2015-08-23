package com.estore.action.front;

import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsSearchAction extends ActionSupport {
	
	private Goods goods;
	private List<Goods> goodsList;
	private Category category;
	private List<Category> categoryList;
	private Integer categoryId;
	private ICategoryService categoryService;
	private List<Category> categoryList2;
	private IGoodsService goodsService;
	private String categoryCode;
	private IBrandService brandService;
	private List<Brand> brandList;
	public String getByCategory(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();

		//选择类别后加载的类别数据
		//this.categoryList2 = this.categoryService.getByCategoryId(categoryId,Locale.ZHCN);
		this.categoryList2 = this.categoryService.getByCategoryCode(categoryCode);
		
		//String c = categoryCode;
		List<Goods> list = this.goodsService.getByGoodsCode(categoryCode);
		ServletActionContext.getRequest().getSession().setAttribute("goodsList", list);
		//this.goodsList = this.frontGoodsService.getByGoodsCode(1000);
		//map.put("goodsLis", list);
		//String c = categoryCode;
		//this.goodsService.getByCategoryId(categoryId, Locale.ZHCN);
		return "getByCategory";
	}

	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
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
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public List<Category> getCategoryList2() {
		return categoryList2;
	}
	public void setCategoryList2(List<Category> categoryList2) {
		this.categoryList2 = categoryList2;
	}
	public IGoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(IGoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
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
