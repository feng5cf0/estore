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
	private Integer[] deleteItems;
	private String categoryCode;
	
	public String addPrepare(){
		
		this.categoryList = this.categoryService.getForTree();
		
		return "addPrepare";
	}
	
	public String addGoods(){
		//设置语言格式1中文
		this.goods.setLocaleType(1);
		
		//设置商品编码
		this.goods.setGoodsCode(this.categoryCode+this.goods.getGoodsCode());
		
		this.goodsService.add(goods);
		
		return "addGoods";
	}

	public String loadAll(){
		
		this.goodsList = this.goodsService.getAll(goods, getPager());
		
		return "loadAll";
	}
	
	public String delete(){
		
		this.goodsService.delete(this.deleteItems);
		
		return "delete";
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
	public Integer[] getDeleteItems() {
		return deleteItems;
	}
	public void setDeleteItems(Integer[] deleteItems) {
		this.deleteItems = deleteItems;
	}
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}
}
