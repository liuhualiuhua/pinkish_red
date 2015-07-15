package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dao.ItemDao;
import entity.Item;

public class ItemDaoImpl extends BaseDao implements ItemDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List getItemByUser(int userId) {
		List list = new ArrayList();

		try {
			conn = super.getConn();
			String sql = "select * from ITEM where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
			System.out.println(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Item item = new Item();
				item.setItemId(rs.getInt(1));
				item.setGoodsId(rs.getInt(2));
				item.setCount(rs.getInt(3));
				item.setUserId(rs.getInt(4));
				list.add(item);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return list;
	}

	@Override
	public Item findItem(Item item) {
		Item i = null;

		StringBuffer sb = new StringBuffer("select * from ITEM ");
		if (item.getItemId() != 0) {
			sb.append(" and  userId=" + item.getUserId() + " ");
		}
		if (item.getGoodsId() != 0) {
			sb.append(" and goodsId=" + item.getGoodsId() + " ");
		}
		if (item.getUserId() != 0) {
			sb.append(" and userId=" + item.getUserId() + " ");
		}
		try {
			conn = super.getConn();
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			System.out.println(sb.toString().replaceFirst("and", "where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				i = new Item();
				i.setItemId(rs.getInt(1));
				i.setGoodsId(rs.getInt(2));
				i.setCount(rs.getInt(3));
				i.setUserId(rs.getInt(4));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return i;
	}

	@Override
	public int addItem(Item item) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into ITEM values(?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item.getGoodsId());
			pstmt.setInt(2, item.getCount());
			pstmt.setInt(3, item.getUserId());
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
	public int updateItemById(Item item) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update ITEM set count=? where itemId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item.getCount());
			pstmt.setInt(2, item.getItemId());
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
	public int updateItemByUser(Item item) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update ITEM set count=? where userId=? and goodsId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item.getCount());
			pstmt.setInt(2, item.getUserId());
			pstmt.setInt(3, item.getGoodsId());
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
	public int deleteItem(String delIds) {
		int result = 0;

		try {
			conn = super.getConn();
			String sql = "delete from ITEM where itemId in (" + delIds + ")";
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
	public int deleteItemByUser(Item item){
		int result = 0;

		try {
			conn = super.getConn();
			String sql = "delete from ITEM where goodsId=? and userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, item.getGoodsId());
			pstmt.setInt(2, item.getUserId());
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
	public int clearItem(int userId) {
		int result = 0;

		try {
			conn = super.getConn();
			String sql = "delete from ITEM where userId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userId);
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
