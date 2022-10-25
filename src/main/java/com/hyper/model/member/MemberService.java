package com.hyper.model.member;

import java.util.List;

import com.hyper.model.payment.PaymentVO;
import com.hyper.model.product.ProductInfoVO;

public interface MemberService {

	// ID 중복검사
	int checkID(MemberVO vo);

	// 로그인시 회원 체크
	int checkMember(MemberVO vo);

	// 회원가입
	void insertMember(MemberVO vo);

	// 마이페이지
	// 회원 주문내역
	List<PaymentVO> getOrderList(MemberVO vo, int start, int end);

	// 회원 주문내역 갯수
	int getCountOrder(MemberVO vo);

	// 회원정보 수정
	void updateMember(MemberVO vo);

	// 회원정보 삭제
	void deleteMember(MemberVO vo);

	// 로그인
	MemberVO login(MemberVO vo);

	// 회원 리스트
	List<MemberVO> getMemberList(int start, int end, MemberVO vo);
	
	// 갯수 가져오기
	int getCountMember(MemberVO vo);

	// 아이디 찾기
	MemberVO findId(MemberVO vo);

	// 비번 찾기
	MemberVO findPassword(MemberVO vo);

	// 비번 찾아서 바꿈
	void updatePassword(MemberVO vo);
	
	// 관리자 회원카운트
	int getAdminCountMember(MemberVO vo);
	
	// 관리자 회원목록
	List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo);
	
	//회원 상세보기
	MemberVO memberDetail(MemberVO vo);
	
	// 관리자 회원수정
	void updateMember2(MemberVO vo);
	
	//관리자 회원삭제
	void deleteMember2(MemberVO vo);
	
	// 회원 검색
	List<MemberVO> listSearchMember(String sMember, int start, int end);
	
	// 회원 갯수 가져오기
	int countSearchMember(String sMember);
}