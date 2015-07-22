package com.estore.dao;

import java.util.List;

import com.estore.entities.Member;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IMemberDao extends IMyBatisDao<Member, Integer>{
		public int save(Member member);
		public List<Member> searchMemberAll();
		
}
