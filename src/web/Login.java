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
import dao.UsersDao;
import dao.impl.ItemDaoImpl;
import dao.impl.OrderDaoImpl;
import dao.impl.UsersDaoImpl;
import entity.Cart;
import entity.Item;
import entity.Order;
import entity.Users;
import util.StringUtil;

public class Login extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject();

		String userName = request.getParameter("name");
		String password = request.getParameter("pass");
		String check = request.getParameter("check");
		String code = (String) session.getAttribute("check");
		String fm = request.getParameter("fm");

		if (StringUtil.isEmpty(check) || !code.equalsIgnoreCase(check)) {
			obj.put("success", false);
			obj.put("errorMsg", "验证码错误");
			out.println(obj);
			out.flush();
			out.close();
			return;
		}

		UsersDao usersDao = new UsersDaoImpl();
		Users u = new Users();
		u.setName(userName);
		u.setPass(password);

		Users user = usersDao.login(u);

		if (StringUtil.isEmpty(fm) || user == null) {
			obj.put("success", false);
			obj.put("errorMsg", "用户名或密码错误");
			out.println(obj);
			out.flush();
			out.close();
			return;
		}
		session.setAttribute("user", user);
		Cart cart = (Cart) session.getAttribute("cart");

		if (cart != null && cart.calTotal() > 0.0) {
			ItemDao itemDao = new ItemDaoImpl();
			OrderDao orderDao = new OrderDaoImpl();
			Order order = new Order();
			order.setUserId(user.getUserId());
			order.setPostTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
					.format(new Date()));
			order.setStatus("已提交");
			order.setPrice(cart.calTotal());

			int orderId = orderDao.add(order);
			order.setOrderId(orderId);
			int result = 0;
			if (orderId > 0) {
				result = itemDao.addCart(cart, order);

			}
			if (result > 0) {
				session.removeAttribute("cart");
			} else {
				obj.put("success", false);
				obj.put("errorMsg", "哦哦，出错了");
				out.println(obj);
				out.flush();
				out.close();
			}
		}
		obj.put("success", true);
		out.println(obj);
		out.flush();
		out.close();

	}

}
