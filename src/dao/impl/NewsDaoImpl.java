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

	/**
	 * ÕûºÏ
	 */
	public List findList() {
		List list = new ArrayList();
		try {
			conn = this.getConn();
			String sql = "select top 3 * from news order by newsId desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				News news = new News();
				news.setNewsId(rs.getInt("newsId"));
				news.setTitle(rs.getString("Title"));
				list.add(news);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int findCountNews(int newsId) {
		int i = 0;
		try {
			conn = this.getConn();
			String sql = "select count( * )from news";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				i = rs.getInt(1);
			}
			i = i % 10 == 0 ? i / 10 : i / 10 + 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public List findListNews(int page) {
		List list = new ArrayList();
		int begin = (page - 1) * 10;
		try {
			String sql = "select top 10 * from news "
					+ "where newsId not in(select top "
					+ begin
					+ " newsId from news order by newsId desc ) order by newsId desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				News news = new News();
				news.setNewsId(rs.getInt("NewsId"));
				news.setTitle(rs.getString("Title"));
				news.setPostTime(rs.getString("postTime"));
				list.add(news);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public News findNews(int newsId, String adc) {
		News news = null;
		String sql;
		try {
			conn = this.getConn();
			if (adc == null || adc.equals("") || adc.equals("b")) {
				sql = "select top 1 * from news where newsId>=" + newsId;
			} else {
				sql = "select top 1 * from news where newsId<=" + newsId
						+ " order by newsId desc";
			}
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				news = new News();
				news.setNewsId(rs.getInt("newsId"));
				news.setTitle(rs.getString("Title"));
				news.setPostTime(rs.getString("PostTime"));
				news.setContent(rs.getString("Content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return news;
	}

}
