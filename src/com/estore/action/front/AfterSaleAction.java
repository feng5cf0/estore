package com.estore.action.front;

import java.util.List;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.DownCenter;
import com.estore.entities.TechnicalArticle;
import com.estore.entities.Video;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IDownCenterService;
import com.estore.service.ITechnicalArticleService;
import com.estore.service.IVideoService;
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
	private ITechnicalArticleService technicalArticleService;
	private TechnicalArticle technicalArticle;
	private IDownCenterService downCenterService;
	private List<TechnicalArticle> technicalArticlelist;
	private IBrandService brandService;
	private List<Brand> brandList;
	private IVideoService videoService;
	private List<Video> videoAll;
	private List<DownCenter> downcenterList;
	private Video video;
	Property pro=new Property();
		//跳转到售后服务页面
		public String toAfterSale(){
			this.categoryList = this.categoryService.getForFront();
			this.brandList = this.brandService.getAll();
			this.technicalArticlelist = this.technicalArticleService.pagingSearch();
			return "toaftersale";
		}
		//跳转到售后服务-视频观看页面
		public String toScanVideo(){
			this.categoryList = this.categoryService.getForFront();
			this.brandList = this.brandService.getAll();
			this.videoAll=videoService.getVideo();
			return "toscanvideo";
		}
		//跳转到售后服务-下载中心页面
		public String toDownloadCenter(){
			this.categoryList = this.categoryService.getForFront();
			this.brandList = this.brandService.getAll();
			this.downcenterList = this.downCenterService.getDownCenter();
			return "todownloadcenter";
		}
		
		/**
		 * 前台技术文章查询
		 * 
		 * @return
		 */
		public String search(){
			if(technicalArticle!=null){
				technicalArticlelist=technicalArticleService.getTechMHCX(technicalArticle);
				return "toaftersale";
			}else{
				this.technicalArticlelist = this.technicalArticleService.pagingSearch();
				return "toaftersale";
			}
			
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
		
		public ITechnicalArticleService getTechnicalArticleService() {
			return technicalArticleService;
		}
		public void setTechnicalArticleService(
				ITechnicalArticleService technicalArticleService) {
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
		public IVideoService getVideoService() {
			return videoService;
		}
		public void setVideoService(IVideoService videoService) {
			this.videoService = videoService;
		}
		public List<Video> getVideoAll() {
			return videoAll;
		}
		public void setVideoAll(List<Video> videoAll) {
			this.videoAll = videoAll;
		}
		public Video getVideo() {
			return video;
		}
		public void setVideo(Video video) {
			this.video = video;
		}
		public IDownCenterService getDownCenterService() {
			return downCenterService;
		}
		public void setDownCenterService(IDownCenterService downCenterService) {
			this.downCenterService = downCenterService;
		}
		public List<DownCenter> getDowncenterList() {
			return downcenterList;
		}
		public void setDowncenterList(List<DownCenter> downcenterList) {
			this.downcenterList = downcenterList;
		}
		
	
}
