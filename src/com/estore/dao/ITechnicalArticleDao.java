package com.estore.dao;

import java.util.List;
import java.util.Map;

import com.estore.entities.TechnicalArticle;
import com.landicorp.core.dao.base.IMyBatisDao;

public interface ITechnicalArticleDao extends IMyBatisDao<TechnicalArticle, Integer>{

	public void addTechnicalArticle(TechnicalArticle technicalArticle);
	public List<TechnicalArticle> getTechnicalArticle();
	public List<TechnicalArticle> pagingSearch();
}
