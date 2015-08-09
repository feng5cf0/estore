package com.estore.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.estore.dao.ICategoryDao;
import com.estore.entities.Category;
import com.estore.service.ICategoryService;
import com.estore.util.Locale;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;
import com.landicorp.core.web.pager.Pager;

public class CategoryServiceImpl extends AbstractBaseServiceImpl<Category, Integer> implements ICategoryService{

	private ICategoryDao categoryDao ;
	
	@Override
	public IMyBatisDao<Category, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return this.categoryDao;
	}

	@Override
	public List<Category> getByParentId(Integer parentId,Pager pager) {

		Map<String,Object> map = new HashMap<String,Object>();
		
		if(pager != null){
			pager.setTotalCount(this.categoryDao.getByParentIdCount(parentId));
		}
		
		map.put("parentId", parentId);
		map.put("pager", pager);
		
		return this.categoryDao.getByParentId(map);
	}
	
	@Override
	public List<Category> getForTree() {
		
		return this.categoryDao.getForTree();
	}
	
	@Override
	public List<Category> getAll(Category category, Pager pager) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(pager != null ){
			pager.setTotalCount(this.categoryDao.getAllCount(category));
		}
		
		map.put("category", category);
		map.put("pager", pager);
		
		return this.categoryDao.getAll(map);
	}
	
	@Override
	public List<Category> getForFront() {
		
		return this.categoryDao.getForFront();
	}

	@Override
	public List<Category> getLocaleById(Integer categoryId,Integer localeType) {

		Map<String,Object> map = new HashMap<String,Object>();
		
		map.put("categoryId", categoryId);
		map.put("localeType", localeType);
		
		return this.categoryDao.getLocaleById(map);
	}
	
	@Override
	public void addLocale(Category category) {

		this.categoryDao.savaLocale(category);
	}
	public ICategoryDao getCategoryDao() {
		return categoryDao;
	}
	public void setCategoryDao(ICategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}









}
