package com.estore.dao;

import java.util.List;

import com.estore.entities.BankAccount;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface IBankAccountDao extends IMyBatisDao<BankAccount, Integer>{

	public void addBankAccount(BankAccount bankAccount);
	public List<BankAccount> getBankAccountAll();
}
