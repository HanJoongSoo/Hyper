package com.hyper.model.product;

import java.util.List;

public interface ProductService {

	// 관리자
	int prdCheckID(ProductInfoVO vo);

	// 물품 검색
	List<ProductInfoVO> listSearchPrd(String sPrd, int start, int end);
	
	// 갯수 가져오기
	int countSearchPrd(String sPrd);
	
	// 물품 등록
	void insertProduct(ProductInfoVO vo);
	
	// 물품 수정
	void updateProduct(ProductInfoVO vo);
	
	// 물품 삭제
	void deleteProuct(ProductInfoVO vo);

	// 물품 리스트
	List<ProductInfoVO> getProductList(int start, int end, ProductInfoVO vo);
	
	// 관리자 물품 리스트
	List<ProductInfoVO> getAdminProductList(int start, int end, ProductInfoVO vo);
	
	int getCountProduct(ProductInfoVO vo);

	int getAdminCountProduct(ProductInfoVO vo);

	ProductInfoVO productDetail(ProductInfoVO vo);
}