package web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

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

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");

		String name = request.getParameter("name");
		String brand = request.getParameter("brand");
		String type = request.getParameter("type");
		String description = request.getParameter("description");
		String price = request.getParameter("price");
		String pic = request.getParameter("pic");

		Goods goods = new Goods();
		goods.setName(name);
		goods.setBrand(brand);
		goods.setType(type);
		goods.setDescription(description);
		goods.setPrice(Double.parseDouble(price));
		goods.setPic(pic);

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
			obj.put("errorMsg", "±£¥Ê ß∞‹");
		}
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();
	}

}
