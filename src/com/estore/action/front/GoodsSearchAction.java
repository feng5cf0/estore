package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.estore.util.Locale;
import com.landicorp.core.action.BaseActionSupport;

public class GoodsSearchAction extends BaseActionSupport {
	
	private Goods goods;
	private List<Goods> goodsList;
	private Category category;
	private List<Category> categoryList;
	private Integer categoryId;
	private ICategoryService categoryService;
	private List<Category> categoryList2;
	private IGoodsService goodsService;
	
	public String getByCategory(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();

		//选择类别后加载的类别数据
		this.categoryList2 = this.categoryService.getByCategoryId(categoryId,Locale.ZHCN);
		
		//选择类别后加载的商品
		this.goodsList = this.goodsService.getByCategoryId(categoryId,Locale.ZHCN);
		
		//this.category = this.category
		
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
	
}
