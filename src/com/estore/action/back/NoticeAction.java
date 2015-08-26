package com.estore.action.back;

import java.util.List;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Notice;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.INoticeService;
import com.landicorp.core.action.BaseActionSupport;

public class NoticeAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private INoticeService noticeService;
	private ICategoryService categoryService;
	private IBrandService brandService;
	private List<Notice> noticeListAll;
	private List<Notice> frontNoticeList;
	private List<Category> categoryList;
	private List<Brand> brandList;
	private Notice notice;
	private Integer noticeId;
	
	//获取所有的公告
	public String getNoticeAll(){
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		this.noticeListAll=noticeService.getNoticeAll();
		return "noticeSearch";
	}
	//抢台获取所有公告
	public String getFrontNoticeAll(){
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		this.frontNoticeList=noticeService.getNoticeAll();
		return "toMoreNotice";
	}
	//根据id查询公告信息
	public String getNoticeDetail(){
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		this.notice = this.noticeService.getNoticeById(noticeId);
		return "toNoticeDetail";
	}
	public INoticeService getNoticeService() {
		return noticeService;
	}
	public void setNoticeService(INoticeService noticeService) {
		this.noticeService = noticeService;
	}
	public List<Notice> getNoticeListAll() {
		return noticeListAll;
	}
	public void setNoticeListAll(List<Notice> noticeListAll) {
		this.noticeListAll = noticeListAll;
	}
	public List<Notice> getFrontNoticeList() {
		return frontNoticeList;
	}
	public void setFrontNoticeList(List<Notice> frontNoticeList) {
		this.frontNoticeList = frontNoticeList;
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
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}
	public Notice getNotice() {
		return notice;
	}
	public void setNotice(Notice notice) {
		this.notice = notice;
	}
	public Integer getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(Integer noticeId) {
		this.noticeId = noticeId;
	}
	
	
}
