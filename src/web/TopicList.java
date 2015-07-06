package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.TopicDao;
import dao.impl.TopicDaoImpl;
import util.StringUtil;
import entity.PageBean;
import entity.Topic;

public class TopicList extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		PageBean pageBean = new PageBean(page, rows);

		Topic topic = new Topic();

		String id = request.getParameter("id");
		if (StringUtil.isNotEmpty(id)) {
			int topicId = Integer.parseInt(id);
			topic.setTopicId(topicId);
		}
		String title = request.getParameter("title");
		if (StringUtil.isNotEmpty(title)) {
			topic.setTitle(title);
		}
		String content = request.getParameter("content");
		if (StringUtil.isNotEmpty(content)) {
			topic.setContent(content);
		}
		String replyId = request.getParameter("replyId");
		if (StringUtil.isNotEmpty(replyId)) {
			topic.setReplyId(Integer.parseInt(replyId));
		}
		String topicId = request.getParameter("topicId");
		if (StringUtil.isNotEmpty(topicId)) {
			topic.setTopicId(Integer.parseInt(topicId));
		}

		TopicDao topicDao = new TopicDaoImpl();
		List list = topicDao.findTopicByPage(pageBean, topic);
		int total = topicDao.countTopicByPage(pageBean, topic);
		JSONObject obj = new JSONObject();

		obj.put("total", total);
		obj.put("rows", list);
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();

	}

}
