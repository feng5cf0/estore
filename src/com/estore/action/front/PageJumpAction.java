package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;

public class PageJumpAction {
	private List<Category> categoryList;
	private ICategoryService categoryService;
	
	public String toMain(){
		
		this.categoryList = this.categoryService.getForFront();
		
		return "toMain";
	}
	//跳转到最新产品页面
	public String toNewProduct(){
		
		return "toNewProduct";
	}
	//跳转到产品促销页面
	public String toProductPromotion(){
		
		return "toproductpromotion";
	}
	//跳转到关于我们页面
	public String toAboutUs(){
		
		return "toaboutus";
	}
	//跳转到售后服务页面
	public String toAfterSale(){
		
		return "toaftersale";
	}
	//跳转到在线留言页面
		public String toOnLine(){
			
			return "toonline";
	}
		//跳转到联系我们页面
		public String toCallUs(){
			
			return "tocalllus";
	}
		//跳转到售后服务-视频观看页面
	public String toScanVideo(){
		return "toscanvideo";
	}
	//跳转到售后服务-下载中心页面
	public String toDownloadCenter(){
		return "todownloadcenter";
	}
	//跳转到产品促销-限时限量页面
	public String toXSXL(){
		return "toxsxl";
	}
	//跳转到售后服务-团购页面
	public String toTG(){
		return "totg";
	}
	//跳转到售后服务-优惠券页面
	public String toYHQ(){
		return "toyhq";
	}
	//跳转到银行账户页面
	public String toBankAccount(){
		return "toBankAccount";
	}
		
		
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
}
