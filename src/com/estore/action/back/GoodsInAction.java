package com.estore.action.back;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.GoodsIn;
import com.estore.service.IGoodsInService;
import com.landicorp.core.action.BaseActionSupport;

public class GoodsInAction extends BaseActionSupport {

	private IGoodsInService goodsInService;
	private GoodsIn goodsIn;
	private List<Category> categoryList;
	private List<GoodsIn> goodsInList;
	
	public String addPrepare(){
		
		this.categoryList = this.goodsInService.getCategoryGoods();
		return "addPrepare";
	}
	
	public String addBatch(){
		
		this.goodsInService.add(goodsIn);
		
		return "addBatch";
	}
	
	public String loadAll(){
		
		this.goodsInList = this.goodsInService.getAll(goodsIn, getPager());
		
		return "loadAll";
	}
	public IGoodsInService getGoodsInService() {
		return goodsInService;
	}
	public void setGoodsInService(IGoodsInService goodsInService) {
		this.goodsInService = goodsInService;
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public GoodsIn getGoodsIn() {
		return goodsIn;
	}
	public void setGoodsIn(GoodsIn goodsIn) {
		this.goodsIn = goodsIn;
	}
	public List<GoodsIn> getGoodsInList() {
		return goodsInList;
	}
	public void setGoodsInList(List<GoodsIn> goodsInList) {
		this.goodsInList = goodsInList;
	}
	
}
