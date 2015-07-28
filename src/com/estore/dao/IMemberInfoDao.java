package com.estore.dao;

import com.estore.entities.MemberInfo;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IMemberInfoDao extends IMyBatisDao<MemberInfo, Integer>{
	public MemberInfo getMemberInfoById(Integer id);
	public void memberRegister(MemberInfo memberInfo);//会员注册
}
