package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
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

import dao.MessageDao;
import dao.impl.MessageDaoImpl;
import entity.Message;
import entity.PageBean;
import entity.Users;

public class MessageList4UI extends HttpServlet {

	private static final long serialVersionUID = 1L;

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

		MessageDao messageDao = new MessageDaoImpl();
		Message message = new Message();
		Map map = null;

		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		PageBean pageBean = new PageBean(page, rows);

		
		String id = request.getParameter("messageId");
		if (StringUtil.isNotEmpty(id)) {
			message.setMessageId(Integer.parseInt(id));
		}
		String userId = request.getParameter("userId");
		if (StringUtil.isNotEmpty(userId)) {
			message.setUserId(Integer.parseInt(userId));
		}
		String name = request.getParameter("userName");
		if (StringUtil.isNotEmpty(name)) {
			message.setUserName(name);
		}
		String content = request.getParameter("content");
		if (StringUtil.isNotEmpty(content)) {
			message.setContent(content);
		}
		String postTime = request.getParameter("postTime");
		if (StringUtil.isNotEmpty("postTime")) {
			message.setPostTime(postTime);
		}
		String postTime2 = request.getParameter("postTime2");
		if (StringUtil.isNotEmpty(postTime2)) {
			map = new HashMap();
			map.put("postTime2", postTime2);
		}

		List list = messageDao.findMessageByPage(pageBean, message, map);
		int total = messageDao.countMessageByPage(pageBean, message, map);
		
		if(rows==15){
			Collections.reverse(list);
		}else{
			
		}

		obj.put("total", total);
		obj.put("rows", list);
		out.println(obj);
		out.flush();
		out.close();

	}

}
