package com.estore.service;

import com.estore.entities.MemberInfo;
import com.landicorp.core.service.base.IBaseService;

public interface IMemberInfoService extends IBaseService<MemberInfo, Integer>{

		public MemberInfo getMemberInfoById(Integer id);
		public void memberRegister(MemberInfo memberInfo);
}
