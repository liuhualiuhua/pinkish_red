package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.JSONUtil;
import util.StringUtil;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import dao.OrderDao;
import dao.impl.OrderDaoImpl;
import entity.Order;
import entity.Users;

public class OrderDetail extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();
		HttpSession session = request.getSession();
		Users users = (Users) session.getAttribute("user");
		String orderId = request.getParameter("orderId");
		if (users == null || StringUtil.isEmpty(orderId)) {
			obj.put("result", false);
			out.println(obj);
			out.flush();
			out.close();
			return;
		}

		OrderDao orderDao = new OrderDaoImpl();
		Order order = new Order();
		order.setOrderId(Integer.parseInt(orderId));
		JSONArray array = orderDao.getDetailResultSet(order);
		obj.put("rows", array);
		out.println(obj);
		out.flush();
		out.close();

	}

}
