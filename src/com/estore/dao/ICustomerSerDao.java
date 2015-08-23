package com.estore.dao;

import java.util.List;

import com.estore.entities.customerSer;
import com.landicorp.core.dao.base.IMyBatisDao;
/*
 * 2015 08 16
 * hzp
 * 客服
 */
public interface ICustomerSerDao extends IMyBatisDao<customerSer, Integer>{
		public List<customerSer> getCustomerSer();
		public void addCustomerSer(customerSer customerSer);
		public void updateCusSer(customerSer customerSer);
		public void deleteCusSer(Integer id);
		public customerSer getCustomerSerById(Integer id);
}
