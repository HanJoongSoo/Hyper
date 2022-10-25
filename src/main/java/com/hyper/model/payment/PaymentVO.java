package com.hyper.model.payment;

import java.sql.Date;

public class PaymentVO {
	private int payment_id;
	private String member_id;
	private String prd_id;
	private int buy_quantity;
	private String member_zipcode;
	private String member_faddr;
	private String member_laddr;
	private String member_phone;
	private String credit_number;
	private Date payment_date;

	private String prd_img;
	private String prd_name;
	private String prd_opt;
	private int prd_price;
	private int prd_delivery;
	private int prd_discount;
	private int prd_sum;
	private String delivery;

	@Override
	public String toString() {
		return "PaymentVO [payment_id: " + payment_id + ", member_id: " + member_id + ", prd_id: " + prd_id
				+ ", prd_opt: " + prd_opt + ", buy_quantity: " + buy_quantity + ", member_zipcode: " + member_zipcode
				+ ", member_faddr: " + member_faddr + ", member_laddr: " + member_laddr + ", member_phone: "
				+ member_phone + ", credit_number: " + credit_number + ", prd_img: " + prd_img + ", prd_name: "
				+ prd_name + ", prd_price: " + prd_price + ", prd_delivery: " + prd_delivery + ", prd_discount: "
				+ prd_discount + "]";
	}

	public int getPayment_id() {
		return payment_id;
	}

	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
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

	public String getMember_zipcode() {
		return member_zipcode;
	}

	public void setMember_zipcode(String member_zipcode) {
		this.member_zipcode = member_zipcode;
	}

	public String getMember_faddr() {
		return member_faddr;
	}

	public void setMember_faddr(String member_faddr) {
		this.member_faddr = member_faddr;
	}

	public String getMember_laddr() {
		return member_laddr;
	}

	public void setMember_laddr(String member_laddr) {
		this.member_laddr = member_laddr;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getCredit_number() {
		return credit_number;
	}

	public void setCredit_number(String credit_number) {
		this.credit_number = credit_number;
	}

	public Date getPayment_date() {
		return payment_date;
	}

	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}

	public String getPrd_opt() {
		return prd_opt;
	}

	public void setPrd_opt(String prd_opt) {
		this.prd_opt = prd_opt;
	}

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

	public int getPrd_discount() {
		return prd_discount;
	}

	public void setPrd_discount(int prd_price, int buy_quantity) {
		this.prd_discount = prd_price * buy_quantity;
	}

	public int getPrd_sum() {
		return prd_sum;
	}

	public void setPrd_sum(int prd_sum) {
		this.prd_sum = prd_sum;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
}