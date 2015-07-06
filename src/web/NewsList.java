package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.NewsDao;
import dao.impl.NewsDaoImpl;
import util.StringUtil;
import entity.News;
import entity.PageBean;
import entity.Users;

public class NewsList extends HttpServlet {

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
		News news = new News();
		String id = request.getParameter("id");
		if (StringUtil.isNotEmpty(id)) {
			int newsId = Integer.parseInt(id);
			news.setNewsId(newsId);
		}
		String title = request.getParameter("title");
		if (StringUtil.isNotEmpty(title)) {
			news.setTitle(title);
		}
		String content = request.getParameter("content");
		if (StringUtil.isNotEmpty(content)) {
			news.setContent(content);
		}
		String postTime = request.getParameter("postTime");
		if(StringUtil.isNotEmpty(postTime)){
			news.setPostTime(postTime);
		}
		String time=null;
		String postTime2 = request.getParameter("postTime2");
		if(StringUtil.isNotEmpty(postTime2)){
			time=postTime2;
		}
		NewsDao newsDao = new NewsDaoImpl();
		List list = newsDao.findNewsByPage(pageBean, news,time);
		int total = newsDao.countNewsByPage(pageBean, news,time);
		JSONObject obj = new JSONObject();

		obj.put("total", total);
		obj.put("rows", list);
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();

	}

}
