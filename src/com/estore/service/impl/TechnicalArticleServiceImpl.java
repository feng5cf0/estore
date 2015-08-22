package com.estore.service.impl;

import java.util.List;

import com.estore.dao.ITechnicalArticleDao;
import com.estore.entities.TechnicalArticle;
import com.estore.service.ITechnicalArticleService;
import com.landicorp.core.dao.base.IMyBatisDao;
import com.landicorp.core.service.base.AbstractBaseServiceImpl;

public class TechnicalArticleServiceImpl extends AbstractBaseServiceImpl<TechnicalArticle, Integer> 
		implements ITechnicalArticleService{
	private ITechnicalArticleDao technicalArticleDao;
	
	/*
	 * 模糊查询
	 * */
	
	
	@Override
	public List<TechnicalArticle> getTechMHCX(TechnicalArticle technicalArticle) {
		// TODO Auto-generated method stub
		return technicalArticleDao.getTechMHCX(technicalArticle);
	}
	
	@Override
	public TechnicalArticle getTechById(Integer id) {
		return technicalArticleDao.getTechById(id);
		
	}
	
	@Override
	public void updateTechnicalArticle(TechnicalArticle technicalArticle) {
		technicalArticleDao.updateTechnicalArticle(technicalArticle);
		
	}
	@Override
	public void deleteTechnicalArticle(Integer id) {
		technicalArticleDao.deleteTechnicalArticle(id);
		
	}
	@Override
	public List<TechnicalArticle> pagingSearch() {
		return technicalArticleDao.pagingSearch();
	}
	@Override
	public void addTechnicalArticle(TechnicalArticle technicalArticle) {
		technicalArticleDao.addTechnicalArticle(technicalArticle);
		
	}
	@Override
	public List<TechnicalArticle> getTechnicalArticle() {
		return technicalArticleDao.getTechnicalArticle();
	}
	@Override
	public IMyBatisDao<TechnicalArticle, Integer> getMyBatisDao() {
		// TODO Auto-generated method stub
		return this.technicalArticleDao;
	}

	public ITechnicalArticleDao getTechnicalArticleDao() {
		return technicalArticleDao;
	}

	public void setTechnicalArticleDao(ITechnicalArticleDao technicalArticleDao) {
		this.technicalArticleDao = technicalArticleDao;
	}

	
	
	
	

	
	


}
