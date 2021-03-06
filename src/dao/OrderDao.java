package dao;

import java.util.List;
import java.util.Map;

import com.alibaba.fastjson.JSONArray;

import entity.Order;
import entity.PageBean;

public interface OrderDao {

	public List getList(PageBean pageBean, Order order,Map map);
	
	public int getCount(PageBean pageBean, Order order,Map map);

	public List getDetail(Order order);

	public int update(Order order);

	public int add(Order order);

	public int delete(String delIds);
	
	public int commitOrder(String ids);
	
	public int resetOrder(String ids);
	
	public int comfirmOrder(String ids);
	
	public JSONArray getDetailResultSet(Order order);

}
