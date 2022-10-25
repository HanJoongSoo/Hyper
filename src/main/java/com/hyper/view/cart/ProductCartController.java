package com.hyper.view.cart;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.hyper.model.cart.ProductCartService;
import com.hyper.model.cart.ProductCartVO;
import com.hyper.model.payment.PaymentService;
import com.hyper.model.payment.PaymentVO;

@Controller
public class ProductCartController {
	@Autowired
	private ProductCartService productCartService;
	@Autowired
	private PaymentService paymentService;

	// 장바구니 담기
	@RequestMapping("/insertCart")
	public String insertCart(ProductCartVO vo) {
		productCartService.insertProductCart(vo);
		return "product/category";
	}
	
	// 결제창
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public String paymentView(ProductCartVO vo) {
		return "member/payment";
	}
	
	// 결제 메서드
	@RequestMapping(value="/payment", method=RequestMethod.POST)
	public String payment(@RequestParam(value="hiddenbtn") String hidden, PaymentVO vo, HttpSession session, Model model) {
		System.out.println(hidden);
		if (hidden.equals("prdpage")) {
			List<PaymentVO> list = paymentService.getPaymentProduct(vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("hidden", hidden);
			map.put("prd_opt", vo.getPrd_opt());
			map.put("buy_quantity", vo.getBuy_quantity());
//			model.addAttribute("map", map);
			session.setAttribute("map", map);
		} else if (hidden.equals("cartpage")) {
			List<PaymentVO> list = paymentService.cartPaymentProduct(vo);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("list", list);
			map.put("hidden", hidden);
//			model.addAttribute("map", map);
			session.setAttribute("map", map);
		}
		return "member/payment";
	}
	
	// 결제목록 갱신
	@RequestMapping(value="/decopay")
	public String insertPayment(String[] prd_list, PaymentVO vo) {
		for(int i = 0; i < prd_list.length; i += 3) {
			vo.setPrd_id(prd_list[i]);
			vo.setPrd_opt(prd_list[i+1]);
			vo.setBuy_quantity(Integer.parseInt(prd_list[i+2]));
			System.out.println(vo.toString());
			paymentService.insertPayment(vo);
			paymentService.deleteCartPayment(vo);
		}
		return "main";
	}
	
	// 장바구니 전체 비우기
	@RequestMapping("/clearCart")
	public String deleteProductCart(ProductCartVO vo) {
		productCartService.deleteProductCart(vo);
		return "member/cart";
	}
	
	// 장바구니 물품 삭제
	@RequestMapping("/delCart")
	public String deleteCart(ProductCartVO vo) {
		productCartService.deleteCart(vo);
		return "member/cart";
	}

	// 장바구니
	@RequestMapping("/productCart")
	public String cartList(ProductCartVO vo, Model model) {
		model.addAttribute("cartPrd", productCartService.getProductCartList(vo));
		return "member/cart";
	}
}
