package com.estore.action.front;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Attribute;
import com.estore.entities.AttributeValue;
import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsAttributeService;
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
	private IGoodsAttributeService goodsAttributeService;
	
	private String attributeStr;
	private List<Goods> goodsList;
	public String prepare(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		this.goods = this.goodsService.getByGoodsId(goodsId,Locale.ZHCN);
		this.attributeList = this.goodsService.getGoodsAttribute(goodsId);
		
		//this.goods = this.goodsService.getDetailForFront(goodsId);
		this.goodsList = this.goodsService.getByCategoryId(goods.getCategoryId(), 1);
		
		return "prepare";
	}
	
	public String getNumPrice() throws IOException{
		String[] temp = {"0","0","0"};
		if(attributeStr != null){
			temp = attributeStr.split(",");
		}
		Integer[] attributeArray = {0,0,0};
		for(int i=0;i<temp.length;i++){
			attributeArray[i] = Integer.parseInt(temp[i]);
		}
		Map<String,Object> dataMap = this.goodsAttributeService.getFrontAccountByAttribute(attributeArray,goodsId);
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		for(Map.Entry<String, Object> entry : dataMap.entrySet()){
			sb.append("\""+entry.getKey()+"\":\""+entry.getValue()+"\",");
		}
		sb.deleteCharAt(sb.length()-1);
		sb.append("}");
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");
		response.getWriter().print(sb.toString());
		
		return null;
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
	public IGoodsAttributeService getGoodsAttributeService() {
		return goodsAttributeService;
	}
	public void setGoodsAttributeService(
			IGoodsAttributeService goodsAttributeService) {
		this.goodsAttributeService = goodsAttributeService;
	}
	public String getAttributeStr() {
		return attributeStr;
	}
	public void setAttributeStr(String attributeStr) {
		this.attributeStr = attributeStr;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
}
