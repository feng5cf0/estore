package com.estore.action.back;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.customerSer;
import com.estore.service.ICustomerSerService;
import com.estore.util.JsonUtil;
import com.estore.util.Property;
import com.landicorp.core.action.BaseActionSupport;

public class CustomerSerAction extends BaseActionSupport {

	/**
	 * 2015 08 16
	 * hzp
	 * 客服action
	 */
	private static final long serialVersionUID = 1L;
	private ICustomerSerService customerSerService;
	private customerSer customerSer;
	List<customerSer> customerSerList;
	private Integer id;
	Property pro=new Property();
	//获取客服列表
	public String getCustomerSerAll(){
		this.customerSerList =  customerSerService.getCustomerSer();
		return "getcustomerSer";
	}
	//跳转到添加页面
	public String toAdd(){
		return "toadd";
	}
	//跳转到修改页面
	public String toUpdate(){
		customerSer = customerSerService.getCustomerSerById(id);
		return "toUpdate";
	}
	//跳转到修改页面
	public String detail(){
		customerSer = customerSerService.getCustomerSerById(id);
		return "toDetail";
	}
	
	//添加
	public String  addCustomerSer() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		PrintWriter out = response.getWriter();
		String vqqcode = request.getParameter("vqqCode");
		String qqcode = URLDecoder.decode(vqqcode,"utf-8");
		customerSer.setQqCode(qqcode);
		if(customerSer!=null){
			customerSerService.addCustomerSer(customerSer);
			pro.put("msg", "success");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}else{
			pro.put("msg", "error");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
	}
	//删除
	public String  deleteCusSer() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		if(id!=null){
			customerSerService.deleteCusSer(id);
			pro.put("msg", "success");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}else{
			pro.put("msg", "error");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
	}
	//更新
		public String  updateCustomerSer() throws Exception{
			HttpServletResponse response =ServletActionContext.getResponse();
			HttpServletRequest request = ServletActionContext.getRequest();
			String vqqcode = request.getParameter("vqqCode");
			String qqcode = URLDecoder.decode(vqqcode,"utf-8");
			PrintWriter out = response.getWriter();
			if(customerSer!=null){
				customerSer.setQqCode(qqcode);
				customerSerService.updateCusSer(customerSer);
				pro.put("msg", "success");
				out.print(JsonUtil.getJsonStrByMap(pro));
				return null;
			}else{
				pro.put("msg", "error");
				out.print(JsonUtil.getJsonStrByMap(pro));
				return null;
			}
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
	public customerSer getCustomerSer() {
		return customerSer;
	}
	public void setCustomerSer(customerSer customerSer) {
		this.customerSer = customerSer;
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
