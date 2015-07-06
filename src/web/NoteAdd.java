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

import com.alibaba.fastjson.JSONObject;

import dao.NoteDao;
import dao.UsersDao;
import dao.impl.NoteDaoImpl;
import dao.impl.UsersDaoImpl;
import entity.Note;
import entity.Users;

public class NoteAdd extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html");
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

		String userId = request.getParameter("userId");
		String content = request.getParameter("content");
		Note note = new Note();
		NoteDao noteDao = new NoteDaoImpl();
		UsersDao usersDao = new UsersDaoImpl();

		note.setContent(content);
		note.setToId(Integer.parseInt(userId));
		Users u = usersDao.findById(Integer.parseInt(userId));
		note.setToName(u.getName());
		note.setFromId(users.getUserId());
		note.setFromName(users.getName());
		note.setPostTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(new Date()));

		int i = noteDao.addNote(note);
		if (i > 0) {
			obj.put("result", true);
		} else {
			obj.put("result", false);
		}
		out.println(obj);
		out.flush();
		out.close();

	}

}
