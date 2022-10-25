package com.hyper.view.member;

import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hyper.home.Pager;
import com.hyper.model.member.MemberService;
import com.hyper.model.member.MemberVO;
import com.hyper.model.payment.PaymentVO;
import com.hyper.model.product.ProductInfoVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/main")
	public String main() {
		return "main";
	}

	// 회원가입 뷰
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpView(MemberVO vo) {
		return "member/signup";
	}

	// 회원 주문내역
	@ResponseBody
	@RequestMapping("/mypL")
	public String mypage1(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		// 주문 테이블 갯수 계산
		int count = memberService.getCountOrder(vo);

		session.setAttribute("myp", myp);
		session.setAttribute("member_id", vo.getMember_id());

		// 페이지 관련 설정
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<PaymentVO> list = memberService.getOrderList(vo, start, end);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		session.setAttribute("map", map);
		return "member/mypage";
	}

	// 회원 주문내역 뷰 (페이징 처리)
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageView(MemberVO vo, HttpSession session, Model model, @RequestParam(defaultValue = "1") int myp) {
		int count = memberService.getCountOrder(vo);
		Pager pager = new Pager(count, myp);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<PaymentVO> list = memberService.getOrderList(vo, start, end);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("mypL", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		session.setAttribute("map", map);
		return "member/mypage";
	}

	// 마이페이지-비밀번호 view
	@RequestMapping(value = "/mypage2", method = RequestMethod.GET)
	public String mypageView2(MemberVO vo) {
		return "member/mypage2";
	}

	// 마이페이지-비밀번호 확인 처리
	@RequestMapping(value = "/mypage2", method = RequestMethod.POST)
	public String mypage2(MemberVO vo) {
		memberService.login(vo);
		return "member/mypage3";
	}

	// 마이페이지-회원정보수정 view
	@RequestMapping(value = "/mypage3", method = RequestMethod.GET)
	public String mypageView3(MemberVO vo) {
		return "member/mypage3";
	}

	// 마이페이지-회원정보수정 처리
	@RequestMapping(value = "/mypage3", method = RequestMethod.POST)
	public String mypage3(MemberVO vo) {
		memberService.updateMember(vo);
		return "member/mypage";
	}

	// 마이페이지-완료 view
	@RequestMapping("/mypage4")
	public String mypage4(MemberVO vo) {
		return "member/mypage4";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "member/login";
	}

	// 회원정보 삭제
	@RequestMapping(value = "/delMember", method = RequestMethod.GET)
	public String deleteMember(MemberVO vo, HttpSession session) {
		memberService.deleteMember(vo);
		session.invalidate();
		return "main";
	}

	// 아이디 중복검사
	@ResponseBody
	@RequestMapping(value = "/checkID")
	public int checkID(MemberVO vo) {
		int checkID = memberService.checkID(vo);
		return checkID;
	}

	@ResponseBody
	@RequestMapping(value = "/checkMember")
	public int checkMember(MemberVO vo) {
		int checkMember = memberService.checkMember(vo);
		return checkMember;
	}

	// 회원가입
	@RequestMapping("/join")
	public String signUp(MemberVO vo) {
		System.out.println("가입 성공....");
		memberService.insertMember(vo);
		return "main";
	}

	// 로그인 뷰
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginView(MemberVO vo) {
		return "member/login";
	}

	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		MemberVO member = memberService.login(vo);
		if (member != null) {
			session.setAttribute("member", member);
			return "main";
		} else {
			return "member/login";
		}
	}

	// 아이디 찾기 페이지 뷰
	@RequestMapping(value = "/find_id_form")
	public String findIdView() {
		return "member/findId";
	}

	// 아이디 찾기 페이지 뷰
	// 아이디 찾기 실행
	@RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String findIdAction(MemberVO vo, Model model) {
		MemberVO user = memberService.findId(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("member_id", user.getMember_id());
		}

		return "member/findId";
	}

	// 비밀번호 찾기
	// 비밀번호 찾기 페이지로 이동
	@RequestMapping(value = "/find_password_form")
	public String findPasswordView() {
		return "member/findPassword";
	}

	// 비밀번호 찾기 실행
	@RequestMapping(value = "/find_password", method = RequestMethod.POST)
	public String findPasswordAction(MemberVO vo, Model model) {
		MemberVO user = memberService.findPassword(vo);

		if (user == null) {
			model.addAttribute("check", 1);
		} else {
			model.addAttribute("check", 0);
			model.addAttribute("updateid", user.getMember_id());
		}

		return "member/findPassword";
	}

	// 비밀번호 바꾸기 메서드
	@RequestMapping(value = "/update_password", method = RequestMethod.POST)
	public String updatePasswordAction(@RequestParam(value = "updateid", defaultValue = "", required = false) String id,
			MemberVO vo) {
		vo.setMember_id(id);
		System.out.println(vo);
		memberService.updatePassword(vo);
		return "member/findPasswordConfirm";
	}

	// 비밀번호 변경 후 성공페이지 이동
	@RequestMapping(value = "/check_password_view")
	public String checkPasswordForModify(HttpSession session, Model model) {
		MemberVO loginUser = (MemberVO) session.getAttribute("login");

		if (loginUser == null) {
			return "member/login";
		} else {
			return "member/findPasswordConfirm";
		}
	}

	// 관리자 용 회원 목록
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberListView(@RequestParam(defaultValue = "1") int curPage, MemberVO vo, Model model) {
		int count = memberService.getAdminCountMember(vo);
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<MemberVO> list = memberService.getAdminMemberList(start, end, vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("count", count);
		map.put("pager", pager);
		model.addAttribute("map", map);
		return "admin/memberList";
	}

	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	// 관리자가 회원 정보 수정 -view
	@RequestMapping(value = "/updateMember", method = RequestMethod.GET)
	public String adminUpdateView(MemberVO vo, Model model) {
		model.addAttribute("member2", memberService.memberDetail(vo));
		return "admin/updateMember";
	}

	// 관리자가 회원정보수정 처리
	@RequestMapping(value = "/updateMember2", method = RequestMethod.POST)
	public String adminUpdate(MemberVO vo) {
		System.out.println("전");
		memberService.updateMember2(vo);
		System.out.println("후");
		return "admin/memberList";
	}

	// 관리자 회원정보 삭제
	@RequestMapping(value = "/delMember2", method = RequestMethod.GET)
	public String deleteMember2(MemberVO vo) {
		memberService.deleteMember(vo);
		return "admin/memberList";
	}
	// @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	// 관리자 품목 리스트 + 페이징 + 검색
	@RequestMapping(value = "/searchMember", method = RequestMethod.GET)
	public String listPage2(Model model, HttpSession session, MemberVO vo,
			@RequestParam(defaultValue = "") String sMember, @RequestParam(defaultValue = "1") int curPage) {
		// 게시글 갯수 계산
		System.out.println("검색전>>>");
		int count = memberService.countSearchMember(sMember);
		System.out.println("검색시작>>>");
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();
		System.out.println("페이징");
		session.setAttribute("sMember", sMember); // 상품 이름 검색
		session.setAttribute("curPage", curPage);

		System.out.println("검색");
		List<MemberVO> list = memberService.listSearchMember(sMember, start, end); // 게시글 목록
		System.out.println("검색시작");
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("sMember", sMember);
		model.addAttribute("map", map);
		System.out.println("검색 받아오기");
		return "member/membersearch";
	}
}
