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

import util.StringUtil;

import com.alibaba.fastjson.JSONObject;

import dao.TopicDao;
import dao.impl.TopicDaoImpl;
import entity.Topic;
import entity.Users;

public class TopicAdd extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//String postTime = request.getParameter("postTime");
		String postTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
		.format(new Date());
		String replyId = request.getParameter("replyId");
		String topicId = request.getParameter("topicId");
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int userId = user.getUserId();

		Topic topic = new Topic();
		topic.setTitle(title);
		topic.setContent(content);
		topic.setUserId(userId);
		topic.setPostTime(postTime);
		topic.setUserName(user.getName());

		TopicDao topicDao = new TopicDaoImpl();
		JSONObject obj = new JSONObject();
		int result = 0;
		if (StringUtil.isNotEmpty(replyId)) {
			topic.setReplyId(Integer.parseInt(replyId));
		} else {
			topic.setReplyId(0);
		}

		if (StringUtil.isNotEmpty(topicId)) {
			topic.setTopicId(Integer.parseInt(topicId));
			result = topicDao.updateTopic(topic);
		} else {
			result = topicDao.addTopic(topic);
		}

		if (result > 0) {
			obj.put("success", true);
		} else {
			obj.put("success", false);
			obj.put("errorMsg", "±£¥Ê ß∞‹");
		}
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();

	}

}
