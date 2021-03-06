package com.estore.action.front;

import java.text.DecimalFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.entities.Address;
import com.estore.entities.Attribute;
import com.estore.entities.Brand;
import com.estore.entities.Cart;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.entities.GoodsAttribute;
import com.estore.entities.Member;
import com.estore.service.IAddressService;
import com.estore.service.IBrandService;
import com.estore.service.ICartService;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsAttributeService;
import com.estore.service.IGoodsService;
import com.estore.util.Locale;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CartFrontAction extends ActionSupport {

	private Goods goods;
	private Cart cart;
	private Attribute attribute;
	private Integer total;
	private ICartService cartService;
	private Integer[] cartIds;
	private List<Cart> cartList;
	private IGoodsService goodsService;
	private IAddressService addressService;
	private List<Address> addressList;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	
	private String[] attributeList;
	private IGoodsAttributeService goodsAttributeService;
	
	private IBrandService brandService;
	private List<Brand> brandList;
	private Float allAccount = 0f;
	
	private Integer goodsId;
	private Integer cartId;
	public String addCart(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		goods = this.goodsService.getByGoodsId(goods.getId(), Locale.ZHCN);
		cart = new Cart();
 		cart.setGoodsId(goods.getId());
		cart.setTotal(total);
		cart.setMakeDate(new Date());
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		
		if(member != null){
			cart.setMemberId(member.getId());
			
		}else{
			return "toLogin";
		}
		
		cart.setStatus(1);
		
		//判断语言状态
		cart.setLocaleType(Locale.ZHCN);
		//获取商品属性
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("goodsId", goods.getId());
		
		for(int i =1;i<=attributeList.length ;i++){
			map.put("attribute"+i, attributeList[i-1]);
		}
		List<GoodsAttribute> attrList = this.goodsAttributeService.getByAttribute(map);
		if(attrList.size()>0){ 
			cart.setGoodsAttributeId(attrList.get(0).getId());
			cart.setAmount(attrList.get(0).getPrice()*total);
		}
		
		this.cartService.add(cart);
		
		return "addCart";
	}

	public String getAll(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		
		if(member != null){
			//取出所有cart
			this.cartList = this.cartService.getByMemberId(member.getId());		
			
		}else{
			return "toLogin";
		}
		
		return "getAll";
	}
	
	public String toOrder(){
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		
		if(member != null){
			
			this.categoryList = this.categoryService.getForFront();
			this.brandList = this.brandService.getAll();
			
			this.cartList = this.cartService.getByCartIds(this.cartIds);
			
			//统计商品总金额
			for(Cart cart : cartList){
				if(cart.getGoodsAttribute().getPrice() != null){
					if(cart.getGoods().getOnsale() != null){
						this.allAccount += cart.getGoodsAttribute().getPrice() * cart.getGoods().getOnsale().getPercent() * cart.getTotal();
					}else{
						this.allAccount += cart.getGoodsAttribute().getPrice() * cart.getTotal();
					}
				}else{
					if(cart.getGoods().getOnsale() != null){
						this.allAccount += cart.getGoods().getGoodsPrice() * cart.getGoods().getOnsale().getPercent() * cart.getTotal();
					}else{
						this.allAccount += cart.getGoods().getGoodsPrice() * cart.getTotal();
					}
				}
				DecimalFormat df = new DecimalFormat("0.00");
				this.allAccount = Float.parseFloat(df.format(this.allAccount));
				
			}
			
			//加载地址信息
			this.addressList = this.addressService.getByMemberId(member.getId());
			
		}else{
			return "toLogin";
		}
		
		return "toOrder";
	}
	
	public String deleteCart(){
		
		this.cartService.deleteCarts(this.cartIds);
		
		return "deleteCart";
	}
	
	public String addFavorite(){
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		
		if(member != null){
			//取出所有cart
			this.cartList = this.cartService.getByMemberId(member.getId());		
			
		}else{
			return "toLogin";
		}
		
		this.cartService.addFavorite(cartId,goodsId,member.getId());
		
		return "addFavorite";
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public Attribute getAttribute() {
		return attribute;
	}
	public void setAttribute(Attribute attribute) {
		this.attribute = attribute;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public ICartService getCartService() {
		return cartService;
	}
	public void setCartService(ICartService cartService) {
		this.cartService = cartService;
	}
	public List<Cart> getCartList() {
		return cartList;
	}
	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}
	public IGoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(IGoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public Integer[] getCartIds() {
		return cartIds;
	}
	public void setCartIds(Integer[] cartIds) {
		this.cartIds = cartIds;
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
	public String[] getAttributeList() {
		return attributeList;
	}
	public void setAttributeList(String[] attributeList) {
		this.attributeList = attributeList;
	}
	public IGoodsAttributeService getGoodsAttributeService() {
		return goodsAttributeService;
	}
	public void setGoodsAttributeService(
			IGoodsAttributeService goodsAttributeService) {
		this.goodsAttributeService = goodsAttributeService;
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
	public Float getAllAccount() {
		return allAccount;
	}
	public void setAllAccount(Float allAccount) {
		this.allAccount = allAccount;
	}
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	public Integer getCartId() {
		return cartId;
	}
	public void setCartId(Integer cartId) {
		this.cartId = cartId;
	}
	public IAddressService getAddressService() {
		return addressService;
	}
	public void setAddressService(IAddressService addressService) {
		this.addressService = addressService;
	}
	public List<Address> getAddressList() {
		return addressList;
	}
	public void setAddressList(List<Address> addressList) {
		this.addressList = addressList;
	}
}
