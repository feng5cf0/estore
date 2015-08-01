package com.estore.dao;

import java.util.List;
import java.util.Map;

import com.estore.entities.Member;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IMemberDao extends IMyBatisDao<Member, Integer>{
		public int save(Member member);
		public List<Member> searchMemberAll();
		public int delete(int id);
		public Member findMemberByPassName(Map<String, Object> map);
}
