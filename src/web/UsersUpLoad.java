package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.jspsmart.upload.File;
import com.jspsmart.upload.Files;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import dao.UsersDao;
import dao.impl.UsersDaoImpl;
import entity.Users;

public class UsersUpLoad extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("GBK");
		// ʵ�����ϴ����
		SmartUpload upload = new SmartUpload();
		// ��ʼ���ϴ����
		upload.initialize(this.getServletConfig(), request, response);

		// ��ʼ�ϴ�
		try {
			upload.upload();
		} catch (SmartUploadException e1) {
			e1.printStackTrace();
		}
		// ��ȡ�ϴ����ļ��б����
		Files f = upload.getFiles();
		// ��ȡ�ļ�����
		File fil = f.getFile(0);
		// ȡ���ļ���׺
		String ext = fil.getFileExt();
		System.out.println(ext);
		// �ж��ļ������Ƿ���jpg��ʽ

		// System.out.println(fil.getSize());

		// if (!(ext.equals("jpg")) || fil.getSize()>1024*1024) {
		// out.println("<script type='text/javascript'>alert('�ļ����ʹ���򳬹���С����');location.replace('index.jsp');</script>");
		// return;
		// }
		// �������������ļ����ϴ� ��Ҫע�����uploadʹ����webRoot�ļ����µ�һ��Ŀ¼
		String pic = null;
		/**
		 * ����ϴ����ļ����Ͱ��ļ����浽���ݿ��У�����޸�ʱ��û���ϴ��ļ������޸�
		 */
		String random=Long.toString(new Date().getTime())+(int)Math.floor(Math.random()*1000);
		
		if (fil.getSize() > 0) {
			try {
				fil.saveAs("upload/" + fil.getFileName());
				pic = "upload/" + fil.getFileName();
				//fil.saveAs("upload/" + random+"."+ext);
				//pic = "upload/" + random+"."+ext;
			} catch (SmartUploadException e) {
				e.printStackTrace();
			}
		}

		String userId = request.getParameter("userId");
		UsersDao usersDao = new UsersDaoImpl();
		Users u = new Users();
		u.setHead(pic);
		u.setUserId(Integer.parseInt(userId));
		int result = usersDao.updateHead(u);
		JSONObject obj = new JSONObject();
		PrintWriter out = response.getWriter();

		if (result > 0) {
			obj.put("success", true);
		} else {
			obj.put("success", false);
			obj.put("errorMsg", "����ʧ��");
		}

		out.println(obj);
		out.flush();
		out.close();

	}

}
