package dao;

import java.util.List;
import java.util.Map;

import entity.Message;
import entity.PageBean;
import entity.Users;

public interface MessageDao {

	public List findMessageByPage(PageBean pageBean, Message message, Map map);

	public int countMessageByPage(PageBean pageBean, Message message, Map map);
	/**
	 * 获取聊天室内未读的消息(不包括自己的)
	 * @param messageId 最后一条读过的消息ID
	 * @return
	 */
	public List getUnReadMessage(Message message);

	public int addMessage(Message message);

	public int deleteMessage(String delIds);

	public int updateMessage(Message message);

}
