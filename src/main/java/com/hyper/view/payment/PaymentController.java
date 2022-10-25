package com.hyper.view.payment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyper.home.Pager;
import com.hyper.model.payment.PaymentService;
import com.hyper.model.payment.PaymentVO;
import com.hyper.model.product.ProductInfoVO;

@Controller
public class PaymentController {
	@Autowired
	private PaymentService paymentService;

	// 관리자용 목록
	@RequestMapping(value = "/paymentList", method = RequestMethod.GET)
	public String paymentListView(@RequestParam(defaultValue = "1") int curPage, PaymentVO vo, Model model) {
		int count = paymentService.getAdminCountPayment(vo);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<PaymentVO> list = paymentService.getAdminPaymentList(start, end, vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "admin/paymentList";
	}

	// 관리자가 주문내역 수정 -view
	@RequestMapping(value = "/updatePayment", method = RequestMethod.GET)
	public String adminPaymentUpdateView(PaymentVO vo, Model model) {
		model.addAttribute("lPay", paymentService.paymentDetail(vo));
		return "admin/updatePayment";
	}

	// 관리자가 회원주문내역 처리
	@RequestMapping(value = "/updatePayinfo", method = RequestMethod.POST)
	public String adminPaymentUpdate(PaymentVO vo) {
		System.out.println("전");
		paymentService.updatePayment(vo);
		System.out.println("후");
		return "admin/paymentList";
	}

	// 관리자 회원정보 삭제
	@RequestMapping(value = "/delPayment", method = RequestMethod.GET)
	public String AdmindeletePayment(PaymentVO vo) {
		paymentService.deletePayment(vo);
		return "admin/paymentList";
	}
	
	// 관리자 회원주문내역 검색
	@RequestMapping(value = "/searchPayment", method = RequestMethod.GET)
	public String listPage3(Model model, HttpSession session, ProductInfoVO vo,
			@RequestParam(defaultValue = "") String sPayment, @RequestParam(defaultValue = "1") int curPage) {
		// 게시글 갯수 계산
		System.out.println("검색전>>>");
		int count = paymentService.countSearchPayment(sPayment);
		System.out.println("검색시작>>>");
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		System.out.println("페이징");
		session.setAttribute("sPayment", sPayment); // 상품 이름 검색
		session.setAttribute("curPage", curPage);
		
		System.out.println("검색");
		List<PaymentVO> list = paymentService.listSearchPayment(sPayment, start, end); // 게시글 목록
		System.out.println("검색시작");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("sPayment", sPayment);
		model.addAttribute("map", map);
		System.out.println("검색 받아오기");
		return "product/paymentsearch";
	}
}
