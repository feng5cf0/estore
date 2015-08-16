package com.estore.action.back;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Category;
import com.estore.entities.Member;
import com.estore.entities.MemberInfo;
import com.estore.service.ICategoryService;
import com.estore.service.IMemberInfoService;
import com.estore.service.IMemberService;
import com.estore.util.JsonUtil;
import com.estore.util.Property;
import com.estore.util.YzmUtil;
import com.landicorp.core.action.BaseActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class MemberAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IMemberService memberService;
	private IMemberInfoService memberInfoService;
	private Member member;
	private MemberInfo memberInfo;
	private List<Member> memberList;
	private int memberId;
	private String memberAlias;//登录账号
	private String memberPassword;//登录密码
	private String yzm;//验证码
	Property pro=new Property();
	
	public MemberAction() {
	}
	//跳转到首页
	public String toMain(){
		
		return "main";
	}
	//跳转到登录页面
	public String toMemberLoginPage(){
		return "toLoginPage";
	}
	//跳转到注册页面
	public String toMemberRegisterPage(){
		return "toRegisterPage";
	}
	//跳转到个人中心
	public String toMemberCenterPage(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		if(session.getAttribute("member")==null){
			return "toLoginPage";
		}else{
			return "toMemberCenterPage";
		}
	}
	//会员注册
	public String memberRegister(){
		this.memberService.SaveMember(member);
		return "success";
	}	
	//会员登录
	public String memberLogin() throws Exception{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response =ServletActionContext.getResponse();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		Member members=memberService.findMemberByPassName(memberAlias, memberPassword);
		if(members!=null){
			if(memberAlias.equals(members.getMemberAlias()) 
			&& memberPassword.equals(members.getMemberPassword()) 
			&& members.getIsEmailAvaliable()==0){
				session.setAttribute("member", members);
				pro.put("success", "success");
				pro.put("successMsg", "登录成功");
				out.print(JsonUtil.getJsonStrByMap(pro));
				return null;
			}else{
				pro.put("error", "error");
				pro.put("errorMsg", "用户名或密码错误");
				out.print(JsonUtil.getJsonStrByMap(pro));
				return null;
				
			}
		}else{
				pro.put("error", "error");
				pro.put("errorMsg", "用户数据为空");
				out.print(JsonUtil.getJsonStrByMap(pro));
				return null;
		}
	}
	//会员退出
	public String logout(){
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		return "logout";
	}
	//修改密码
	public String passModify() throws IOException{
		HttpServletResponse response =ServletActionContext.getResponse();
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		if("".equals(memberPassword) || "".equals(memberId)){
			pro.put("error", "error");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
		memberService.updatePassword(memberPassword,memberId);
		session.removeAttribute("member");
		pro.put("success", "success");
		out.print(JsonUtil.getJsonStrByMap(pro));
		return null;
	}
	//个人信息修改
	public String UpdateMember(){
		memberService.updateMember(member);
		memberInfo.setBirthday(new Date());
		memberInfo.setEmail("12346@qq.com");
		memberInfoService.memberInfoUpdate(memberInfo);
		return "memberUpdate";
	}
	//查询所有会员信息
	public String memberSearch(){
	    memberList = this.memberService.searchMemberAll();
		ActionContext.getContext().getSession().put("memberList", memberList);
		getRequest().put("memberList", memberList);
		return "searchMemberAll";
	}
	//根据id删除一条会员记录
	public String memberDelete(){
		int id = memberId;
		this.memberService.deleteMember(memberId);
		return "deleteMember";
	}
	//忘记密码-填写账户名
	public String wjmmTxzhm() throws Exception{
		HttpServletResponse response =ServletActionContext.getResponse();
		PrintWriter out = response.getWriter();
		HttpServletRequest request = ServletActionContext.getRequest();

		if(!YzmUtil.checkYzm(yzm, request.getSession().getId())){
			pro.put("error", "error");
			pro.put("errorMsg", "验证码错误");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
		member = memberService.getMemberByName(memberAlias);
		if(member==null){
			pro.put("error", "error");
			pro.put("errorMsg", "该用户不存在！");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}
		JSONObject json = new JSONObject();
		JSONObject memberjson = new JSONObject();
		memberjson = json.fromObject(member);
		pro.put("success", "success");
		pro.put("memberjson", memberjson);
		out.print(JsonUtil.getJsonStrByMap(pro));
		return null;
	}
	
	
	public IMemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(IMemberService memberService) {
		this.memberService = memberService;
	}
	public Member getMember() {
		return member;
	}
	public void setMember(Member member) {
		this.member = member;
	}
	public List<Member> getMemberList() {
		return memberList;
	}
	public void setMemberList(List<Member> memberList) {
		this.memberList = memberList;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public MemberInfo getMemberInfo() {
		return memberInfo;
	}

	public void setMemberInfo(MemberInfo memberInfo) {
		this.memberInfo = memberInfo;
	}

	public String getMemberAlias() {
		return memberAlias;
	}

	public void setMemberAlias(String memberAlias) {
		this.memberAlias = memberAlias;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public IMemberInfoService getMemberInfoService() {
		return memberInfoService;
	}
	public void setMemberInfoService(IMemberInfoService memberInfoService) {
		this.memberInfoService = memberInfoService;
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
