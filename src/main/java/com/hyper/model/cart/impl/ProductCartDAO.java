package com.hyper.model.cart.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyper.model.cart.ProductCartVO;

@Repository
public class ProductCartDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 장바구니 등록
	public void insertProductCart(ProductCartVO vo) {
		mybatis.insert("ProductCartDAO.insertProductCart", vo);
	}

	// 장바구니 전체 삭제
	public void deleteProductCart(ProductCartVO vo) {
		mybatis.delete("ProductCartDAO.deleteProductCart", vo);
	}

	// 장바구니 비우기
	public void deleteCart(ProductCartVO vo) {
		mybatis.delete("ProductCartDAO.deleteCart", vo);
	}

	// 장바구니 리스트 출력
	public List<ProductCartVO> getProductCartList(ProductCartVO vo) {
		return mybatis.selectList("ProductCartDAO.productCart", vo);
	}
}
