package com.estore.action.back;

import java.util.Date;

import com.estore.entities.Member;
import com.estore.service.IMemberService;
import com.landicorp.core.action.BaseActionSupport;

public class MemberAction extends BaseActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private IMemberService memberService;
	private Member member;
	public MemberAction() {
		// TODO Auto-generated constructor stub
	}
	//会员注册
	public String memberRegister(){
		
		System.out.println(member);
		this.memberService.SaveMember(member);
		return "success";
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
	
	
}
