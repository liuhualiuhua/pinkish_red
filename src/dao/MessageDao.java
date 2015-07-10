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
	 * ��ȡ��������δ������Ϣ(�������Լ���)
	 * @param messageId ���һ����������ϢID
	 * @return
	 */
	public List getUnReadMessage(Message message);

	public int addMessage(Message message);

	public int deleteMessage(String delIds);

	public int updateMessage(Message message);

}
