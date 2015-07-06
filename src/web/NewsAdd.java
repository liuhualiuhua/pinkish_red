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

import dao.NewsDao;
import dao.impl.NewsDaoImpl;
import entity.News;
import entity.Users;

public class NewsAdd extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String newsId = request.getParameter("newsId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		// String postTime = request.getParameter("postTime");
		String postTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date());
		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("user");
		int userId = user.getUserId();

		News news = new News();
		news.setTitle(title);
		news.setContent(content);
		news.setUserId(userId);
		news.setPostTime(postTime);
		NewsDao newsDao = new NewsDaoImpl();
		JSONObject obj = new JSONObject();
		int result = 0;
		if (StringUtil.isNotEmpty(newsId)) {
			news.setNewsId(Integer.parseInt(newsId));
			result = newsDao.updateNews(news);
		} else {
			result = newsDao.addNews(news);
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
