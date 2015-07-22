/**
 * 
 */
package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IMemberDao;
import com.estore.entities.Member;
import com.estore.service.IMemberService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;

/**
 * @author Administrator
 *
 */
public class MemberServiceImpl extends AbstractBaseServiceImpl<Member, Integer> implements
		IMemberService {
	private IMemberDao memberDao;
	  //用户注册
		@Override
		public void SaveMember(Member member) {
		     memberDao.save(member);

		}
		//查询所有用户信息
		public List<Member> searchMemberAll(){
			return memberDao.searchMemberAll();
		}
	
	

	@Override
	public int add(Member member) {
		return memberDao.save(member);
	}

	@Override
	public void delete(Member arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(Integer[] arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteList(List<Member> arg0) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<Member> get(Member arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> getAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> getAll(Member arg0, Pager arg1) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Member> getAll(Member arg0, String arg1, Pager arg2) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member getById(Integer arg0) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getCount(Member arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean haveSimilar(Integer arg0, String arg1, Object arg2) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void update(Member arg0) {
		// TODO Auto-generated method stub

	}
	
	

	@Override
	public IMyBatisDao<Member, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return memberDao;
	}
	public IMemberDao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(IMemberDao memberDao) {
		this.memberDao = memberDao;
	}

}
