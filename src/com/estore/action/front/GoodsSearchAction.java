package com.estore.action.front;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.opensymphony.xwork2.ActionSupport;

public class GoodsSearchAction extends ActionSupport {
	
	private Goods goods;
	private List<Goods> goodsList;
	private Category category;
	private List<Category> categoryList;
	private Integer categoryId;
	private ICategoryService categoryService;
	private List<Category> categoryList2;
	private IGoodsService goodsService;
	private String categoryCode;
	private IBrandService brandService;
	private List<Brand> brandList;
	private Integer brandId;
	private Brand brand;
	private Integer price;
	private String keyWords;
	public String getByCategory(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();

		HttpSession session = ServletActionContext.getRequest().getSession();
		Map<String,Object> goodsCondition = null;
		if(session.getAttribute("goodsCondition") == null){
			goodsCondition = new HashMap<String,Object>();
			session.setAttribute("goodsCondition", goodsCondition);
		}else{
			goodsCondition = (Map<String,Object>)session.getAttribute("goodsCondition");
		}
		
		if(category != null && category.getCategoryCode() != null && !"".equals(category.getCategoryCode()) && !"0".equals(category.getCategoryCode())){
			
			goodsCondition.put("category", category);
			
		}else{
			goodsCondition.remove("category");
		}

		this.categoryList2 = this.categoryService.getByCategoryCode(goodsCondition.get("categoryCode").toString());
		this.goodsList = this.goodsService.getByCondition(goodsCondition);
		//清空数据
		
		return "getByCategory";
	}
	
	public String getByCategoryCode(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();		

		HttpSession session = ServletActionContext.getRequest().getSession();
		Map<String,Object> goodsCondition = null;
		if(session.getAttribute("goodsCondition") == null){
			goodsCondition = new HashMap<String,Object>();
			session.setAttribute("goodsCondition", goodsCondition);
		}else{
			goodsCondition = (Map<String,Object>)session.getAttribute("goodsCondition");
		}
		
		if(categoryCode != null && !"".equals(categoryCode) && !"0".equals("categoryCode")){
			goodsCondition.put("categoryCode", categoryCode);
			this.categoryList2 = this.categoryService.getByCategoryCode(categoryCode);
		}
		
		this.goodsList = this.goodsService.getByCondition(goodsCondition);
		
		return "getByCategoryCode";
	}
	
	public String getByBrand(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();		
		
		HttpSession session = ServletActionContext.getRequest().getSession();
		Map<String,Object> goodsCondition = null;
		if(session.getAttribute("goodsCondition") == null){
			goodsCondition = new HashMap<String,Object>();
			session.setAttribute("goodsCondition", goodsCondition);
		}else{
			goodsCondition = (Map<String,Object>)session.getAttribute("goodsCondition");
		}
		
		if(brand != null && brand.getId() != 0){
			goodsCondition.put("brand", brand);
		}else{
			goodsCondition.remove("brand");
		}
		
		Object _code = (String)goodsCondition.get("categoryCode");
		if(_code == null){
			_code = new String("001");
		}
		this.categoryList2 = this.categoryService.getByCategoryCode(_code.toString());
		
		//this.goodsList = this.goodsService.getByBrandId(brandId);
		this.goodsList = this.goodsService.getByCondition(goodsCondition);
		return "getByBrand";
	}

	public String getByPrice(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();

		HttpSession session = ServletActionContext.getRequest().getSession();
		Map<String,Object> goodsCondition = null;
		if(session.getAttribute("goodsCondition") == null){
			goodsCondition = new HashMap<String,Object>();
			session.setAttribute("goodsCondition", goodsCondition);
		}else{
			goodsCondition = (Map<String,Object>)session.getAttribute("goodsCondition");
		}
		
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
			
		}else{
			goodsCondition.remove("price");
			goodsCondition.remove("beginPrice");
			goodsCondition.remove("endPrice");
		}
		Object _code = (String)goodsCondition.get("categoryCode");
		if(_code == null){
			_code = new String("001");
		}
		this.categoryList2 = this.categoryService.getByCategoryCode(_code.toString());
		
		this.goodsList = this.goodsService.getByCondition(goodsCondition);
		
		return "getByPrice";
	}
	
	public String getByKeyWords(){
		
		//类别栏数据
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();

		HttpSession session = ServletActionContext.getRequest().getSession();
		Map<String,Object> goodsCondition = null;
		if(session.getAttribute("goodsCondition") == null){
			goodsCondition = new HashMap<String,Object>();
			session.setAttribute("goodsCondition", goodsCondition);
		}else{
			goodsCondition = (Map<String,Object>)session.getAttribute("goodsCondition");
		}
		
		if(keyWords != null && !"".equals(keyWords)){
			goodsCondition.put("keyWords", keyWords);
		}else{
			goodsCondition.remove("keyWords");
		}
		
		Object _code = (String)goodsCondition.get("categoryCode");
		if(_code == null){
			_code = new String("001");
		}
		this.categoryList2 = this.categoryService.getByCategoryCode(_code.toString());
		
		this.goodsList = this.goodsService.getByCondition(goodsCondition);		
		
		return "getByKeyWords";
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
	public String getCategoryCode() {
		return categoryCode;
	}
	public void setCategoryCode(String categoryCode) {
		this.categoryCode = categoryCode;
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
	public Integer getBrandId() {
		return brandId;
	}
	public void setBrandId(Integer brandId) {
		this.brandId = brandId;
	}
	public Brand getBrand() {
		return brand;
	}
	public void setBrand(Brand brand) {
		this.brand = brand;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getKeyWords() {
		return keyWords;
	}
	public void setKeyWords(String keyWords) {
		this.keyWords = keyWords;
	}
}
