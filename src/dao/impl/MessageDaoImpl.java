package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringEscapeUtils;

import dao.MessageDao;
import entity.Message;
import entity.PageBean;

public class MessageDaoImpl extends BaseDao implements MessageDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List findMessageByPage(PageBean pageBean, Message message, Map map) {
		List list = new ArrayList();

		StringBuffer sb = new StringBuffer("select top " + pageBean.getRows()
				+ " * from MESSAGE where messageId not in(select top "
				+ pageBean.getStart() + " messageId from MESSAGE ");

		if (message.getContent() != null) {
			sb.append(" and content like '%" + message.getContent() + "%' ");
		}
		if (message.getUserName() != null) {
			sb.append(" and userName like '%" + message.getUserName() + "%' ");
		}
		if (message.getUserId() != 0) {
			sb.append(" and userId =" + message.getUserId() + " ");
		}
		if (message.getPostTime() != null) {
			sb.append(" and postTime > '" + message.getPostTime() + "' ");
		}
		if (map != null && map.get("postTime2") != null) {
			sb.append(" and postTime < '" + map.get("postTime2") + "' ");
		}
		if (message.getMessageId() != 0) {
			sb.append(" and messageId =" + message.getMessageId() + " ");
		}
		sb.append(" order by messageId desc) ");
		if (message.getContent() != null) {
			sb.append(" and content like '%" + message.getContent() + "%' ");
		}
		if (message.getUserName() != null) {
			sb.append(" and userName like '%" + message.getUserName() + "%' ");
		}
		if (message.getUserId() != 0) {
			sb.append(" and userId =" + message.getUserId() + " ");
		}
		if (message.getPostTime() != null) {
			sb.append(" and postTime > '" + message.getPostTime() + "' ");
		}
		if (map != null && map.get("postTime2") != null) {
			sb.append(" and postTime < '" + map.get("postTime2") + "' ");
		}
		if (message.getMessageId() != 0) {
			sb.append(" and messageId =" + message.getMessageId() + " ");
		}
		sb.append(" order by messageId desc ");
		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Message m = new Message();
				m.setMessageId(rs.getInt(1));
				String content = rs.getString(2);
				/**
				 * 如果不是聊天室请求，则转义输出
				 */
				if (pageBean.getRows() != 15) {
					content = StringEscapeUtils.escapeHtml(content);
				}
				m.setContent(content);
				m.setPostTime(rs.getString(3));
				m.setUserId(rs.getInt(4));
				m.setUserName(rs.getString(5));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int countMessageByPage(PageBean pageBean, Message message, Map map) {
		int total = 0;
		StringBuffer sb = new StringBuffer("select count(*) from MESSAGE ");
		if (message.getContent() != null) {
			sb.append(" and content like '%" + message.getContent() + "%' ");
		}
		if (message.getUserName() != null) {
			sb.append(" and userName like '%" + message.getUserName() + "%' ");
		}
		if (message.getUserId() != 0) {
			sb.append(" and userId =" + message.getUserId() + " ");
		}
		if (message.getPostTime() != null) {
			sb.append(" and postTime > '" + message.getPostTime() + "' ");
		}
		if (map != null && map.get("postTime2") != null) {
			sb.append(" and postTime < '" + map.get("postTime2") + "' ");
		}
		if (message.getMessageId() != 0) {
			sb.append(" and messageId =" + message.getMessageId() + " ");
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
	public int addMessage(Message message) {
		int result = 0;

		try {
			conn = super.getConn();
			String sql = "insert into MESSAGE values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getContent());
			pstmt.setString(2, message.getPostTime());
			pstmt.setInt(3, message.getUserId());
			pstmt.setString(4, message.getUserName());
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
	public int deleteMessage(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "delete from MESSAGE where messageId in (" + delIds
					+ ") ";
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
	public int updateMessage(Message message) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update MESSAGE set content=? where messageId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getContent());
			pstmt.setInt(2, message.getMessageId());
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
	public List getUnReadMessage(Message message) {
		List list = new ArrayList();

		try {
			conn = super.getConn();
			String sql = "select * from MESSAGE where messageId > ? and userId !=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, message.getMessageId());
			pstmt.setInt(2, message.getUserId());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Message m = new Message();
				m.setMessageId(rs.getInt(1));
				m.setContent(rs.getString(2));
				m.setPostTime(rs.getString(3));
				m.setUserId(rs.getInt(4));
				m.setUserName(rs.getString(5));
				list.add(m);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return list;
	}

}
