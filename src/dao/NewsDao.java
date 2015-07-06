package dao;

import java.util.List;

import entity.News;
import entity.PageBean;

public interface NewsDao {
	public List findNewsByPage(PageBean pageBean, News news, String time);

	public int countNewsByPage(PageBean pageBean, News news, String time);

	public int deleteNewsByIds(String delIds);

	public int addNews(News news);

	public int updateNews(News news);

}
