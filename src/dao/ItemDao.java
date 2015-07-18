package dao;

import java.util.List;

import entity.Cart;
import entity.Item;
import entity.Order;

public interface ItemDao {

	public List getItemByUser(int userId);

	public Item findItem(Item item);

	public int addItem(Item item);

	public int addCart(Cart cart, Order order);

	public int updateItemById(Item item);

	public int updateItemByUser(Item item);

	public int deleteItem(String delIds);

	public int deleteItemByUser(Item item);

	public int clearItem(int userId);

	public int orderByUsersId(Item item);

	public Double checkMoney(int userId);

}
