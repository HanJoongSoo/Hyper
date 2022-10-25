package com.hyper.view.qna;

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
import com.hyper.model.qna.QnAService;
import com.hyper.model.qna.QnAVO;

@Controller
@SessionAttributes("boardqna")
public class QnAController {

	@Autowired
	private QnAService qnaService;

	// 답변 뷰
	@RequestMapping("/answerQnA")
	public String answerQnA(QnAVO vo) throws Exception {
		return "boardqna/answer";
	}

	// 답변
	@RequestMapping(value = "/answerQnABoard", method = RequestMethod.POST)
	public String answerQnABoard(QnAVO vo) throws Exception {
		if (vo.getAnswer() != null) {
			qnaService.answerQnABoard(vo);
			return "boardqna/view";
		} else {
			return "boardqna/answer";
		}
	}

	// 게시글 등록 뷰
	@RequestMapping("/writeQnA")
	public String writeQnA(QnAVO vo) throws Exception {
		return "boardqna/write";
	}

	// 게시글 등록
	@RequestMapping(value = "/createQnABoard", method = RequestMethod.POST)
	public String createQnABoard(QnAVO vo) throws Exception {
		qnaService.createQnABoard(vo);
		return "boardqna/list";
	}

	// 게시글 수정 뷰
	@RequestMapping("/updateWriteQnA")
	public String updateWriteQnA(QnAVO vo) throws Exception {
		return "boardqna/updateWrite";
	}

	// 게시글 수정
	@RequestMapping(value = "/updateQnABoard", method = RequestMethod.POST)
	public String updateQnABoard(QnAVO vo) throws Exception {
		if (vo.getTitle() != null) {
			qnaService.updateQnABoard(vo);
			return "boardqna/view";
		} else {
			return "boardqna/write";
		}
	}

	// 게시글 삭제
	@RequestMapping("/deleteQnA")
	public String deleteQnABoard(int bno) throws Exception {
		qnaService.deleteQnABoard(bno); // 삭제 처리
		return "redirect:/boardqna"; // 목록으로 이동
	}

	// 게시글 목록 + 검색 + 페이징
	@RequestMapping("/boardqna")
	public String listAllQnABoard(Model model, HttpSession session,
			@RequestParam(defaultValue = "TITLE") String searchOption, @RequestParam(defaultValue = "") String keyword,
			@RequestParam(defaultValue = "") String search, @RequestParam(defaultValue = "1") int curPage)
			throws Exception {

		// 게시글 갯수 계산
		int count = qnaService.getCountQnABoard(searchOption, keyword);

		session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);

		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<QnAVO> list = qnaService.listAllQnABoard(searchOption, keyword, start, end); // 게시글 목록

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", list); // map에 자료 저장
		map.put("count", count);
		map.put("pager", pager); // 페이지 네버게이션을 위한 변수
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("search", search);
		model.addAttribute("map", map);

		return "boardqna/list";
	}

	// 게시글 상세보기
	@RequestMapping("/viewQnA")
	public String readQnABoard(@RequestParam("bno") int bno, @RequestParam("show") String show, Model model,
			HttpSession session, @RequestParam(defaultValue = "TITLE") String searchOption,
			@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "") String search,
			@RequestParam(defaultValue = "1") int curPage) throws Exception {

		/* 게시글 예외처리 */
		// 삭제된 게시글울 읽으려고 하는 경우
		int checkQnA = qnaService.checkQnABoard(bno);

		if (checkQnA == 0 && show.equals("N")) {
			return "boardqna/checkDel";
		}

		// 존재하지 않는 게시글에 접근하려는 경우
		else if (checkQnA == 0 && show.equals("Y")) {
			return "boardqna/checkNone";

		} else if (checkQnA == 1 && show.equals("N")) {
			return "boardqna/checkNone";
		}

		qnaService.viewCntQnA(bno, session); // 조회수
		model.addAttribute("boardqna", qnaService.readQnABoard(bno)); // 게시글 읽기

		// 세션 저장
		searchOption = (String) session.getAttribute("searchOption");
		session.setAttribute("searchOption", searchOption);

		keyword = (String) session.getAttribute("keyword");
		session.setAttribute("keyword", keyword);

		search = (String) session.getAttribute("search");
		session.setAttribute("search", search);

		curPage = (Integer) session.getAttribute("curPage");
		session.setAttribute("curPage", curPage);

		QnAVO plist = qnaService.QnApreviousB(bno);
		QnAVO nlist = qnaService.QnAnextB(bno);

		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("QnApreviousB", plist);
		map.put("QnAnextB", nlist);
		model.addAttribute("map", map);

		return "boardqna/view";
	}
}