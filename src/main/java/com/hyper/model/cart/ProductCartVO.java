package com.hyper.model.cart;

import java.util.List;

public class ProductCartVO {
	private String prd_img;
	private String prd_name;
	private int prd_price;
	private int prd_delivery;
	private int prd_sum;

	private String member_id;
	private String prd_id;
	private int buy_quantity;
	private int cart_id;
	private String prd_opt;

	private List<String> cartPayList;

	public String getPrd_img() {
		return prd_img;
	}

	public void setPrd_img(String prd_img) {
		this.prd_img = prd_img;
	}

	public String getPrd_name() {
		return prd_name;
	}

	public void setPrd_name(String prd_name) {
		this.prd_name = prd_name;
	}

	public int getPrd_price() {
		return prd_price;
	}

	public void setPrd_price(int prd_price) {
		this.prd_price = prd_price;
	}

	public int getPrd_delivery() {
		return prd_delivery;
	}

	public void setPrd_delivery(int prd_delivery) {
		this.prd_delivery = prd_delivery;
	}

	public int getPrd_sum() {
		return prd_sum;
	}

	public void setPrd_sum(int buy_quantity, int prd_price) {
		this.prd_sum = buy_quantity * prd_price;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getPrd_id() {
		return prd_id;
	}

	public void setPrd_id(String prd_id) {
		this.prd_id = prd_id;
	}

	public int getBuy_quantity() {
		return buy_quantity;
	}

	public void setBuy_quantity(int buy_quantity) {
		this.buy_quantity = buy_quantity;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getPrd_opt() {
		return prd_opt;
	}

	public void setPrd_opt(String prd_opt) {
		this.prd_opt = prd_opt;
	}

	public List<String> getCartPayList() {
		return cartPayList;
	}

	public void setCartPayList(List<String> cartPayList) {
		this.cartPayList = cartPayList;
	}
}
