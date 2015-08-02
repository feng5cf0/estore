package com.estore.action.back;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;














import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.estore.entities.Member;
import com.estore.entities.MemberInfo;
import com.estore.service.IMemberService;
import com.estore.util.JsonUtil;
import com.estore.util.Property;
import com.landicorp.core.action.BaseActionSupport;
import com.landicorp.core.util.StringUtil;
import com.opensymphony.xwork2.ActionContext;

public class MemberAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IMemberService memberService;
	private Member member;
	private MemberInfo memberInfo;
	private List<Member> memberList;
	private int memberId;
	private String memberAlias;//登录账号
	private String memberPassword;//登录密码
	Property pro=new Property();
	public MemberAction() {
		// TODO Auto-generated constructor stub
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
		Member member=memberService.findMemberByPassName(memberAlias, memberPassword);
		if(memberAlias.equals(member.getMemberAlias()) 
		&& memberPassword.equals(member.getMemberPassword()) 
		&& member.getIsEmailAvaliable()==0){
			session.setAttribute("member", member);
			pro.put("success", "success");
			out.print(JsonUtil.getJsonStrByMap(pro));
			return null;
		}else{
			pro.put("error", "error");
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
	//查询所有会员信息
	public String memberSearch(){
	    memberList = this.memberService.searchMemberAll();
		ActionContext.getContext().getSession().put("memberList", memberList);
		return "searchMemberAll";
	}
	//根据id删除一条会员记录
	public String memberDelete(){
		int id = memberId;
		this.memberService.deleteMember(memberId);
		return "deleteMember";
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
	
	
	
	
	
}
