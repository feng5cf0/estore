package com.estore.action.front;

import java.util.Date;
import java.util.List;

import com.estore.entities.BankAccount;
import com.estore.entities.Brand;
import com.estore.entities.Category;
import com.estore.service.IBankAccountService;
import com.estore.service.IBrandService;
import com.estore.service.ICategoryService;
import com.opensymphony.xwork2.ActionSupport;

public class BankAccountAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Category> categoryList;
	private List<BankAccount> bankAccountList;
	private ICategoryService categoryService;
	private IBankAccountService bankAccountService;
	private BankAccount bankAccount;
	private IBrandService brandService;
	private List<Brand> brandList;
	public String toMain(){
		
		this.categoryList = this.categoryService.getForFront();
		
		return "toMain";
	}
	//跳转到银行账户页面
	public String toBankAccount(){
		this.categoryList = this.categoryService.getForFront();
		this.brandList = this.brandService.getAll();
		return "toBankAccount";
	}
	//后台跳转到银行账户添加页面
	public String toAddBankAccount(){
		return "toAddBankAccount";
	}
	//添加银行账户
	public String addBankAccount(){
		bankAccount.setCreateTime(new Date());
		bankAccountService.addBankAccount(bankAccount);
		return "addSuccess";
	}
	//查询银行账户列表
	public String getBankAccountAll(){
		this.bankAccountList=bankAccountService.getBankAccountAll();
		return "bankAccountSearch";
	}
	
	
	public IBankAccountService getBankAccountService() {
		return bankAccountService;
	}

	public void setBankAccountService(IBankAccountService bankAccountService) {
		this.bankAccountService = bankAccountService;
	}
	public BankAccount getBankAccount() {
		return bankAccount;
	}
	public void setBankAccount(BankAccount bankAccount) {
		this.bankAccount = bankAccount;
	}
	
	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public ICategoryService getCategoryService() {
		return categoryService;
	}
	public void setCategoryService(ICategoryService categoryService) {
		this.categoryService = categoryService;
	}
	public List<BankAccount> getBankAccountList() {
		return bankAccountList;
	}
	public void setBankAccountList(List<BankAccount> bankAccountList) {
		this.bankAccountList = bankAccountList;
	}
	public IBrandService getBrandService() {
		return brandService;
	}
	public void setBrandService(IBrandService brandService) {
		this.brandService = brandService;
	}
	public List<Brand> getBrandList() {
		return brandList;
	}
	public void setBrandList(List<Brand> brandList) {
		this.brandList = brandList;
	}
	

}
