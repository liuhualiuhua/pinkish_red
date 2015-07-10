package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.MessageDao;
import dao.impl.MessageDaoImpl;

public class MessageDelete extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		String delIds = request.getParameter("ids");
		MessageDao messageDao = new MessageDaoImpl();
		int delNums = messageDao.deleteMessage(delIds);
		JSONObject obj = new JSONObject();
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
