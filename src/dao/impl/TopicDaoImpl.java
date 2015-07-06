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
	public int addTopic(Topic topic) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into TOPIC values (?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, topic.getTitle());
			pstmt.setString(2, topic.getContent());
			pstmt.setInt(3, topic.getUserId());
			pstmt.setInt(4, topic.getReplyId());
			pstmt.setString(5, topic.getPostTime());
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

}
