package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.UsersDao;
import dao.impl.UsersDaoImpl;

public class UserSearch extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String name = request.getParameter("name");

		UsersDao usersDao = new UsersDaoImpl();
		List list = usersDao.searchUsersByName(name);
		JSONObject obj = new JSONObject();
		PrintWriter out = response.getWriter();

		obj.put("list", list);
		if (list.isEmpty()) {
			obj.put("success", false);
		} else {
			obj.put("success", true);
		}
		out.println(obj);
		out.flush();
		out.close();

	}

}
