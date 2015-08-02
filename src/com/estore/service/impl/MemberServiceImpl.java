/**
 * 
 */
package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		//根据id删除一条会员记录
		public void deleteMember(int id){
			memberDao.delete(id);
		}
		//根据登录名和登录密码查找member
		public Member findMemberByPassName(String memberAlias,String memberPassword){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberAlias", memberAlias);
			map.put("memberPassword", memberPassword);
			return memberDao.findMemberByPassName(map);
		}
		//密码修改
		public void updatePassword(String memberPassword,Integer id){
			Member member = new Member();
			member.setMemberPassword(memberPassword);
			member.setId(id);
			memberDao.passmodify(member);
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
