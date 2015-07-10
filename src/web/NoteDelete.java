package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.NoteDao;
import dao.impl.NoteDaoImpl;

public class NoteDelete extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		PrintWriter out = response.getWriter();
		String delIds = request.getParameter("ids");
		NoteDao noteDao = new NoteDaoImpl();
		int delNums = noteDao.deleteNotesByIds(delIds);
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
