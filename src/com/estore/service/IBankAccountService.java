package com.estore.service;

import java.util.List;

import com.estore.entities.BankAccount;
import com.landicorp.core.service.base.IBaseService;

public interface IBankAccountService extends IBaseService<BankAccount, Integer> {
		public void addBankAccount(BankAccount bankAccount);
		public List<BankAccount> getBankAccountAll();
		public void updateBankAccount(BankAccount bankAccount);
}
