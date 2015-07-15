package entity;

import java.util.ArrayList;
import java.util.List;

/**
 * session¹ºÎï³µ
 */
public class Cart {

	private List goods = new ArrayList();
	private List count = new ArrayList();

	private int search(Goods goods) {
		int length = this.goods.size();
		for (int i = 0; i < length; i++) {
			Goods g = (Goods) this.goods.get(i);
			if (g.getGoodsId() == goods.getGoodsId()) {
				return i;
			}
		}
		return -1;
	}

	public void add(Goods goods, Integer count) {
		int i = search(goods);
		if (i == -1) {
			this.goods.add(goods);
			this.count.add(count);
		} else {
			this.count.add(i, count);
		}
	}

	public void remove(Goods goods) {
		int i = search(goods);
		if (i != -1) {
			this.goods.remove(i);
			this.count.remove(i);
		}
	}

	public void clear() {
		this.goods.clear();
		this.count.clear();
	}

}
