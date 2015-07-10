package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.StringUtil;

import com.alibaba.fastjson.JSONObject;

import dao.MessageDao;
import dao.impl.MessageDaoImpl;
import entity.Message;
import entity.Users;

public class MessageUnReadList extends HttpServlet {

	private static final long serialVersionUID = 1L;

	ConcurrentHashMap map = new ConcurrentHashMap();

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		/**
		 * 移除在线用户列表
		 */
		String remove = request.getParameter("remove");
		if (StringUtil.isNotEmpty(remove)) {
			map.remove(remove);
			System.out.println("移除了"+remove);
			return;
		}

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
		map.put(users.getUserId()+"", users.getName());

		String id = request.getParameter("flag");
		int messageId = Integer.parseInt(id);
		MessageDao messageDao = new MessageDaoImpl();
		Message message=new Message();
		message.setMessageId(messageId);
		message.setUserId(users.getUserId());
		List list = messageDao.getUnReadMessage(message);

		obj.put("messages", list);
		obj.put("users", map);
		
		out.println(obj);
		System.out.println(obj);
		out.flush();
		out.close();

	}

}
