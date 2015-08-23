package com.estore.action.front;

import java.util.List;

import com.estore.entities.Attribute;
import com.estore.entities.AttributeValue;
import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.IBrandService;
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
	private List<AttributeValue> attributeValueList;
	private List<Attribute> attributeList;
	
	private IBrandService brandService;
	private List<Brand> brandList;
	
	public String prepare(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		this.goods = this.goodsService.getByGoodsId(goodsId,Locale.ZHCN);
		this.attributeList = this.goodsService.getGoodsAttribute(goodsId);
		
		
		//this.goods = this.goodsService.getDetailForFront(goodsId);
		
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
	public List<AttributeValue> getAttributeValueList() {
		return attributeValueList;
	}
	public void setAttributeValueList(List<AttributeValue> attributeValueList) {
		this.attributeValueList = attributeValueList;
	}
	public List<Attribute> getAttributeList() {
		return attributeList;
	}
	public void setAttributeList(List<Attribute> attributeList) {
		this.attributeList = attributeList;
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
