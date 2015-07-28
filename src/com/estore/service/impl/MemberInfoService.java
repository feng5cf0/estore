package com.estore.service.impl;

import com.estore.dao.IMemberInfoDao;
import com.estore.entities.MemberInfo;
import com.estore.service.IMemberInfoService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class MemberInfoService extends AbstractBaseServiceImpl<MemberInfo, Integer> implements IMemberInfoService{
	private IMemberInfoDao iMemberInfoDao;
	@Override
	public MemberInfo getMemberInfoById(Integer id){
		return iMemberInfoDao.getMemberInfoById(id);
	}
	public void memberRegister(MemberInfo memberInfo){
		iMemberInfoDao.memberRegister(memberInfo);
	}
	
	@Override
	public IMyBatisDao<MemberInfo, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
