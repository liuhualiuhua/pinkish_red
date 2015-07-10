package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import dao.NewsDao;
import entity.News;
import entity.PageBean;

public class NewsDaoImpl extends BaseDao implements NewsDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List findNewsByPage(PageBean pageBean, News news, String time) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer("select top " + pageBean.getRows()
				+ " * from NEWS where newsId not in(select top "
				+ pageBean.getStart() + " newsId from NEWS ");
		if (news.getTitle() != null) {
			sb.append(" and title like '%" + news.getTitle() + "%'");
		}
		if (news.getContent() != null) {
			sb.append(" and content like '%" + news.getContent() + "%'");
		}
		if (news.getPostTime() != null) {
			sb.append(" and postTime > '" + news.getPostTime() + "'");
		}
		if (time != null) {
			sb.append(" and postTime < '" + time + "'");
		}
		if (news.getNewsId() != 0) {
			sb.append(" and newsId =" + news.getNewsId() + "");
		}
		sb.append(" order by newsId desc) ");
		if (news.getTitle() != null) {
			sb.append(" and title like '%" + news.getTitle() + "%'");
		}
		if (news.getContent() != null) {
			sb.append(" and content like '%" + news.getContent() + "%'");
		}
		if (news.getPostTime() != null) {
			sb.append(" and postTime > '" + news.getPostTime() + "'");
		}
		if (time != null) {
			sb.append(" and postTime < '" + time + "'");
		}
		if (news.getNewsId() != 0) {
			sb.append(" and newsId =" + news.getNewsId() + "");
		}
		sb.append(" order by newsId desc");

		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				News n = new News();
				n.setNewsId(rs.getInt(1));
				n.setTitle(rs.getString(2));
				n.setContent(rs.getString(3));
				n.setPostTime(rs.getString(4));
				n.setUserId(rs.getInt(5));
				list.add(n);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int countNewsByPage(PageBean pageBean, News news, String time) {
		int total = 0;
		StringBuffer sb = new StringBuffer("select count(*) from NEWS ");

		if (news.getTitle() != null) {
			sb.append(" and title like '%" + news.getTitle() + "%'");
		}
		if (news.getContent() != null) {
			sb.append(" and content like '%" + news.getContent() + "%'");
		}
		if (news.getPostTime() != null) {
			sb.append(" and postTime > '" + news.getPostTime() + "'");
		}
		if (time != null) {
			sb.append(" and postTime < '" + time + "'");
		}
		if (news.getNewsId() != 0) {
			sb.append(" and newsId =" + news.getNewsId() + "");
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
	public int deleteNewsByIds(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "delete from NEWS where newsId in (" + delIds + ") ";
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
	public int addNews(News news) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into NEWS values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, news.getTitle());
			pstmt.setString(2, news.getContent());
			pstmt.setString(3, news.getPostTime());
			pstmt.setInt(4, news.getUserId());
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
	public int updateNews(News news) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update NEWS set title=?,content=? where newsId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, news.getTitle());
			pstmt.setString(2, news.getContent());
			pstmt.setInt(3, news.getNewsId());
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
	public News get(int newsId, String abc) {
		String sql;

		if (abc == null || abc.equals("b")) {
			sql = "select top 1 * from NEWS where newsId>=? ";
		} else if (abc.equals("a")) {
			sql = "select top 1 * from NEWS where newsId<=? order by newsId desc";
		}

		return null;
	}

}
