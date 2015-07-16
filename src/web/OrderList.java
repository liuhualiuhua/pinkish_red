package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.StringUtil;

import com.alibaba.fastjson.JSONObject;

import dao.ItemDao;
import dao.OrderDao;
import dao.impl.ItemDaoImpl;
import dao.impl.OrderDaoImpl;
import entity.Order;
import entity.PageBean;
import entity.Users;

public class OrderList extends HttpServlet {
	private static final Map<String,String> M = new HashMap<String,String>();

	static {
		M.put("priceasc", " order by price asc");
		M.put("pricedesc", " order by price desc");
		M.put("timeasc", " order by postTime asc");
		M.put("timedesc", " order by postTime desc");
	}

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
		if (users == null) {
			obj.put("result", false);
			out.println(obj);
			out.flush();
			out.close();
			return;
		}
		OrderDao orderDao = new OrderDaoImpl();
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		PageBean pageBean = new PageBean(page, rows);
		Order order = new Order();
		Map map = new HashMap();

		String orderId = request.getParameter("orderId");
		if (StringUtil.isNotEmpty(orderId)) {
			order.setOrderId(Integer.parseInt(orderId));
		}
		String userId = request.getParameter("userId");
		if (StringUtil.isNotEmpty(userId)) {
			order.setUserId(Integer.parseInt(userId));
		}
		String price1 = request.getParameter("price1");
		if (StringUtil.isNotEmpty(price1)) {
			order.setPrice(Double.valueOf(price1));
		}
		String price2 = request.getParameter("price2");
		if (StringUtil.isNotEmpty(price2)) {
			map.put("price2", price2);
		}
		String postTime1 = request.getParameter("postTime1");
		if (StringUtil.isNotEmpty(postTime1)) {
			order.setPostTime(postTime1);
		}
		String postTime2 = request.getParameter("postTime2");
		if (StringUtil.isNotEmpty(postTime2)) {
			map.put("postTime2", postTime2);
		}
		String filter = request.getParameter("filter");
		if (StringUtil.isNotEmpty(filter)) {
			order.setStatus(filter);
		}
		String sort2 = request.getParameter("sort2");
		if (StringUtil.isNotEmpty(sort2)) {
			map.put("sort2", M.get(sort2));
		}

		List list = orderDao.getList(pageBean, order, map);
		int total = orderDao.getCount(pageBean, order, map);

		obj.put("total", total);
		obj.put("rows", list);
		out.println(obj);
		out.flush();
		out.close();

	}

}
