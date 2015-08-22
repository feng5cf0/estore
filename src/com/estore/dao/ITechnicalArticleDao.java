package com.estore.dao;

import java.util.List;
import com.estore.entities.TechnicalArticle;
import com.landicorp.core.dao.base.IMyBatisDao;
public interface ITechnicalArticleDao extends IMyBatisDao<TechnicalArticle, Integer>{

	public void addTechnicalArticle(TechnicalArticle technicalArticle);//添加文章
	public void updateTechnicalArticle(TechnicalArticle technicalArticle);//更新文章
	public List<TechnicalArticle> getTechMHCX(TechnicalArticle technicalArticle);//模糊查询
	public void deleteTechnicalArticle(Integer id);//删除
	public TechnicalArticle getTechById(Integer id);//根据id获取
	public List<TechnicalArticle> getTechnicalArticle();//获取全部
	public List<TechnicalArticle> pagingSearch();
}
