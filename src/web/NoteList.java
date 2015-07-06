package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DeleteUtil;
import util.StringUtil;

import com.alibaba.fastjson.JSONObject;

import dao.NoteDao;
import dao.impl.NoteDaoImpl;
import entity.Note;
import entity.PageBean;
import entity.Users;

public class NoteList extends HttpServlet {

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
		NoteDao noteDao = new NoteDaoImpl();

		String userId = request.getParameter("userId");

		Note note = new Note();
		note.setFromId(Integer.parseInt(userId));
		note.setToId(users.getUserId());

		String readSign = request.getParameter("readSign");
		if (StringUtil.isNotEmpty(readSign)) {
			note.setReadSign(Integer.parseInt(readSign));
		} else {
			note.setReadSign(1);
		}

		String page = request.getParameter("page");
		PageBean pageBean = null;
		List list = null;
		if (StringUtil.isNotEmpty(page)) {
			pageBean = new PageBean(Integer.parseInt(page), 15);
			list = noteDao.findOldNotes(pageBean, note, null);
		} else {
			pageBean = new PageBean(1, 15);
			list = noteDao.findNotes(pageBean, note, null);
		}

		if (!list.isEmpty()) {
			String delIds = DeleteUtil.delIds(list);
			if (StringUtil.isEmpty(readSign)) {
				noteDao.readNote(delIds);
			}
			obj.put("result", true);
		} else {
			obj.put("result", false);
		}
		Collections.reverse(list);

		obj.put("content", list);
		out.print(obj);
		out.flush();
		out.close();

	}

}
