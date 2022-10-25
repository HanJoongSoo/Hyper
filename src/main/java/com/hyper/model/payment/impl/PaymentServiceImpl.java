package com.hyper.model.payment.impl;

import java.util.List;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyper.model.payment.PaymentService;
import com.hyper.model.payment.PaymentVO;

@Service("paymentService")
public class PaymentServiceImpl implements PaymentService {
	@Autowired
	private PaymentDAO paymentDAO;

	// 신용카드 정보 암호화
	public void securityCREDIT(PaymentVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getCredit_number().getBytes());
		String securitycredit = Hex.toHexString(digest);
		vo.setCredit_number(securitycredit);
		System.out.println("SHA3-512: " + vo.getCredit_number());
	}

	// 구매
	public List<PaymentVO> getPaymentProduct(PaymentVO vo) {
		return paymentDAO.getPaymentProduct(vo);
	}

	// 장바구니 구매
	public List<PaymentVO> cartPaymentProduct(PaymentVO vo) {
		return paymentDAO.cartPaymentProduct(vo);
	}

	// 결제
	public void insertPayment(PaymentVO vo) {
		paymentDAO.insertPayment(vo);
	}

	// 장바구니 삭제
	public void deleteCartPayment(PaymentVO vo) {
		paymentDAO.deleteCartPayment(vo);
	}

	// 관리자 페이지 리스트 갯수 체크
	public int getAdminCountPayment(PaymentVO vo) {
		return paymentDAO.getAdminCountPayment(vo);
	}

	// 관리자 리스트
	public List<PaymentVO> getAdminPaymentList(int start, int end, PaymentVO vo) {
		return paymentDAO.getAdminPaymentList(start, end, vo);
	}

	// 관리자 회원주문내역 상세보기
	public PaymentVO paymentDetail(PaymentVO vo) {
		return paymentDAO.paymentDetail(vo);
	}

	// 관리자 회원주문내역 수정하기
	public void updatePayment(PaymentVO vo) {
		paymentDAO.updatePayment(vo);
	}

	// 관리자 회원주문내역 삭제하기
	public void deletePayment(PaymentVO vo) {
		paymentDAO.deletePayment(vo);
	}

	// 관리자 회원주문내역 검색
	public List<PaymentVO> listSearchPayment(String sPayment, int start, int end) {
		return paymentDAO.listSearchPayment(sPayment, start, end);
	}

	// 관리자 회원주문내역 가져오기
	public int countSearchPayment(String sPayment) {
		return paymentDAO.countSearchPayment(sPayment);
	}
}
