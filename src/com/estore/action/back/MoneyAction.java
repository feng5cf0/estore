package com.estore.action.back;

import java.util.List;

import com.estore.service.IMoneyService;
import com.landicorp.core.action.BaseActionSupport;
import com.estore.entities.Money;

public class MoneyAction extends BaseActionSupport {
	
	private IMoneyService moneyService;
	private List<Money> moneyList;
	
	public String loadMoney(){
		
		moneyList = this.moneyService.getAll();
		
		return "loadMoney";
	}

	public IMoneyService getMoneyService() {
		return moneyService;
	}
	public void setMoneyService(IMoneyService moneyService) {
		this.moneyService = moneyService;
	}
	public List<Money> getMoneyList() {
		return moneyList;
	}
	public void setMoneyList(List<Money> moneyList) {
		this.moneyList = moneyList;
	}
	
	
	
}
