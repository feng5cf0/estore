package com.estore.action.front;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Category;
import com.estore.entities.OnlineMsg;
import com.estore.service.ICategoryService;
import com.estore.service.IOnlineMsgService;
import com.estore.util.JsonUtil;
import com.estore.util.Property;
import com.estore.util.YzmUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class OnlineMsgAction extends ActionSupport{

	/**
	 * 在线留言
	 * hzp
	 * 2015-08-08
	 */
	private static final long serialVersionUID = 1L;
	private OnlineMsg onlineMsg;
	private IOnlineMsgService onlineMsgService;
	List<OnlineMsg> onlineMsgList = new ArrayList<OnlineMsg>();
	private List<Category> categoryList;
	private ICategoryService categoryService;
	Property pro=new Property();
	private String yzm;
	
	//跳转到在线留言页面
	public String toOnLine(){
		this.categoryList = this.categoryService.getForFront();	
			
			return "toonline";
	}
	//在线留言
	public String addOnlineMsg() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter out = response.getWriter();
		
		if(!YzmUtil.checkYzm(yzm, request.getSession().getId())){
			pro.put("error", "error");
			pro.put("errorMsg", "验证码错误");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
		if(onlineMsg!=null){
			this.categoryList = this.categoryService.getForFront();
			onlineMsg.setCreateTime(new Date());
			onlineMsgService.addOnlineMsg(onlineMsg);
			pro.put("success", "success");
			pro.put("errorMsg", "验证码错误");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
		return null;
	}
	//后台显示
	public String getOnlineMsgAll(){
		onlineMsgList=onlineMsgService.getOnlineMsgAll();
		ActionContext.getContext().getSession().put("onlineMsgList", onlineMsgList);

		return "getOnlineMsg";
	}
	public OnlineMsg getOnlineMsg() {
		return onlineMsg;
	}
	public void setOnlineMsg(OnlineMsg onlineMsg) {
		this.onlineMsg = onlineMsg;
	}
	public IOnlineMsgService getOnlineMsgService() {
		return onlineMsgService;
	}
	public void setOnlineMsgService(IOnlineMsgService onlineMsgService) {
		this.onlineMsgService = onlineMsgService;
	}
	public List<OnlineMsg> getOnlineMsgList() {
		return onlineMsgList;
	}
	public void setOnlineMsgList(List<OnlineMsg> onlineMsgList) {
		this.onlineMsgList = onlineMsgList;
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
	public Property getPro() {
		return pro;
	}
	public void setPro(Property pro) {
		this.pro = pro;
	}
	public String getYzm() {
		return yzm;
	}
	public void setYzm(String yzm) {
		this.yzm = yzm;
	}
	
	
	
	
}
