package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.entities.TechnicalArticle;
import com.estore.service.ICategoryService;
import com.estore.service.impl.TechnicalArticleServiceImpl;
import com.estore.util.Property;
import com.opensymphony.xwork2.ActionSupport;

public class AfterSaleAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	private TechnicalArticleServiceImpl technicalArticleService;
	private TechnicalArticle technicalArticle;
	private List<TechnicalArticle> technicalArticlelist;
	Property pro=new Property();
		//跳转到售后服务页面
		public String toAfterSale(){
			this.categoryList = this.categoryService.getForFront();
			this.technicalArticlelist = this.technicalArticleService.pagingSearch();
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
		public TechnicalArticleServiceImpl getTechnicalArticleService() {
			return technicalArticleService;
		}
		public void setTechnicalArticleService(
				TechnicalArticleServiceImpl technicalArticleService) {
			this.technicalArticleService = technicalArticleService;
		}
		public TechnicalArticle getTechnicalArticle() {
			return technicalArticle;
		}
		public void setTechnicalArticle(TechnicalArticle technicalArticle) {
			this.technicalArticle = technicalArticle;
		}
		public List<TechnicalArticle> getTechnicalArticlelist() {
			return technicalArticlelist;
		}
		public void setTechnicalArticlelist(List<TechnicalArticle> technicalArticlelist) {
			this.technicalArticlelist = technicalArticlelist;
		}
		public Property getPro() {
			return pro;
		}
		public void setPro(Property pro) {
			this.pro = pro;
		}
		
	
}
