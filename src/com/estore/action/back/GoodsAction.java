package com.estore.action.back;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.landicorp.core.action.BaseActionSupport;

public class GoodsAction extends BaseActionSupport {

	private ICategoryService categoryService;
	private List<Category> categoryList;
	private IGoodsService goodsService;
	private Goods goods;
	private List<Goods> goodsList;
	
	public String addPrepare(){
		
		this.categoryList = this.categoryService.getForTree();
		
		return "addPrepare";
	}
	
	public String addGoods(){
		
		this.goodsService.add(goods);
		
		return "addGoods";
	}

	public String loadAll(){
		
		this.goodsList = this.goodsService.getAll(goods, getPager());
		
		return "loadAll";
	}
	
	public String loadByCategory(){
		return "loadByCategory";
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
	public IGoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(IGoodsService goodsService) {
		this.goodsService = goodsService;
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
}
