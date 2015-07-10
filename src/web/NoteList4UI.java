package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.NoteDao;
import dao.impl.NoteDaoImpl;
import util.StringUtil;
import entity.Note;
import entity.PageBean;

public class NoteList4UI extends HttpServlet {

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

		Note note = new Note();
		Map map = new HashMap();
		String id = request.getParameter("id");
		if (StringUtil.isNotEmpty(id)) {
			note.setNoteId(Integer.parseInt(id));
		}
		String fromId = request.getParameter("fromId");
		if (StringUtil.isNotEmpty(fromId)) {
			note.setFromId(Integer.parseInt(fromId));
		}
		String toId = request.getParameter("toId");
		if (StringUtil.isNotEmpty(toId)) {
			note.setToId(Integer.parseInt(toId));
		}
		String content = request.getParameter("content");
		if (StringUtil.isNotEmpty("")) {
			note.setContent(content);
		}
		String readSign = request.getParameter("readSign");
		if (StringUtil.isNotEmpty(readSign)) {
			note.setReadSign(Integer.parseInt(readSign));
		}
		String postTime = request.getParameter("postTime");
		if (StringUtil.isNotEmpty(postTime)) {
			note.setPostTime(postTime);
		}
		String postTime2 = request.getParameter("postTime2");
		if (StringUtil.isNotEmpty(postTime2)) {
			map.put("postTime2", postTime2);
		}

		NoteDao noteDao = new NoteDaoImpl();
		List list = noteDao.findNotes(pageBean, note, map);
		int total = noteDao.countNotes(pageBean, note, map);

		JSONObject obj = new JSONObject();
		obj.put("total", total);
		obj.put("rows", list);
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();

	}
}
