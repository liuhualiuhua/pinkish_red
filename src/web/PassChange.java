package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.UsersDao;
import dao.impl.UsersDaoImpl;
import util.StringUtil;
import entity.Users;

public class PassChange extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String pass = request.getParameter("pass");
		String password = request.getParameter("password");
		Users u = new Users();

		Users user = (Users) request.getSession().getAttribute("user");
		UsersDao usersDao = new UsersDaoImpl();
		u.setPass(password);
		u.setUserId(user.getUserId());

		int result = 0;
		if (StringUtil.isNotEmpty(pass) && pass.equals(user.getPass())) {
			result = usersDao.changePass(u);
		}

		JSONObject obj = new JSONObject();
		if (result > 0) { // Ö´ÐÐ³É¹¦
			obj.put("success", true);
		} else {
			obj.put("success", false);
		}
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();

	}

}
