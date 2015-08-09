package com.estore.action.front;

import java.util.List;

import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.landicorp.core.action.BaseActionSupport;

public class ForgetPassAction extends BaseActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	

	//跳转到忘记密码-填写账户名界面
	public String towjmmTXZHM(){
		this.categoryList = this.categoryService.getForFront();
		return "towjmmTXZHM";
	}
	//跳转到忘记密码-验证身份界面
	public String towjmmYZSF(){
		this.categoryList = this.categoryService.getForFront();
		return "towjmmYZSF";
	}
	//跳转到忘记密码-设置新密码界面
	public String towjmmSZXMM(){
		this.categoryList = this.categoryService.getForFront();
		return "towjmmSZXMM";
	}
	//跳转到忘记密码-完成界面
	public String towjmmWC(){
		this.categoryList = this.categoryService.getForFront();
		return "towjmmWC";
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
