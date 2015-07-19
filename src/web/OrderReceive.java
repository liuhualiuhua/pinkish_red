package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSONObject;

import dao.OrderDao;
import dao.impl.OrderDaoImpl;
import entity.Users;

public class OrderReceive extends HttpServlet {

	
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
		String orderId = request.getParameter("orderId");
		OrderDao orderDao = new OrderDaoImpl();
		
		int delNums=orderDao.comfirmOrder(orderId);
		obj.put("delNums", delNums);
		if (delNums > 0) {
			obj.put("success", true);
		} else {
			obj.put("success", false);
		}
		out.println(obj);
		out.flush();
		out.close();
	}

}
