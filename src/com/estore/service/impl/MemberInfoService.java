package com.estore.service.impl;

import com.estore.dao.IMemberInfoDao;
import com.estore.entities.MemberInfo;
import com.estore.service.IMemberInfoService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class MemberInfoService extends AbstractBaseServiceImpl<MemberInfo, Integer> implements IMemberInfoService{
	private IMemberInfoDao 	memberInfoDao;
	@Override
	public void memberInfoUpdate(MemberInfo memberInfo){
		memberInfoDao.memberInfoUpdate(memberInfo);
	}
	@Override
	public MemberInfo getMemberInfoById(Integer id){
		return memberInfoDao.getMemberInfoById(id);
	}
	@Override
	public void memberRegister(MemberInfo memberInfo){
		memberInfoDao.memberRegister(memberInfo);
	}
	@Override
	public void changePhoto(String photoPath,Integer id){
		MemberInfo memberInfo=new MemberInfo();
		memberInfo.setId(id);
		memberInfo.setPhotoPath(photoPath);
		memberInfoDao.changePhoto(memberInfo);
	}
	@Override
	public IMyBatisDao<MemberInfo, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return this.memberInfoDao;
	}
	public IMemberInfoDao getMemberInfoDao() {
		return memberInfoDao;
	}
	public void setMemberInfoDao(IMemberInfoDao memberInfoDao) {
		this.memberInfoDao = memberInfoDao;
	}
	
	
}
