package com.estore.action.back;

import java.util.List;

import com.estore.service.IMoneyService;
import com.landicorp.core.action.BaseActionSupport;
import com.estore.entities.Money;

public class MoneyAction extends BaseActionSupport {
	
	private IMoneyService moneyService;
	private List<Money> moneyList;
	private Money money;
	
	
	public String loadMoney(){
		
		
		moneyList = this.moneyService.getAll(null,super.getPager());
		
		return "loadMoney";
	}
	
	public String addPrepare(){
		this.money = null;
		
		return "addPrepare";
	}
	
	public String addMoney(){
		
		this.moneyService.add(money);
		
		return "addMoney";
	}
	
	public String updatePrepare(){
		
		this.money = this.moneyService.getById(this.money.getId());
		
		return "updatePrepare";
	}
	public String updateMoney(){
		
		this.moneyService.update(this.money);
		
		return "updateMoney";
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

	public Money getMoney() {
		return money;
	}
	public void setMoney(Money money) {
		this.money = money;
	}
}
