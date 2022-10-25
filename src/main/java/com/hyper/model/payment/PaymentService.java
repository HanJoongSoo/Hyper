package com.hyper.model.payment;

import java.util.List;

public interface PaymentService {
	// 구매
	List<PaymentVO> getPaymentProduct(PaymentVO vo);

	// 장바구니 구매
	List<PaymentVO> cartPaymentProduct(PaymentVO vo);

	// 결제
	void insertPayment(PaymentVO vo);

	// 결제 후 장바구니 비우기
	void deleteCartPayment(PaymentVO vo);
	
	// 관리자 - 회원주문내역 카운트
	int getAdminCountPayment(PaymentVO vo);
	
	// 관리자 - 회원주문내역 리스트
	List<PaymentVO> getAdminPaymentList(int start, int end, PaymentVO vo);
	
	// 관리자 - 주문내역 상세보기
	PaymentVO paymentDetail(PaymentVO vo);
	
	// 관리자 - 주문내역 수정하기
	void updatePayment(PaymentVO vo);
	
	// 관리자 - 주문내역 삭제하기
	void deletePayment(PaymentVO vo);
	
	// 관리자 - 주문내역 검색
	List<PaymentVO> listSearchPayment(String sPayment, int start, int end);
	
	// 관리자 - 주문내역 가져오기
	int countSearchPayment(String sPayment);
}
