package com.estore.action.front;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.TechnicalArticle;
import com.estore.service.impl.TechnicalArticleServiceImpl;
import com.estore.util.JsonUtil;
import com.estore.util.Property;
import com.opensymphony.xwork2.ActionSupport;

public class TechnicalArticleAction extends ActionSupport{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private TechnicalArticleServiceImpl technicalArticleService;
	private TechnicalArticle technicalArticle;
	private List<TechnicalArticle> technicalArticlelist;
	private Integer id;
	Property pro=new Property();
	//添加技术文章
	public String addTechnicalArticle() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		if(technicalArticle!=null){
				this.technicalArticleService.addTechnicalArticle(technicalArticle);
				pro.put("success", "success");
				out.print(JsonUtil.getJsonStrByMap(pro));
		}else{
				pro.put("error", "error");
				pro.put("errorMsg", "没有添加的数据！");
				out.print(JsonUtil.getJsonStrByMap(pro));
		}
		return null;
	}
	//获取技术文章
	public String getTechnicalArticles(){
		this.technicalArticlelist=this.technicalArticleService.getTechnicalArticle();
		return "getTechnicalArticle";
	}
	//后台跳转到技术文章添加页面
	public String toAddTechnicalArticle(){
		return "toAddTechnicalArticle";
	}
	//后台跳转到技术文章修改页面
	public String toUpdateTechnicalArticle(){
		this.technicalArticle=technicalArticleService.getTechById(id);
		return "toUpdateTechnicalArticle";
	}
	//分页获取技术文章
	public String pagingSearch(){
		this.technicalArticlelist=this.technicalArticleService.pagingSearch();
		return null;
	}
	//删除
	public String delete() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		if(id!=null){
			technicalArticleService.deleteTechnicalArticle(id);
			pro.put("msg", "success");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}else{
			pro.put("msg", "error");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
	}
	//修改
	public String update() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		if(technicalArticle!=null){
			technicalArticleService.updateTechnicalArticle(technicalArticle);
			pro.put("msg", "success");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}else{
			pro.put("msg", "error");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
	}
	//模糊查询
	public String searchMHCX() throws Exception{
//		HttpServletResponse response =ServletActionContext.getResponse();
//		PrintWriter out = response.getWriter();
		technicalArticlelist=technicalArticleService.getTechMHCX(technicalArticle);
//		pro.put("msg", "success");
//		out.print(JsonUtil.getJsonStrByMap(pro));
		return "searchList";
	}
	public TechnicalArticleServiceImpl getTechnicalArticleService() {
		return technicalArticleService;
	}
	public void setTechnicalArticleService(
			TechnicalArticleServiceImpl technicalArticleService) {
		this.technicalArticleService = technicalArticleService;
	}
	

	public List<TechnicalArticle> getTechnicalArticlelist() {
		return technicalArticlelist;
	}
	public void setTechnicalArticlelist(List<TechnicalArticle> technicalArticlelist) {
		this.technicalArticlelist = technicalArticlelist;
	}
	public TechnicalArticle getTechnicalArticle() {
		return technicalArticle;
	}
	public void setTechnicalArticle(TechnicalArticle technicalArticle) {
		this.technicalArticle = technicalArticle;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Property getPro() {
		return pro;
	}
	public void setPro(Property pro) {
		this.pro = pro;
	}
	
	
	
	
	
}
