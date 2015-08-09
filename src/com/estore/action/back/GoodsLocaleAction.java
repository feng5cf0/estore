package com.estore.action.back;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.IGoodsService;
import com.estore.util.Locale;
import com.landicorp.core.action.BaseActionSupport;

public class GoodsLocaleAction extends BaseActionSupport {
	
	private IGoodsService goodsService;
	private List<Goods> goodsList;
	private List<Category> categoryList;
	private Integer goodsId;
	private Goods goods;
	
	public String loadLocale(){
		
		return "loadLocale";
	}

	public String goodsLocaleTree(){
		
		this.categoryList = this.goodsService.getCategoryGoods();
		
		return "goodsLocaleTree";
	}
	public String goodsLocaleSearch(){
		
		//处理前台传入id
		if(goodsId != null && goodsId < 0 ){
			this.goodsId = 0 - this.goodsId;
		}
		
		this.goodsList = this.goodsService.getLocaleById(goodsId,null);
		
		return "goodsLocaleSearch";
	}
	
	public String prepare(){
		
		this.goodsList = this.goodsService.getLocaleById(goodsId,Locale.ZHCN);
		
		if(this.goodsList.size() > 0){
			this.goods = this.goodsList.get(0);
		}
		
		return "prepare";
	}
	public String addGoodsLocale(){
		
		this.goodsService.addLocale(this.goods);
		
		return "addLocale";
	}

	public IGoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(IGoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
}
