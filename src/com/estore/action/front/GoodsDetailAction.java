package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.estore.util.Locale;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsDetailAction extends ActionSupport {
	
	private Goods goods;
	private IGoodsService goodsService;
	private Integer goodsId;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	
	public String prepare(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		
		this.goods = this.goodsService.getByGoodsId(goodsId,Locale.ZHCN);

		//System.out.print(ServletActionContext.getRequest().getSession().getAttribute("member"));
		//System.out.print(ServletActionContext.getRequest().getSession().getId());
		
		return "prepare";
	}

	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public IGoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(IGoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
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
	

}
