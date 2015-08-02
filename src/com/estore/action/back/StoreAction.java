package com.estore.action.back;

import java.util.List;

import com.estore.entities.Goods;
import com.estore.service.IGoodsService;
import com.landicorp.core.action.BaseActionSupport;

public class StoreAction extends BaseActionSupport {

	private IGoodsService goodsService;
	private List<Goods> goodsList;
	private Goods goods;
	
	public String loadAll(){
		
		this.goodsList = this.goodsService.getAll(goods,getPager());
		
		return "loadAll";
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
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	
	
}
