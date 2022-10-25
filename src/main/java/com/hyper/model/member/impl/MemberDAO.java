package com.hyper.model.member.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyper.model.member.MemberVO;
import com.hyper.model.payment.PaymentVO;
import com.hyper.model.product.ProductInfoVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 아이디 중복검사
	public int checkID(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkID", vo);
	}

	// 회원 존재 유무 검사
	public int checkMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.checkMember", vo);
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		mybatis.insert("MemberDAO.insertMember", vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		return (MemberVO) mybatis.selectOne("MemberDAO.login", vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember", vo);
	}

	// 회원정보 삭제
	public void deleteMember(MemberVO vo) {
		mybatis.delete("MemberDAO.deleteMember", vo);
	}

	// 회원 주문내역
	public List<PaymentVO> getOrderList(MemberVO vo, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", vo.getMember_id());
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("MemberDAO.orderMember", map);
	}

	// 회원 주문내역 갯수
	public int getCountOrder(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.orderCount", vo);
	}

	// 테스트용
	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("member", vo);
		return mybatis.selectList("MemberDAO.getMemberList", map);
	}

	public int getCountMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.getCountMember", vo);
	}

	// 아이디 찾기
	public MemberVO findId(MemberVO vo) {
		System.out.println("아이디찾기 ㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱㄱ");
		return mybatis.selectOne("MemberDAO.findId", vo);
	}

	// 비밀번호 찾기
	public MemberVO findPassword(MemberVO vo) {
		System.out.println("비번찾기 ㄱㄱ");
		return mybatis.selectOne("MemberDAO.findPassword", vo);
	}
	// 비밀번호 찾은후 변경
	public void updatePassword(MemberVO vo) {
		System.out.println("비번찾은후 변경");
		mybatis.update("MemberDAO.updatePassword", vo);
	}
	
	// 관리자 페이지 회원리스트 갯수 체크
	public int getAdminCountMember(MemberVO vo) {
		return mybatis.selectOne("MemberDAO.getAdminCountMember", vo);
	}
	
	// 회원 리스트
	public List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		map.put("member2", vo);
		return mybatis.selectList("MemberDAO.getAdminMemberList", map);
	}
	// 회원 상세보기
	public MemberVO memberDetail(MemberVO vo) {
		return (MemberVO) mybatis.selectOne("MemberDAO.memberDetail", vo);
	}
	
	// 관리자 회원정보수정
	public void updateMember2(MemberVO vo) {
		mybatis.update("MemberDAO.updateMember2", vo);
	}
	
	// 관리자 회원정보삭제
	public void deleteMember2(MemberVO vo) {
		mybatis.delete("MemberDAO.deleteMember2", vo);
	}
	
	// 검색
	public List<MemberVO> listSearchMember(String sMember, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sMember", sMember);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("MemberDAO.listSearchMember", map);
	}
	
	// 갯수 가져오기
	public int countSearchMember(String sMember) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("sMember", sMember);
			return mybatis.selectOne("MemberDAO.countSearchMember", map);
		}
}
