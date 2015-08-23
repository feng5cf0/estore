package com.estore.action.front;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Notice;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.INoticeService;
import com.opensymphony.xwork2.ActionSupport;
public class MainAction extends ActionSupport {
	
	/**hzp
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	
	private List<Notice> noticeListAll;
	private ICategoryService categoryService;
	private INoticeService noticeService;
	private IBrandService brandService;
	private List<Brand> brandList;
	public String toMain(){
		
		List<Notice> noticeListFour = new ArrayList<Notice>();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
	    this.noticeListAll=noticeService.getNoticeAll();
	    session.setAttribute("noticeListFour", noticeListAll);
//	    if(noticeListAll!=null){
//	    /*	//获取最新的3个
//		    for(int i=0;i<=2;i++){
//		    	noticeListFour.add(noticeListAll.get(i));
//		    }*/
//		    
//	    }else{
//	    	
//	    }
		return "toMain";
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

	
}
