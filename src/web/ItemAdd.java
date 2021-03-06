package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import dao.GoodsDao;
import dao.ItemDao;
import dao.impl.GoodsDaoImpl;
import dao.impl.ItemDaoImpl;
import entity.Cart;
import entity.Goods;
import entity.Item;
import entity.Users;

public class ItemAdd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("user");
		String goodsId = request.getParameter("goodsId");
		GoodsDao goodsDao = new GoodsDaoImpl();
		/**
		 * session购物车操作（未登录用户）
		 */
		if (users == null) {
			Cart cart = (Cart) session.getAttribute("cart");
			if (cart == null) {
				cart = new Cart();
				session.setAttribute("cart", cart);
			}
			Goods goods = goodsDao.findById(Integer.parseInt(goodsId));
			cart.add(goods);
			obj.put("success", true);
			out.println(obj);
			out.flush();
			out.close();
			return;
		}

		Item item = new Item();
		item.setGoodsId(Integer.parseInt(goodsId));
		item.setCount(1);
		item.setUserId(users.getUserId());
		ItemDao itemDao = new ItemDaoImpl();
		int result = 0;

		Item i = itemDao.findItem(item);
		if (i == null) {
			result = itemDao.addItem(item);
		} else {
			i.setCount(i.getCount() + 1);
			result = itemDao.updateItemById(i);
		}

		if (result > 0) {
			obj.put("success", true);
		} else {
			obj.put("success", false);
		}
		out.println(obj);
		out.flush();
		out.close();
	}
}
