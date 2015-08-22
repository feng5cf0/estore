package com.estore.service;

import java.util.List;

import com.estore.entities.TechnicalArticle;
import com.landicorp.core.service.base.IBaseService;

public interface ITechnicalArticleService extends IBaseService<TechnicalArticle, Integer>{
	public void addTechnicalArticle(TechnicalArticle technicalArticle);
	public void updateTechnicalArticle(TechnicalArticle technicalArticle);
	public List<TechnicalArticle> getTechnicalArticle();
	public List<TechnicalArticle> pagingSearch();
	public void deleteTechnicalArticle(Integer id);
	public TechnicalArticle getTechById(Integer id);
	public List<TechnicalArticle> getTechMHCX(TechnicalArticle technicalArticle);//模糊查询
}
