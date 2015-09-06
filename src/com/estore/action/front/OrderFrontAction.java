package com.estore.action.front;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;
import org.aspectj.util.ConfigParser.ParseException;

import com.estore.entities.Address;
import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Goods;
import com.estore.entities.Member;
import com.estore.entities.Order;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IGoodsService;
import com.estore.service.IOrderService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OrderFrontAction extends ActionSupport {

	private Integer[] cartIds;
	private IOrderService orderService;
	private Integer orderId;
	private Order order;
	private List<Order> orderList;
	
	private List<Category> categoryList;
	private ICategoryService categoryService;
	private IBrandService brandService;
	private List<Brand> brandList;
	
	private List<Goods> goodsList;
	private IGoodsService goodsService;
	
	private Address address;
	private Integer addressId;
	private File payPic;
	private String payPicFileName;
	private String payPicContentType;
	
	public String addOrder(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		if(order == null){
			order = new Order();
		}
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");

		if(member == null){
			
			return "login";
		}
		order.setMemberId(member.getId());
		order.setCreateTime(new Date());
		order.setStatus(1);
		
		address.setMemberId(member.getId());
		
		//判断是否是新地址
		if(addressId!= null && addressId != 0){
			this.orderService.addOrder(order,cartIds,addressId);
		}else{
			this.orderService.addOrder(order,cartIds,address);
		}
		
		
		return "addOrder";
	}
	public String pay(){
		
		String path = ServletActionContext.getServletContext().getRealPath("/images/orderpay/");

    	try{
    		
    		String s[] = payPicFileName.split("\\.");
    		String contentType = s[s.length-1];
    		String fileName = "DD"+order.getId()+"."+contentType;
	    	if(payPic != null){
	    		InputStream is = new FileInputStream(payPic);
	    		File destFile = new File(new File(path),fileName);
	    		//FileUtils.copyFile(payPic, savefile);
	    		OutputStream os = new FileOutputStream(destFile);
	    		byte[] buffer = new byte[400];
	    		int length = 0;
	    		while ((length = is.read(buffer)) > 0) {
	    			os.write(buffer, 0, length);
	    		}
	    		order.setPayPic(destFile.getPath());
	    		is.close();
	    		os.close();
	    	}
    	}catch(IOException e){
    		e.printStackTrace();
    	}catch(ParseException e){
    		e.printStackTrace();
    	}
    	
    	this.order.setStatus(2);
    	this.orderService.update(this.order);
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		return "pay";
	}
	public String toPay(){
		
		if(orderId != null){
			this.order = this.orderService.getByOrderId(orderId);
			this.categoryList = this.categoryService.getForFront();
			this.brandList = this.brandService.getAll();
		}else{
			return "get";
		}
		
		return "toPay";
	}
	
	public String get(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		goodsList = this.goodsService.getNewGoods();
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		
		if(member == null){
			return "toLogin";
		}
		order = new Order();
		order.setMemberId(member.getId());
		
		this.orderList = this.orderService.getOrder(order);
		
		return "getOrder";
	}
	
	public String delete(){
		
		this.orderService.deleteOrder(orderId);
		
		return "delete";
	}
	
	public Integer[] getCartIds() {
		return cartIds;
	}
	public void setCartIds(Integer[] cartIds) {
		this.cartIds = cartIds;
	}
	public IOrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(IOrderService orderService) {
		this.orderService = orderService;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
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
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	public IGoodsService getGoodsService() {
		return goodsService;
	}
	public void setGoodsService(IGoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public File getPayPic() {
		return payPic;
	}
	public void setPayPic(File payPic) {
		this.payPic = payPic;
	}
	public String getPayPicFileName() {
		return payPicFileName;
	}
	public void setPayPicFileName(String payPicFileName) {
		this.payPicFileName = payPicFileName;
	}
	public String getPayPicContentType() {
		return payPicContentType;
	}
	public void setPayPicContentType(String payPicContentType) {
		this.payPicContentType = payPicContentType;
	}
	public Integer getAddressId() {
		return addressId;
	}
	public void setAddressId(Integer addressId) {
		this.addressId = addressId;
	}
}
