package com.hyper.model.member.impl;

import java.util.List;

import org.bouncycastle.jcajce.provider.digest.SHA3;
import org.bouncycastle.util.encoders.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyper.model.member.MemberService;
import com.hyper.model.member.MemberVO;
import com.hyper.model.payment.PaymentVO;
import com.hyper.model.product.ProductInfoVO;

@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	// 패스워드 암호화
	public void securityPWD(MemberVO vo) {
		SHA3.DigestSHA3 digestSHA3 = new SHA3.DigestSHA3(512);
		byte[] digest = digestSHA3.digest(vo.getMember_pwd().getBytes());
		String securitypwd = Hex.toHexString(digest);
		vo.setMember_pwd(securitypwd);
	}

	// ID 중복검사
	public int checkID(MemberVO vo) {
		return memberDAO.checkID(vo);
	}

	// 회원 유무 검사
	public int checkMember(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.checkMember(vo);
	}

	// 회원가입
	public void insertMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.insertMember(vo);
	}

	// 로그인
	public MemberVO login(MemberVO vo) {
		securityPWD(vo);
		return memberDAO.login(vo);
	}

	// 회원정보 수정
	public void updateMember(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updateMember(vo);
	}

	// 회원정보 삭제
	public void deleteMember(MemberVO vo) {
		memberDAO.deleteMember(vo);
	}

	// 회원 주문내역
	public List<PaymentVO> getOrderList(MemberVO vo, int start, int end) {
		return memberDAO.getOrderList(vo, start, end);
	}

	// 회원 주문내역 갯수
	public int getCountOrder(MemberVO vo) {
		return memberDAO.getCountOrder(vo);
	}

	public List<MemberVO> getMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getMemberList(start, end, vo);
	}

	public int getCountMember(MemberVO vo) {
		return memberDAO.getCountMember(vo);
	}

	// 아이디찾기
	@Override
	public MemberVO findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}

	// 비밀번호 찾기
	@Override
	public MemberVO findPassword(MemberVO vo) {
		return memberDAO.findPassword(vo);
	}

	// 비밀번호 변경
	@Override
	public void updatePassword(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updatePassword(vo);

	}
	
	// 관리자 페이지 회원리스트 갯수 체크
	public int getAdminCountMember(MemberVO vo) {
		return memberDAO.getAdminCountMember(vo);
	}
	
	// 관리자 회원 리스트
	public List<MemberVO> getAdminMemberList(int start, int end, MemberVO vo) {
		return memberDAO.getAdminMemberList(start, end, vo);
	}
	
	// 품목 상세보기
	public MemberVO memberDetail(MemberVO vo) {
		return memberDAO.memberDetail(vo);
	}
	
	// 관리자 회원정보 수정
	public void updateMember2(MemberVO vo) {
		securityPWD(vo);
		memberDAO.updateMember2(vo);
	}
	
	// 관리자 회원정보 삭제
	public void deleteMember2(MemberVO vo) {
		memberDAO.deleteMember2(vo);
	}
	
	// 검색
	public List<MemberVO> listSearchMember(String sMember, int start, int end) {
		return memberDAO.listSearchMember(sMember, start, end);
	}
	
	//갯수 가져오기
	public int countSearchMember(String sMember) {
			return memberDAO.countSearchMember(sMember);
		}
}
