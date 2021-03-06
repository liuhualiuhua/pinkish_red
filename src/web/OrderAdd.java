package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import dao.ItemDao;
import dao.OrderDao;
import dao.impl.ItemDaoImpl;
import dao.impl.OrderDaoImpl;
import entity.*;

public class OrderAdd extends HttpServlet {

	private static final long serialVersionUID = 1L;

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
		OrderDao orderDao = new OrderDaoImpl();
		ItemDao itemDao = new ItemDaoImpl();
		Order order = new Order();
		Cart cart = (Cart) session.getAttribute("cart");
		/**
		 * 这个功能还需要仔细思考一下
		 */
		/*if (cart != null) {
			
			
			obj.put("success", true);
			out.println(obj);
			out.flush();
			out.close();
			return;
		}*/
		

		Double price = itemDao.checkMoney(users.getUserId());
		if (price <= 0.0) {
			obj.put("success", false);
			out.println(obj);
			out.flush();
			out.close();
			return;
		}

		order.setUserId(users.getUserId());
		order.setPostTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));
		order.setStatus("已提交");
		order.setPrice(price);

		int orderId = orderDao.add(order);
		int result = 0;
		if (orderId > 0) {
			Item item = new Item();
			item.setUserId(users.getUserId());
			item.setStatus(orderId);
			result = itemDao.orderByUsersId(item);
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
