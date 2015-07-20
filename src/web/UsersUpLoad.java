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
		// 实例化上传组件
		SmartUpload upload = new SmartUpload();
		// 初始化上传组件
		upload.initialize(this.getServletConfig(), request, response);

		// 开始上传
		try {
			upload.upload();
		} catch (SmartUploadException e1) {
			e1.printStackTrace();
		}
		// 获取上传的文件列表对象
		Files f = upload.getFiles();
		// 获取文件对象
		File fil = f.getFile(0);
		// 取的文件后缀
		String ext = fil.getFileExt();
		System.out.println(ext);
		// 判断文件类型是否是jpg格式

		// System.out.println(fil.getSize());

		// if (!(ext.equals("jpg")) || fil.getSize()>1024*1024) {
		// out.println("<script type='text/javascript'>alert('文件类型错误或超过大小限制');location.replace('index.jsp');</script>");
		// return;
		// }
		// 满足条件进行文件的上传 需要注意的是upload使我们webRoot文件夹下的一个目录
		String pic = null;
		/**
		 * 如果上传了文件，就把文件名存到数据库中，如果修改时候没有上传文件，则不修改
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
			obj.put("errorMsg", "保存失败");
		}

		out.println(obj);
		out.flush();
		out.close();

	}

}
