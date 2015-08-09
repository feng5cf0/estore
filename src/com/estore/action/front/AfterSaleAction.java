package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.landicorp.core.action.BaseActionSupport;

public class AfterSaleAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
		//跳转到售后服务页面
		public String toAfterSale(){
			this.categoryList = this.categoryService.getForFront();
			return "toaftersale";
		}
		//跳转到售后服务-视频观看页面
		public String toScanVideo(){
			this.categoryList = this.categoryService.getForFront();
			return "toscanvideo";
		}
		//跳转到售后服务-下载中心页面
		public String toDownloadCenter(){
			this.categoryList = this.categoryService.getForFront();
			return "todownloadcenter";
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
