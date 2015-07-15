package dao;

import java.util.List;
import java.util.Map;

import entity.Goods;
import entity.PageBean;

public interface GoodsDao {
	/**
	 * ��ҳ��������ѯ��Ʒ�б�
	 */
	public List findGoodsByPage(PageBean pageBean, Goods goods, Map map);

	public int countGoodsByPage(PageBean pageBean, Goods goods, Map map);
	/**
	 * ����ɾ��
	 */
	public int deleteGoodsByIds(String delIds);

	public int addGoods(Goods goods);

	public int updateGoods(Goods goods);

	public Goods findById(int goodsId);
}
