package entity;

import java.util.ArrayList;
import java.util.List;

/**
 * session���ﳵ
 */
public class Cart {

	private List goods = new ArrayList();
	private List count = new ArrayList();

	public List getGoods() {
		return goods;
	}

	public void setGoods(List goods) {
		this.goods = goods;
	}

	public List getCount() {
		return count;
	}

	public void setCount(List count) {
		this.count = count;
	}

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

	public void add(Goods goods) {
		int i = search(goods);
		if (i == -1) {
			this.goods.add(goods);
			this.count.add(1);
			System.out.println("�������Ʒ");
		} else {
			this.count.set(i, (Integer) this.count.get(i) + 1);
			System.out.println("��������");
		}
	}

	public void add(Goods goods, Integer count) {
		int i = search(goods);
		if (i == -1) {
			this.goods.add(goods);
			this.count.add(count);
			System.out.println("�������Ʒ");
		} else {
			this.count.set(i, count);
			System.out.println("�ı�����");
		}
	}

	public void remove(Goods goods) {
		int i = search(goods);
		if (i != -1) {
			this.goods.remove(i);
			this.count.remove(i);
			System.out.println("�Ƴ���Ʒ");
		}
	}

	public void clear() {
		this.goods.clear();
		this.count.clear();
		System.out.println("��չ��ﳵ");
	}

	public Double calTotal() {
		Double total = 0.0;
		int length = this.goods.size();
		for (int i = 0; i < length; i++) {
			Goods g = (Goods) this.goods.get(i);
			total += g.getPrice();
		}
		System.out.println("�����ܼ�");
		return total;
		
	}

}
