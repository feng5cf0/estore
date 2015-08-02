package com.estore.service;

import java.util.List;

import com.estore.entities.Member;
import com.landicorp.core.service.base.IBaseService;

public interface IMemberService  extends IBaseService<Member, Integer>{
		public void SaveMember(Member member);
		public List<Member> searchMemberAll();
		public void deleteMember(int id);
		public Member findMemberByPassName(String memberAlias,String memberPassword);
		public void updatePassword(String memberPassword,Integer id);
}
