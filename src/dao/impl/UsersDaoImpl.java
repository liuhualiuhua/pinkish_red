package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.UsersDao;
import entity.PageBean;
import entity.Users;

public class UsersDaoImpl extends BaseDao implements UsersDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List findUsersByPage(PageBean pageBean, Users users) {
		List list = new ArrayList();

		StringBuffer sb = new StringBuffer("select top " + pageBean.getRows()
				+ " * from USERS where userId not in(select  top "
				+ pageBean.getStart() + " userId  from USERS  ");

		if (users.getName() != null) {
			sb.append("and name like '%" + users.getName() + "%'");
		}
		if (users.getRole() != -1) {
			sb.append("and role = " + users.getRole() + "");
		}
		if (users.getUserId() != 0) {
			sb.append("and userId = " + users.getUserId() + "");
		}
		sb.append(") ");
		if (users.getName() != null) {
			sb.append("and name like '%" + users.getName() + "%'");
		}
		if (users.getRole() != -1) {
			sb.append("and role = " + users.getRole() + "");
		}
		if (users.getUserId() != 0) {
			sb.append("and userId = " + users.getUserId() + "");
		}
		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Users u = new Users();
				u.setUserId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPass(rs.getString(3));
				u.setRole(rs.getInt(4));
				u.setHead(rs.getString(5));
				list.add(u);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return list;
	}

	@Override
	public int countUsersByPage(PageBean pageBean, Users users) {
		int total = 0;

		StringBuffer sb = new StringBuffer("select count(*) from USERS ");

		if (users.getName() != null) {
			sb.append("and name like '%" + users.getName() + "%'");
		}
		if (users.getRole() != -1) {
			sb.append("and role = " + users.getRole() + "");
		}
		if (users.getUserId() != 0) {
			sb.append("and userId = " + users.getUserId() + "");
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
	public int deleteUsersByIds(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "delete from USERS where userId in (" + delIds + ") ";
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
	public int addUsers(Users users) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into USERS values (?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setString(2, users.getPass());
			pstmt.setInt(3, users.getRole());
			pstmt.setString(4, users.getHead());
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
	public int updateUsers(Users users) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update USERS set name=?,pass=?,role=?,head=? where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setString(2, users.getPass());
			pstmt.setInt(3, users.getRole());
			pstmt.setString(4, users.getHead());
			pstmt.setInt(5, users.getUserId());
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
	public Users login(Users users) {
		Users u = null;
		try {
			conn = super.getConn();
			String sql = "select * from USERS where name=? and pass=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, users.getName());
			pstmt.setString(2, users.getPass());
			System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				u = new Users();
				u.setUserId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPass(rs.getString(3));
				u.setRole(rs.getInt(4));
				u.setHead(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return u;
	}

	@Override
	public Users findById(int userId) {
		Users u = null;
		try {
			conn = super.getConn();
			String sql = "select * from USERS where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				u = new Users();
				u.setUserId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPass(rs.getString(3));
				u.setRole(rs.getInt(4));
				u.setHead(rs.getString(5));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}
		return u;
	}

}
