package com.estore.action.front;

import java.util.Date;
import java.util.List;

import com.estore.entities.Attribute;
import com.estore.entities.Cart;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.entities.Member;
import com.estore.service.ICartService;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.estore.util.Locale;
import com.landicorp.core.action.BaseActionSupport;

public class CartFrontAction extends BaseActionSupport {

	private Goods goods;
	private Cart cart;
	private Attribute attribute;
	private Integer total;
	private ICartService cartService;
	private Integer[] cartIds;
	private List<Cart> cartList;
	private IGoodsService goodsService;
	
	private List<Category> categoryList;
	private ICategoryService categoryService;
	
	public String addCart(){
		
		this.categoryList = this.categoryService.getForFront();
		
		goods = this.goodsService.getByGoodsId(goods.getId(), Locale.ZHCN);
		cart = new Cart();
		
		
		cart.setGoodsId(goods.getId());
		cart.setTotal(total);
		cart.setMakeDate(new Date());
		
		//判断是否登录
		Member member = (Member)getSession().get("member");
		
		if(member != null){
			cart.setMemberId(member.getId());
			
		}else{
			return "toLogin";
		}
		
		cart.setStatus(1);
		
		//判断语言状态
		cart.setLocaleType(Locale.ZHCN);
		
		this.cartService.add(cart);
		
		
		//取出所有cart
		this.cartList = this.cartService.getByMemberId(member.getId());
		
		return "addCart";
	}

	public String getAll(){
		
		this.categoryList = this.categoryService.getForFront();
		
		
		//判断是否登录
		Member member = (Member)getSession().get("member");
		
		if(member != null){
			//取出所有cart
			this.cartList = this.cartService.getByMemberId(member.getId());		
			
		}else{
			return "toLogin";
		}
		
		
		return "getAll";
	}
	
	public String toOrder(){
		
		this.categoryList = this.categoryService.getForFront();
		
		this.cartList = this.cartService.getByCartIds(this.cartIds);
		
		return "toOrder";
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
}
