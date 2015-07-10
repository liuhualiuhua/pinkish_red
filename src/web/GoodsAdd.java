package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.jspsmart.upload.*;

import dao.GoodsDao;
import dao.impl.GoodsDaoImpl;
import util.StringUtil;
import entity.Goods;

public class GoodsAdd extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("GB2312");
		response.setContentType("text/html;charset=GB2312");
		

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
		// ȥ���ļ���׺
		String ext = fil.getFileExt();
		// �ж��ļ������Ƿ���jpg��ʽ

		//System.out.println(fil.getSize());
		
		// if (!(ext.equals("jpg")) || fil.getSize()>1024*1024) {
		// out.println("<script type='text/javascript'>alert('�ļ����ʹ���򳬹���С����');location.replace('index.jsp');</script>");
		// return;
		// }
		// �������������ļ����ϴ� ��Ҫע�����uploadʹ����webRoot�ļ����µ�һ��Ŀ¼
		String pic=null;
		/**
		 * ����ϴ����ļ����Ͱ��ļ����浽���ݿ��У�����޸�ʱ��û���ϴ��ļ������޸�
		 */
		if (fil.getSize() > 0) {
			try {
				fil.saveAs("upload/" + fil.getFileName());
				pic="upload/" + fil.getFileName();
			} catch (SmartUploadException e) {
				e.printStackTrace();
			}
		}else{
			pic = upload.getRequest().getParameter("pic");
		}
		
		//System.out.print(upload.getRequest().getParameter("name") + "<><>");
		
		String name=upload.getRequest().getParameter("name");
		String brand = upload.getRequest().getParameter("brand");
		String type = upload.getRequest().getParameter("type");
		String description = upload.getRequest().getParameter("description");
		String price = upload.getRequest().getParameter("price");
		//String pic = upload.getRequest().getParameter("pic");

		Goods goods = new Goods();
		goods.setName(name);
		goods.setBrand(brand);
		goods.setType(type);
		goods.setDescription(description);
		goods.setPrice(Double.parseDouble(price));
		goods.setPic(pic);

		//String goodsId = upload.getRequest().getParameter("goodsId");
		String goodsId = request.getParameter("goodsId");
		GoodsDao goodsDao = new GoodsDaoImpl();
		JSONObject obj = new JSONObject();
		int result = 0;

		if (StringUtil.isNotEmpty(goodsId)) {
			goods.setGoodsId(Integer.parseInt(goodsId));
			result = goodsDao.updateGoods(goods);
		} else {
			result = goodsDao.addGoods(goods);
		}
		
		if (result > 0) {
			obj.put("success", true);
		} else {
			obj.put("success", false);
			obj.put("errorMsg", "����ʧ��");
		}
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();
	}

}
