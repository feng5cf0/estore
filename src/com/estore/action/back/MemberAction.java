package com.estore.action.back;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.estore.entities.Member;
import com.estore.entities.Money;
import com.estore.service.IMemberService;
import com.landicorp.core.action.BaseActionSupport;
import com.opensymphony.xwork2.ActionContext;

public class MemberAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IMemberService memberService;
	private Member member;
	private List<Member> memberList;
	private int memberId;
	public MemberAction() {
		// TODO Auto-generated constructor stub
	}
	//会员注册
	public String memberRegister(){
		
		this.memberService.SaveMember(member);
		return "success";
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
	
	
	
	
}
