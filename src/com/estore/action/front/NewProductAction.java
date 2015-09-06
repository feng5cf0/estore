package com.estore.action.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.opensymphony.xwork2.ActionSupport;

public class NewProductAction extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	private IBrandService brandService;
	private List<Brand> brandList;
	private String keyWords;
	private Integer price;
	private Integer brandId;
	private String categoryCode;
	
	private List<Category> categoryList2;
	private List<Goods> goodsList;
	private IGoodsService goodsService;
	// 跳转到最新产品页面
	public String toNewProduct() {
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "toNewProduct";
	}

	public String getByCondition() {

		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		Map<String,Object> goodsCondition = new HashMap<String,Object>();
		
		if(price != null && price != 0){
			if(price == 1){
				goodsCondition.put("price", 1);
				goodsCondition.put("beginPrice", 0);
				goodsCondition.put("endPrice", 50);
			}else if(price == 2){
				goodsCondition.put("price", 2);
				goodsCondition.put("beginPrice", 50);
				goodsCondition.put("endPrice", 100);		
			}else if(price == 3){
				goodsCondition.put("price", 3);
				goodsCondition.put("beginPrice", 100);
			}
		}
		if(categoryCode != null && !"".equals(categoryCode) && !"0".equals("categoryCode")){
			goodsCondition.put("categoryCode", categoryCode);
			this.categoryList2 = this.categoryService.getByCategoryCode(categoryCode);
		}else{
			String _code = "001";
			this.categoryList2 = this.categoryService.getByCategoryCode(_code.toString());
		}
		
		if(brandId != null && brandId != 0){
			Brand brand = new Brand();
			brand.setId(brandId);
			goodsCondition.put("brand", brand);
		}
		
		if(keyWords != null && !"".equals(keyWords)){
			goodsCondition.put("keyWords", keyWords);
		}
		
		this.goodsList = this.goodsService.getByCondition(goodsCondition);
		
		return "getByCondition";
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

	public String getKeyWords() {
		return keyWords;
	}

	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public Integer getBrandId() {
		return brandId;
	}

	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}

	public String getCategoryCode() {
		return categoryCode;
	}

	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
	}

	public List<Category> getCategoryList2() {
		return categoryList2;
	}

	public void setCategoryList2(List<Category> categoryList2) {
		this.categoryList2 = categoryList2;
	}

	public List<Goods> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}

}
