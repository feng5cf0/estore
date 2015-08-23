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
import com.estore.entities.customerSer;
import com.estore.service.ICategoryService;
import com.estore.service.ICustomerSerService;
import com.estore.service.INoticeService;
import com.opensymphony.xwork2.ActionSupport;
public class MainAction extends ActionSupport {
	
	/**hzp
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private List<Notice> noticeListAll;
	private List<customerSer> customerSerList;
	
	private ICustomerSerService customerSerService;
	private ICategoryService categoryService;
	private INoticeService noticeService;
	private IBrandService brandService;
	private List<Brand> brandList;
	//跳转到前端首页
	public String toMain(){
		
		List<Notice> noticeListFour = new ArrayList<Notice>();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		
		//分类
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
	    this.noticeListAll=noticeService.getNoticeAll();
	    //公告
		this.noticeListAll=noticeService.getNoticeAll();
	    //客服
	    this.customerSerList = customerSerService.getCustomerSer();
	    
	    session.setAttribute("noticeListFour", noticeListAll);
	    session.setAttribute("customerSerList", customerSerList);
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

	public List<customerSer> getCustomerSerList() {
		return customerSerList;
	}

	public void setCustomerSerList(List<customerSer> customerSerList) {
		this.customerSerList = customerSerList;
	}

	public ICustomerSerService getCustomerSerService() {
		return customerSerService;
	}

	public void setCustomerSerService(ICustomerSerService customerSerService) {
		this.customerSerService = customerSerService;
	}


	
}
