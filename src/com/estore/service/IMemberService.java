package com.estore.service;

import com.estore.entities.Member;
import com.landicorp.core.service.base.IBaseService;

public interface IMemberService  extends IBaseService<Member, Integer>{
		public void SaveMember(Member member);
}
