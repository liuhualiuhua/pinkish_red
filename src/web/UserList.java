package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.StringUtil;

import com.alibaba.fastjson.JSONObject;

import dao.*;
import dao.impl.*;
import entity.*;

public class UserList extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		PageBean pageBean = new PageBean(page, rows);
		Users users = new Users();
		if (StringUtil.isNotEmpty(request.getParameter("id"))) {
			int userId = Integer.parseInt(request.getParameter("id"));
			users.setUserId(userId);
		}
		if (StringUtil.isNotEmpty(request.getParameter("name"))) {
			String name = request.getParameter("name");
			users.setName(name);
		}
		if (StringUtil.isNotEmpty(request.getParameter("role"))) {
			int role = Integer.parseInt(request.getParameter("role"));
			users.setRole(role);
		}

		UsersDao usersDao = new UsersDaoImpl();
		List list = usersDao.findUsersByPage(pageBean, users);
		int total = usersDao.countUsersByPage(pageBean, users);
		JSONObject obj = new JSONObject();

		obj.put("total", total);
		obj.put("rows", list);
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();
	}
}
