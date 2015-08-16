package com.estore.service.impl;

import java.util.List;

import com.estore.dao.IBankAccountDao;
import com.estore.entities.BankAccount;
import com.estore.service.IBankAccountService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class BankAccountServiceImpl extends AbstractBaseServiceImpl<BankAccount, Integer> 
	implements IBankAccountService{
	private IBankAccountDao bankAccountDao;
	//添加银行账号
	@Override
	public void addBankAccount(BankAccount bankAccount) {
		// TODO Auto-generated method stub
		bankAccountDao.addBankAccount(bankAccount);
	}
	//查询列表
	@Override
	public List<BankAccount> getBankAccountAll() {
		return bankAccountDao.getBankAccountAll();
	}
	
	
	@Override
	public IMyBatisDao<BankAccount, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return bankAccountDao;
	}

	public IBankAccountDao getBankAccountDao() {
		return bankAccountDao;
	}

	public void setBankAccountDao(IBankAccountDao bankAccountDao) {
		this.bankAccountDao = bankAccountDao;
	}


	
	

}
