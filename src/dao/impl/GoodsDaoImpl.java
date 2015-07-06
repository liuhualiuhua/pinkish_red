package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import dao.GoodsDao;
import entity.Goods;
import entity.PageBean;

public class GoodsDaoImpl extends BaseDao implements GoodsDao {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public List findGoodsByPage(PageBean pageBean, Goods goods, Map map) {
		List list = new ArrayList();
		StringBuffer sb = new StringBuffer("select top " + pageBean.getRows()
				+ " *  from GOODS where goodsId not in(select top "
				+ pageBean.getStart() + " goodsId from GOODS ");
		if (goods.getName() != null) {
			sb.append(" and name like '%" + goods.getName() + "%' ");
		}
		if (goods.getBrand() != null) {
			sb.append(" and brand like '%" + goods.getBrand() + "%' ");
		}
		if (goods.getType() != null) {
			sb.append(" and type like '%" + goods.getType() + "%' ");
		}
		if (goods.getDescription() != null) {
			sb.append(" and description like '%" + goods.getDescription()
					+ "%' ");
		}
		if (goods.getPrice() != 0.0) {
			sb.append(" and price > " + goods.getPrice() + " ");
		}
		String price=(String)map.get("price");
		if (price != null) {
			sb.append(" and price < " + Double.parseDouble(price) + " ");
		}
		if (goods.getGoodsId() != 0) {
			sb.append(" and goodsId = " + goods.getGoodsId() + " ");
		}
		String order=(String) map.get("order");
		if(order!=null&&order.equals("asc")){
			sb.append("order by price asc");
		}else if(order!=null&&order.equals("desc")){
			sb.append("order by price desc");
		}
		sb.append(" ) ");
		if (goods.getName() != null) {
			sb.append(" and name like '%" + goods.getName() + "%' ");
		}
		if (goods.getBrand() != null) {
			sb.append(" and brand like '%" + goods.getBrand() + "%' ");
		}
		if (goods.getType() != null) {
			sb.append(" and type like '%" + goods.getType() + "%' ");
		}
		if (goods.getDescription() != null) {
			sb.append(" and description like '%" + goods.getDescription()
					+ "%' ");
		}
		if (goods.getPrice() != 0.0) {
			sb.append(" and price > " + goods.getPrice() + " ");
		}
		if (price != null) {
			sb.append(" and price < " + Double.parseDouble(price) + " ");
		}
		if (goods.getGoodsId() != 0) {
			sb.append(" and goodsId = " + goods.getGoodsId() + " ");
		}
		if(order!=null&&order.equals("asc")){
			sb.append(" order by price asc");
		}else if(order!=null&&order.equals("desc")){
			sb.append(" order by price desc");
		}

		try {
			conn = super.getConn();
			System.out.println(sb.toString().replaceFirst("and", "where"));
			pstmt = conn.prepareStatement(sb.toString().replaceFirst("and",
					"where"));
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
		
		return list;
	}

	@Override
	public int countGoodsByPage(PageBean pageBean, Goods goods, Map map) {
		int total = 0;

		StringBuffer sb = new StringBuffer("select count(*) from GOODS ");
		if (goods.getName() != null) {
			sb.append(" and name like '%" + goods.getName() + "%' ");
		}
		if (goods.getBrand() != null) {
			sb.append(" and brand like '%" + goods.getBrand() + "%' ");
		}
		if (goods.getType() != null) {
			sb.append(" and type like '%" + goods.getType() + "%' ");
		}
		if (goods.getDescription() != null) {
			sb.append(" and description like '%" + goods.getDescription()
					+ "%' ");
		}
		if (goods.getPrice() != 0.0) {
			sb.append(" and price > " + goods.getPrice() + " ");
		}
		String price=(String) map.get("price");
		if (price != null) {
			sb.append(" and price < " + Double.parseDouble(price) + " ");
		}
		if (goods.getGoodsId() != 0) {
			sb.append(" and goodsId = " + goods.getGoodsId() + " ");
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
	public int deleteGoodsByIds(String delIds) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "delete from GOODS where goodsId in (" + delIds + ") ";
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
	public int addGoods(Goods goods) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "insert into GOODS values (?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goods.getName());
			pstmt.setString(2, goods.getBrand());
			pstmt.setString(3, goods.getType());
			pstmt.setString(4, goods.getDescription());
			pstmt.setDouble(5, goods.getPrice());
			pstmt.setString(6, goods.getPic());
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
	public int updateGoods(Goods goods) {
		int result = 0;
		try {
			conn = super.getConn();
			String sql = "update GOODS set name=?,brand=?,type=?,description=?,price=?,pic=? where goodsId=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, goods.getName());
			pstmt.setString(2, goods.getBrand());
			pstmt.setString(3, goods.getType());
			pstmt.setString(4, goods.getDescription());
			pstmt.setDouble(5, goods.getPrice());
			pstmt.setString(6, goods.getPic());
			pstmt.setInt(7, goods.getGoodsId());
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
