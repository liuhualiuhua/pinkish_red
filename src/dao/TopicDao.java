package dao;

import java.util.List;

import entity.PageBean;
import entity.Topic;

public interface TopicDao {
	public List findTopicByPage(PageBean pageBean, Topic topic);

	public int countTopicByPage(PageBean pageBean, Topic topic);

	public int deleteTopic(String delIds);

	public int addTopics(Topic topic);

	public int updateTopic(Topic topic);

	/**
	 * ÕûºÏ
	 */
	public List findList(int page);

	public int findCountTopic(int TopicId);

	public Topic findTopic(int topicId);

	public Topic findTopics(int replyId);

	public Topic finduserId(int UsersId);

	public List findListTop(int page, int topicId);

	public int addTopic(Topic topic);

	public List findListhui(int page);

}
