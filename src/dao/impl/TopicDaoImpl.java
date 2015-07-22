package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.TopicDao;
import entity.PageBean;
import entity.Topic;

public class TopicDaoImpl extends BaseDao implements TopicDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List findTopicByPage(PageBean pageBean, Topic topic) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer("select top " + pageBean.getRows()
				+ " *  from TOPIC where topicId not in(select top "
				+ pageBean.getStart() + " topicId from TOPIC  ");

		if (topic.getTitle() != null) {
			sb.append(" and title like '%" + topic.getTitle() + "%' ");
		}
		if (topic.getContent() != null) {
			sb.append(" and content like '%" + topic.getContent() + "%' ");
		}
		if (topic.getReplyId() != -1) {
			sb.append(" and replyId =" + topic.getReplyId() + " ");
		}
		if (topic.getUserId() != 0) {
			sb.append(" and userId=" + topic.getUserId() + " ");
		}
		if (topic.getTopicId() != 0) {
			sb.append("and  topicId=" + topic.getTopicId() + " ");
		}
		sb.append(" ) ");
		if (topic.getTitle() != null) {
			sb.append(" and title like '%" + topic.getTitle() + "%' ");
		}
		if (topic.getContent() != null) {
			sb.append(" and content like '%" + topic.getContent() + "%' ");
		}
		if (topic.getReplyId() != -1) {
			sb.append(" and replyId =" + topic.getReplyId() + " ");
		}
		if (topic.getUserId() != 0) {
			sb.append(" and userId=" + topic.getUserId() + " ");
		}
		if (topic.getTopicId() != 0) {
			sb.append("and  topicId=" + topic.getTopicId() + " ");
		}

		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Topic t = new Topic();
				t.setTopicId(rs.getInt(1));
				t.setTitle(rs.getString(2));
				t.setContent(rs.getString(3));
				t.setUserId(rs.getInt(4));
				t.setReplyId(rs.getInt(5));
				t.setPostTime(rs.getString(6));
				t.setUserName(rs.getString(7));
				list.add(t);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int countTopicByPage(PageBean pageBean, Topic topic) {
		int total = 0;
		StringBuffer sb = new StringBuffer("select count(*) from TOPIC ");

		if (topic.getTitle() != null) {
			sb.append(" and title like '%" + topic.getTitle() + "%'");
		}
		if (topic.getContent() != null) {
			sb.append(" and content like '%" + topic.getContent() + "%'");
		}
		if (topic.getReplyId() != -1) {
			sb.append(" and replyId =" + topic.getReplyId() + " ");
		}
		if (topic.getUserId() != 0) {
			sb.append(" and userId=" + topic.getUserId() + " ");
		}
		if (topic.getTopicId() != 0) {
			sb.append(" and topicId=" + topic.getTopicId() + " ");
		}

		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				total = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return total;
	}

	@Override
	public int deleteTopic(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "delete from TOPIC where topicId in (" + delIds + ") ";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int addTopics(Topic topic) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into TOPIC values (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, topic.getTitle());
			pstmt.setString(2, topic.getContent());
			pstmt.setInt(3, topic.getUserId());
			pstmt.setInt(4, topic.getReplyId());
			pstmt.setString(5, topic.getPostTime());
			pstmt.setString(6, topic.getUserName());
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return result;
	}

	@Override
	public int updateTopic(Topic topic) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update TOPIC set title=?,content=? where topicId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, topic.getTitle());
			pstmt.setString(2, topic.getContent());
			pstmt.setInt(3, topic.getTopicId());
			System.out.println(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return result;
	}

	/**
	 * 整合
	 */
	public List findList(int page) {
		List list = new ArrayList();
		int begin = (page - 1) * 5;
		try {
			conn = this.getConn();
			String sql = "select top 5 * from TOPIC "
					+ "where replyId=0 and topicId not in(select top "
					+ begin
					+ " "
					+ "topicId from TOPIC where replyId=0 order by topicId desc ) order by topicId desc";
			pstmt = conn.prepareStatement(sql);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicId(rs.getInt("topicId"));
				topic.setContent(rs.getString("content"));
				topic.setTitle(rs.getString("title"));
				topic.setUserId(rs.getInt("userId"));
				topic.setReplyId(rs.getInt("replyId"));
				topic.setPostTime(rs.getString("PostTime"));
				topic.setUserName(rs.getString("userName"));
				list.add(topic);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	public int findCountTopic(int TopicId) {
		int i = 0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from TOPIC where replyId="+0;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()){
				i = rs.getInt(1);
			}
			i = i % 5 == 0 ? i / 5 : i / 5 + 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public Topic findTopic(int topicId) {
		Topic topic = new Topic();
		try {
			conn = super.getConn();
			String sql = "select * from TOPIC where topicId=" + topicId;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				topic.setTopicId(rs.getInt("topicId"));
				topic.setContent(rs.getString("content"));
				topic.setTitle(rs.getString("title"));
				topic.setUserId(rs.getInt("userId"));
				topic.setReplyId(rs.getInt("replyId"));
				topic.setPostTime(rs.getString("PostTime"));
				topic.setUserName(rs.getString("userName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return topic;
	}

	@Override
	public Topic findTopics(int replyId) {
		Topic topic = new Topic();
		try {
			conn = super.getConn();
			String sql = "select * from TOPIC where replyId=" + replyId;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				topic.setTopicId(rs.getInt("topicId"));
				topic.setContent(rs.getString("content"));
				topic.setTitle(rs.getString("title"));
				topic.setUserId(rs.getInt("userId"));
				topic.setReplyId(rs.getInt("replyId"));
				topic.setPostTime(rs.getString("PostTime"));
				topic.setUserName(rs.getString("userName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return topic;
	}

	@Override
	public List findListTop(int page, int topicId) {
		List list = new ArrayList();
		int begin = (page - 1) * 2;
		try {
			conn = this.getConn();
			String sql = "select top 2 * from TOPIC where topicId not in("
					+ "select top "+begin+" topicId from TOPIC where replyId=" +topicId+" order by replyId)and replyId=" + topicId+ " order by replyId";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicId(rs.getInt("topicId"));
				topic.setContent(rs.getString("content"));
				topic.setTitle(rs.getString("title"));
				topic.setUserId(rs.getInt("userId"));
				topic.setReplyId(rs.getInt("replyId"));
				topic.setPostTime(rs.getString("PostTime"));
				topic.setUserName(rs.getString("userName"));
				list.add(topic);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	public int addTopic(Topic topic) {
		int i = 0;
		try {
			conn = super.getConn();// 连接数据库
			String sql = "insert into TOPIC values(?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);// 执行sql

			pstmt.setString(1, topic.getTitle());
			pstmt.setString(2, topic.getContent());
			pstmt.setInt(3, topic.getUserId());
			pstmt.setInt(4, topic.getReplyId());
			pstmt.setString(5, topic.getPostTime());
			pstmt.setString(6, topic.getUserName());

			i = pstmt.executeUpdate();// 返回受影响的行数
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			this.closeAll(conn, pstmt, rs);
		}
		return i;
	}

	public List findListhui(int page) {
		List list = new ArrayList();
		int begin = (page - 1) * 5;
		try {
			conn = this.getConn();
			String sql = "select top 5 * from TOPIC "
					+ "where replyId>0 and topicId not in(select top "
					+ begin
					+ " "
					+ "topicId from TOPIC where replyId=0 order by topicId desc ) order by topicId desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Topic topic = new Topic();
				topic.setTopicId(rs.getInt("topicId"));
				topic.setContent(rs.getString("content"));
				topic.setTitle(rs.getString("title"));
				topic.setUserId(rs.getInt("userId"));
				topic.setReplyId(rs.getInt("replyId"));
				topic.setPostTime(rs.getString("PostTime"));
				topic.setUserName(rs.getString("userName"));
				list.add(topic);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public Topic finduserId(int UsersId) {
		Topic topic = new Topic();
		try {
			conn = super.getConn();
			String sql = "select * from TOPIC where usersId=" + UsersId;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				topic.setTopicId(rs.getInt("topicId"));
				topic.setContent(rs.getString("content"));
				topic.setTitle(rs.getString("title"));
				topic.setUserId(rs.getInt("userId"));
				topic.setReplyId(rs.getInt("replyId"));
				topic.setPostTime(rs.getString("PostTime"));
				topic.setUserName(rs.getString("userName"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return topic;
	}

	@Override
	public int findtopic(int TopicId) {
		int i =0;
		try {
			conn = this.getConn();
			String sql = "select count(*) from TOPIC where replyId="+TopicId;
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				i = rs.getInt(1);
			}
			i=i%2==0?i/2:i/2+1;
			if(i==0){
				i=1;
			}
			//System.out.println(i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

}
