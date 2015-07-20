package dao;

import java.util.List;

import entity.PageBean;
import entity.Users;

public interface UsersDao {
	public List findUsersByPage(PageBean pageBean, Users users);

	public int countUsersByPage(PageBean pageBean, Users users);

	public int deleteUsersByIds(String delIds);

	public int addUsers(Users users);

	public int updateUsers(Users users);
	
	public Users login(Users users);
	
	public Users findById(int userId);
	
	public Users findByName(String name);
	
	public int changePass(Users users);
	
	public List searchUsersByName(String name);
	
	public int updateHead(Users users);
}
