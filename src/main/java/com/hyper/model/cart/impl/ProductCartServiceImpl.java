package com.hyper.model.cart.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyper.model.cart.ProductCartService;
import com.hyper.model.cart.ProductCartVO;

@Service("productCartService")
public class ProductCartServiceImpl implements ProductCartService {
	@Autowired
	private ProductCartDAO productCartDAO;

	public void insertProductCart(ProductCartVO vo) {
		productCartDAO.insertProductCart(vo);
	}

	public void deleteProductCart(ProductCartVO vo) {
		productCartDAO.deleteProductCart(vo);
	}

	public void deleteCart(ProductCartVO vo) {
		productCartDAO.deleteCart(vo);
	}

	public List<ProductCartVO> getProductCartList(ProductCartVO vo) {
		return productCartDAO.getProductCartList(vo);
	}
}
