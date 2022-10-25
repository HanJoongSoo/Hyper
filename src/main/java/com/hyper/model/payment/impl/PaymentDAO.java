package com.hyper.model.payment.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyper.model.payment.PaymentVO;

@Repository
public class PaymentDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 물품 구매
	public List<PaymentVO> getPaymentProduct(PaymentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payment", vo);
		return mybatis.selectList("PaymentDAO.paymentProduct", map);
	}

	// 장바구니 물품 구매
	public List<PaymentVO> cartPaymentProduct(PaymentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("payment", vo);
		return mybatis.selectList("PaymentDAO.cartPaymentProduct", map);
	}

	// 결제
	public void insertPayment(PaymentVO vo) {
		mybatis.insert("PaymentDAO.insertPayment", vo);
	}

	// 결제 후 장바구니 비우기
	public void deleteCartPayment(PaymentVO vo) {
		mybatis.delete("PaymentDAO.deleteCartPayment", vo);
	}
	
	// 관리자 페이지 리스트 갯수 체크
	public int getAdminCountPayment(PaymentVO vo) {
		return mybatis.selectOne("PaymentDAO.getAdminCountPayment", vo);
	}
	
	// 관리자 회원주문내역 리스트
	public List<PaymentVO> getAdminPaymentList(int start, int end, PaymentVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("lpay", vo);
		return mybatis.selectList("PaymentDAO.getAdminPaymentList", map);
	}
	
	// 관리자 회원주문내역 상세보기
	public PaymentVO paymentDetail(PaymentVO vo) {
		return (PaymentVO) mybatis.selectOne("PaymentDAO.paymentDetail", vo);
	}
	
	// 관리자 회원주문내역 수정
	public void updatePayment(PaymentVO vo) {
		mybatis.update("PaymentDAO.updatePayment", vo);
	}
	
	// 관리자 회원주문내역 삭제
	public void deletePayment(PaymentVO vo) {
		mybatis.delete("PaymentDAO.deletePayment", vo);
	}
	
	// 관리자 주문내역 검색
	public List<PaymentVO> listSearchPayment(String sPayment, int start, int end) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sPayment", sPayment);
			map.put("start", start);
			map.put("end", end);
			return mybatis.selectList("PaymentDAO.listSearchPayment", map);
		}
	
	// 관리자 주문내역 가져오기
	public int countSearchPayment(String sPayment) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sPayment", sPayment);
			return mybatis.selectOne("PaymentDAO.countSearchPayment", map);
		}

}