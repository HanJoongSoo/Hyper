package com.hyper.view.board;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.hyper.home.Pager;
import com.hyper.model.board.BoardService;
import com.hyper.model.board.BoardVO;

@Controller
@SessionAttributes("board")
public class BoardController {

	@Autowired
	private BoardService boardService;

	// 게시글 등록 뷰
	@RequestMapping("/write")
	public String write(BoardVO vo) throws Exception {
		return "board/write";
	}
	
	// FAQ 게시판 뷰
	@RequestMapping("/faq")
	public String faqView() {
		return "common/faq";
	}
	
	// 오시는길게시판 뷰
	@RequestMapping("/location")
	public String locationView() {
		return "common/location";
	}
	
	// 브랜드소개 게시판 뷰
	@RequestMapping("/welcome")
	public String welcomeView() {
		return "common/welcome";
	}

	// 게시글 등록
	@RequestMapping(value = "/createBoard", method = RequestMethod.POST)
	public String createBoard(BoardVO vo) throws Exception {
		boardService.createBoard(vo);
		return "board/list";
	}

	// 게시글 수정 뷰
	@RequestMapping("/updateWrite")
	public String updateWrite(BoardVO vo) throws Exception {
		return "board/updateWrite";
	}

	// 게시글 수정
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	public String updateBoard(BoardVO vo) throws Exception {
		if (vo.getTitle() != null) {
			boardService.updateBoard(vo);
			return "board/view";
		} else {
			return "board/write";
		}
		// return "redirect:/board";
	}

	// 게시글 삭제
	@RequestMapping("/delete")
	public String deleteBoard(int bno) throws Exception {
		boardService.deleteBoard(bno); // 삭제 처리
		return "redirect:/board"; // 목록으로 이동
	}

	// 게시글 목록 + 검색 + 페이징
	@RequestMapping("/board")
	public String listAllBoard(Model model, HttpSession session,
			@RequestParam(defaultValue = "TITLE") String searchOption, @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 게시글 갯수 계산
		int count = boardService.getCountBoard(searchOption, keyword);

		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardVO> list = boardService.listAllBoard(searchOption, keyword, start, end); // 게시글 목록

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		model.addAttribute("map", map);

		return "board/list";
	}

	// 게시글 상세보기
	@RequestMapping("/view")
	public String readBoard(@RequestParam("bno") int bno, @RequestParam("show") String show, Model model,
			HttpSession session, @RequestParam(defaultValue = "TITLE") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {

		/* 게시글 예외처리 */
		// 삭제된 게시글울 읽으려고 하는 경우
		int checkBoard = boardService.checkBoard(bno);

		if (checkBoard == 0 && show.equals("N")) {
			return "board/checkDel";
		}

		// 존재하지 않는 게시글에 접근하려는 경우
		else if (checkBoard == 0 && show.equals("Y")) {
			return "board/checkNone";

		} else if (checkBoard == 1 && show.equals("N")) {
			return "board/checkNone";
		}

		boardService.viewCnt(bno, session); // 조회수
		model.addAttribute("board", boardService.readBoard(bno)); // 게시글 읽기

		// 세션 저장
		searchOption = (String) session.getAttribute("searchOption");
		session.setAttribute("searchOption", searchOption);

		keyword = (String) session.getAttribute("keyword");
		session.setAttribute("keyword", keyword);

		search = (String) session.getAttribute("search");
		session.setAttribute("search", search);

		// curPage = (int) session.getAttribute("curPage");
		curPage = (Integer) session.getAttribute("curPage");
		session.setAttribute("curPage", curPage);

		BoardVO plist = boardService.previousB(bno);
		BoardVO nlist = boardService.nextB(bno);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("previousB", plist);
		map.put("nextB", nlist);
		model.addAttribute("map", map);

		return "board/view";
	}
}