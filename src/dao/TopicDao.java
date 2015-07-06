package dao;

import java.util.List;

import entity.PageBean;
import entity.Topic;

public interface TopicDao {
	public List findTopicByPage(PageBean pageBean, Topic topic);

	public int countTopicByPage(PageBean pageBean, Topic topic);

	public int deleteTopic(String delIds);

	public int addTopic(Topic topic);

	public int updateTopic(Topic topic);

}
