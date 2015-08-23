package com.estore.action.front;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.estore.email.Mail;
import com.estore.email.MailSender;
import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.entities.Member;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.estore.service.impl.MemberServiceImpl;
import com.estore.util.JsonUtil;
import com.estore.util.Property;
import com.opensymphony.xwork2.ActionSupport;

public class ForgetPassAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private ICategoryService categoryService;
	private Member member;
	private MemberServiceImpl memberService;
	Property pro=new Property();
	
	private IBrandService brandService;
	private List<Brand> brandList;

	//跳转到忘记密码-填写账户名界面
	public String towjmmTXZHM(){
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "towjmmTXZHM";
	}
	//跳转到忘记密码-验证身份界面
	public String towjmmYZSF() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setContentType("utf-8");
		String email = request.getParameter("email").replace("%40", "@");
		
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		if(email!=null && !"".equals(email)){
			Mail mailInfo = new Mail();   
			mailInfo.setMailServerHost("smtp.sina.com");    
		    mailInfo.setMailServerPort("25");    
		    mailInfo.setValidate(true);    
		    mailInfo.setUserName("apex_test@sina.com");    
		    mailInfo.setPassword("apex_test");
		    mailInfo.setFromAddress("apex_test@sina.com");    
		    mailInfo.setToAddress(email);    
		    mailInfo.setSubject("设置新密码，邮箱验证");    
		    mailInfo.setContent("<a href='#'>点击激活！</a>");  
		    MailSender.sendTextMail(mailInfo);
		    pro.put("flag", "1");
		    pro.put("email", email);
		    pro.put("msg", "发送成功");
		    out.print(JsonUtil.getJsonStrByMap(pro));
		}else{
			pro.put("flag", "-1");
		    pro.put("msg", "没有邮箱地址!");
		    out.print(JsonUtil.getJsonStrByMap(pro));
		}
	     return null;
	}
	//跳转到忘记密码-设置新密码界面
	public String wjmmszxmm(){
		return "towjmmSZXMM";
	}
	public String towjmmSZXMM() throws Exception{
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		response.setContentType("utf-8"); 
		String newpass = request.getParameter("newpass");
		String memberId = request.getParameter("memberId");
		if(newpass!=null || !"".equals(newpass) || memberId!=null || !"".equals(memberId)){
			memberService.updatePassword(newpass, Integer.parseInt(memberId));
			pro.put("success", "success");
			out.print(JsonUtil.getJsonStrByMap(pro));
		}else{
			pro.put("success", "fail");
			out.print(JsonUtil.getJsonStrByMap(pro));
		}
		
		return null;
	}
	//跳转到忘记密码-完成界面
	public String towjmmWC(){
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
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
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public MemberServiceImpl getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberServiceImpl memberService) {
		this.memberService = memberService;
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
	
}
