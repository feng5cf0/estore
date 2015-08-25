package com.estore.action.front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Location;
import com.estore.service.ILocationService;
import com.estore.service.ITransformFeeService;
import com.opensymphony.xwork2.ActionSupport;

public class LocationFrontAction extends ActionSupport {
	
	private ILocationService locationService;
	private String pcode;
	private String code;
	private ITransformFeeService transformFeeService;
	public void getCountry(){
		
		List<Location> locationList = this.locationService.getCountryByCode("000000");
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for(int i = 0;i<locationList.size();i++){
			sb.append("{");
			
			sb.append("\"code\":\""+locationList.get(i).getCode()+"\",\"name\":\""+locationList.get(i).getName()+"\"");
			
			sb.append("}");
			
			if(i < locationList.size()-1){
				sb.append(",");
			}
		}
		sb.append("]");
		
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print(sb.toString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return "getCountry";
	}
	public void getProvince(){
		
		List<Location> locationList = this.locationService.getProvinceByCode(this.pcode);
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for(int i = 0;i<locationList.size();i++){
			sb.append("{");
			
			sb.append("\"code\":\""+locationList.get(i).getCode()+"\",\"name\":\""+locationList.get(i).getName()+"\"");
			
			sb.append("}");
			
			if(i < locationList.size()-1){
				sb.append(",");
			}
		}
		sb.append("]");		

		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print(sb.toString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return "getCountry";
	}
	public void getCity(){
		
		List<Location> locationList = this.locationService.getCityByCode(this.pcode);
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for(int i = 0;i<locationList.size();i++){
			sb.append("{");
			
			sb.append("\"code\":\""+locationList.get(i).getCode()+"\",\"name\":\""+locationList.get(i).getName()+"\"");
			
			sb.append("}");
			
			if(i < locationList.size()-1){
				sb.append(",");
			}
		}
		sb.append("]");		
		
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print(sb.toString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return "getCountry";
	}
	public void getArea(){
		
		List<Location> locationList = this.locationService.getAreaByCode(this.pcode);
		
		StringBuffer sb = new StringBuffer();
		sb.append("[");
		for(int i = 0;i<locationList.size();i++){
			sb.append("{");
			
			sb.append("\"code\":\""+locationList.get(i).getCode()+"\",\"name\":\""+locationList.get(i).getName()+"\"");
			
			sb.append("}");
			
			if(i < locationList.size()-1){
				sb.append(",");
			}
		}
		sb.append("]");
		
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print(sb.toString());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//return "getCountry";
	}
	public void getPrice(){
		Float price = this.transformFeeService.getPriceByCode(code);
		
		try {
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			PrintWriter out = ServletActionContext.getResponse().getWriter();
			out.print(price);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ILocationService getLocationService() {
		return locationService;
	}
	public void setLocationService(ILocationService locationService) {
		this.locationService = locationService;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public ITransformFeeService getTransformFeeService() {
		return transformFeeService;
	}
	public void setTransformFeeService(ITransformFeeService transformFeeService) {
		this.transformFeeService = transformFeeService;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

}
