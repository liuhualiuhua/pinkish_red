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

import dao.GoodsDao;
import dao.impl.GoodsDaoImpl;
import util.StringUtil;
import entity.Goods;
import entity.PageBean;

public class GoodsList extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("GBK");
		response.setContentType("text/html;charset=GBK");

		int page = Integer.parseInt(request.getParameter("page"));
		int rows = Integer.parseInt(request.getParameter("rows"));
		PageBean pageBean = new PageBean(page, rows);
		Goods goods = new Goods();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		if (StringUtil.isNotEmpty(name)) {
			goods.setName(name);
		}
		String brand = request.getParameter("brand");
		if (StringUtil.isNotEmpty(brand)) {
			goods.setBrand(brand);
		}
		String type = request.getParameter("type");
		if (StringUtil.isNotEmpty(type)) {
			goods.setType(type);
		}
		String description = request.getParameter("description");
		if (StringUtil.isNotEmpty(description)) {
			goods.setDescription(description);
		}
		String price1 = request.getParameter("price1");
		String price2 = request.getParameter("price2");
		// String pic = request.getParameter("pic");
		String sort = request.getParameter("sort");
		String price = null;
		String order = null;

		if (StringUtil.isNotEmpty(price1)) {
			goods.setPrice(Double.parseDouble(price1));
		}
		if (StringUtil.isNotEmpty(price2)) {
			price = price2;
		}
		if (StringUtil.isNotEmpty(sort)) {
			order = sort;
		}
		if (StringUtil.isNotEmpty(id)) {
			goods.setGoodsId(Integer.parseInt(id));
		}

		GoodsDao goodsDao = new GoodsDaoImpl();

		Map map = new HashMap();
		map.put("price", price);
		map.put("order", order);

		List list = goodsDao.findGoodsByPage(pageBean, goods, map);
		int total = goodsDao.countGoodsByPage(pageBean, goods, map);

		JSONObject obj = new JSONObject();
		obj.put("total", total);
		obj.put("rows", list);
		PrintWriter out = response.getWriter();
		out.println(obj);
		out.flush();
		out.close();

	}

}
