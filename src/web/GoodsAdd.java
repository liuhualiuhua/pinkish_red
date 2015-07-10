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
		// 去的文件后缀
		String ext = fil.getFileExt();
		// 判断文件类型是否是jpg格式

		//System.out.println(fil.getSize());
		
		// if (!(ext.equals("jpg")) || fil.getSize()>1024*1024) {
		// out.println("<script type='text/javascript'>alert('文件类型错误或超过大小限制');location.replace('index.jsp');</script>");
		// return;
		// }
		// 满足条件进行文件的上传 需要注意的是upload使我们webRoot文件夹下的一个目录
		String pic=null;
		/**
		 * 如果上传了文件，就把文件名存到数据库中，如果修改时候没有上传文件，则不修改
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
			obj.put("errorMsg", "保存失败");
		}
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();
	}

}
