package com.estore.action.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Favorite;
import com.estore.entities.Member;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.IFavoriteService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class FavoriteAction extends ActionSupport {
	
	private List<Category> categoryList;
	private ICategoryService categoryService;
	private IBrandService brandService;
	private List<Brand> brandList;
	
	private Favorite favorite;
	private IFavoriteService favoriteService;
	private List<Favorite> favoriteList;
	private Integer favoriteId;
	
	public String add(){
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.containsHeader("utf-8");
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		if(member == null){
			out.print("tologin");
			return null;
		}
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		if(favorite != null){
			favorite.setMemberId(member.getId());
			favorite.setStatus(1);
		}
		
		this.favoriteService.add(favorite);
		out.print("success");
		return null;
	}
	
	public String get(){
		
		//判断是否登录
		Map<String,Object> session = ActionContext.getContext().getSession();
		Member member = (Member)session.get("member");
		if(member == null){
			return "login";
		}
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();		
		
		this.favoriteList = this.favoriteService.getByMemberId(member.getId());
		
		return "get";
	}
	
	public String delete(){
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		
		this.favoriteService.deleteFavorite(favoriteId);
		
		return "delete";
	}

	public Favorite getFavorite() {
		return favorite;
	}
	public void setFavorite(Favorite favorite) {
		this.favorite = favorite;
	}
	public IFavoriteService getFavoriteService() {
		return favoriteService;
	}
	public void setFavoriteService(IFavoriteService favoriteService) {
		this.favoriteService = favoriteService;
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
	public List<Favorite> getFavoriteList() {
		return favoriteList;
	}
	public void setFavoriteList(List<Favorite> favoriteList) {
		this.favoriteList = favoriteList;
	}
	public Integer getFavoriteId() {
		return favoriteId;
	}
	public void setFavoriteId(Integer favoriteId) {
		this.favoriteId = favoriteId;
	}
}
