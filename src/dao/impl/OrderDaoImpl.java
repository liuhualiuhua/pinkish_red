package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import util.StringUtil;
import dao.OrderDao;
import entity.Goods;
import entity.Order;
import entity.PageBean;

public class OrderDaoImpl extends BaseDao implements OrderDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List getList(PageBean pageBean, Order order, Map map) {
		List list = new ArrayList();

		StringBuffer sb = new StringBuffer("select top " + pageBean.getRows()
				+ " * from ORDERS where orderId not in(select top "
				+ pageBean.getStart() + " orderId from ORDERS ");
		if (order.getUserId() != 0) {
			sb.append(" and userId=" + order.getUserId() + " ");
		}
		if (order.getOrderId() != 0) {
			sb.append(" and orderId=" + order.getOrderId() + " ");
		}
		if (StringUtil.isNotEmpty(order.getStatus())) {
			sb.append(" and status ='" + order.getStatus() + "'");
		}
		if (order.getPrice() != 0.0) {
			sb.append(" and price >" + order.getPrice() + " ");
		}
		String price2 = (String) map.get("price2");
		if (StringUtil.isNotEmpty(price2)) {
			sb.append(" and price < " + price2 + " ");
		}
		if (order.getPostTime() != null) {
			sb.append(" and postTime >'" + order.getPostTime() + "' ");
		}
		String postTime2 = (String) map.get("postTime2");
		if (StringUtil.isNotEmpty(postTime2)) {
			sb.append(" and postTime < '" + postTime2 + "' ");
		}
		String sort = (String) map.get("sort2");
		if (StringUtil.isNotEmpty(sort)) {
			sb.append(sort);
		}else{
			sb.append("order by orderId desc ");
		}
		sb.append(" ) ");
		if (order.getUserId() != 0) {
			sb.append(" and userId=" + order.getUserId() + " ");
		}
		if (order.getOrderId() != 0) {
			sb.append(" and orderId=" + order.getOrderId() + " ");
		}
		if (StringUtil.isNotEmpty(order.getStatus())) {
			sb.append(" and status ='" + order.getStatus() + "'");
		}
		if (order.getPrice() != 0.0) {
			sb.append(" and price >" + order.getPrice() + " ");
		}
		if (StringUtil.isNotEmpty(price2)) {
			sb.append(" and price < " + price2 + " ");
		}
		if (order.getPostTime() != null) {
			sb.append(" and postTime >'" + order.getPostTime() + "' ");
		}
		if (StringUtil.isNotEmpty(postTime2)) {
			sb.append(" and postTime < '" + postTime2 + "' ");
		}
		if (StringUtil.isNotEmpty(sort)) {
			sb.append(sort);
		}else{
			sb.append("order by orderId desc ");
		}

		try {
			conn = super.getConn();
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			System.out.println(sb.toString().replaceFirst("and", "where"));
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Order o = new Order();
				o.setOrderId(rs.getInt(1));
				o.setUserId(rs.getInt(2));
				o.setPrice(rs.getDouble(3));
				o.setStatus(rs.getString(4));
				o.setPostTime(rs.getString(5));
				list.add(o);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return list;
	}

	@Override
	public int getCount(PageBean pageBean, Order order, Map map) {
		int total = 0;
		StringBuffer sb = new StringBuffer("select count(*) from ORDERS ");
		if (order.getUserId() != 0) {
			sb.append(" and userId=" + order.getUserId() + " ");
		}
		if (order.getOrderId() != 0) {
			sb.append(" and orderId=" + order.getOrderId() + " ");
		}
		if (StringUtil.isNotEmpty(order.getStatus())) {
			sb.append(" and status ='" + order.getStatus() + "'");
		}
		if (order.getPrice() != 0.0) {
			sb.append(" and price >" + order.getPrice() + " ");
		}
		String price2 = (String) map.get("price2");
		if (StringUtil.isNotEmpty(price2)) {
			sb.append(" and price < " + price2 + " ");
		}
		if (order.getPostTime() != null) {
			sb.append(" and postTime >'" + order.getPostTime() + "' ");
		}
		String postTime2 = (String) map.get("postTime2");
		if (StringUtil.isNotEmpty(postTime2)) {
			sb.append(" and postTime < '" + postTime2 + "' ");
		}
		try {
			conn = super.getConn();
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
			System.out.println(sb.toString().replaceFirst("and", "where"));
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
	public List getDetail(Order order) {
		List list = new ArrayList();
		try {
			conn = super.getConn();
			String sql = "select g.* from GOODS g,ITEM i,ORDERS o where g.goodsId=i.goodsId and i.status=o.orderId and o.orderId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, order.getOrderId());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Goods g = new Goods();
				g.setGoodsId(rs.getInt(1));
				g.setName(rs.getString(2));
				g.setBrand(rs.getString(3));
				g.setType(rs.getString(4));
				g.setDescription(rs.getString(5));
				g.setPrice(rs.getDouble(6));
				g.setPic(rs.getString(7));
				list.add(g);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return null;
	}

	@Override
	public int update(Order order) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update ORDERS set status=? where orderId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order.getStatus());
			pstmt.setInt(2, order.getOrderId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int add(Order order) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into ORDERS values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, order.getUserId());
			pstmt.setDouble(2, order.getPrice());
			pstmt.setString(3, order.getStatus());
			pstmt.setString(4, order.getPostTime());
			pstmt.executeUpdate();
			rs = pstmt.getGeneratedKeys();
			while (rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int delete(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "delete from ORDERS where orderId in ( " + delIds
					+ " )";
			System.out.print(sql);
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int commitOrder(String ids) {
		int result = 0;

		try {
			conn = super.getConn();
			String sql = "update ORDERS set status='已发货' where orderId in ("
					+ ids + ")";
			System.out.print(sql);
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int resetOrder(String ids) {
		int result = 0;

		try {
			conn = super.getConn();
			String sql = "update ORDERS set status='已退回' where orderId in ("
					+ ids + ")";
			System.out.print(sql);
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

	@Override
	public int comfirmOrder(String ids) {
		int result = 0;

		try {
			conn = super.getConn();
			String sql = "update ORDERS set status='交易成功' where orderId in ("
					+ ids + ")";
			System.out.print(sql);
			pstmt = conn.prepareStatement(sql);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			super.closeAll(conn, pstmt, rs);
		}

		return result;
	}

}
