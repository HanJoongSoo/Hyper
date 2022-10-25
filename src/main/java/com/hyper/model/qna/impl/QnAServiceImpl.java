package com.hyper.model.qna.impl;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyper.model.qna.QnAService;
import com.hyper.model.qna.QnAVO;

@Service("QnAService")
public class QnAServiceImpl implements QnAService {

	@Autowired
	private QnADAO QnADAO;
	
	//답글
	public void answerQnABoard(QnAVO vo) throws Exception{
		QnADAO.answerQnABoard(vo);
	}
	// 게시글 쓰기
	public void createQnABoard(QnAVO vo) throws Exception {
		QnADAO.createQnABoard(vo);
	}

	// 게시글 수정
	public void updateQnABoard(QnAVO vo) throws Exception {
		QnADAO.updateQnABoard(vo);
	}

	// 게시글 삭제
	public void deleteQnABoard(int bno) throws Exception {
		QnADAO.deleteQnABoard(bno);
	}
	
	// 게시글 삭제 체크
	public int checkQnABoard(int bno) throws Exception {
		return QnADAO.checkQnABoard(bno);
	}

	// 게시글 읽기
	public QnAVO readQnABoard(int bno) throws Exception {
		return QnADAO.readQnABoard(bno);
	}
	
	// 게시글 목록
	public List<QnAVO> listAllQnABoard(String searchOption, String keyword, int start, int end)
			throws Exception {
		return QnADAO.listAllQnABoard(searchOption, keyword, start, end);
	}
	
	// 이전글
	public QnAVO QnApreviousB(int bno) throws Exception {
		return QnADAO.QnApreviousB(bno);
	}
	
	// 다음글
	public QnAVO QnAnextB(int bno) throws Exception {
		return QnADAO.QnAnextB(bno);
	}
	
	// 조회수
	public void viewCntQnA(int bno, HttpSession session) throws Exception {
		// 타이머 설정
		long update_time = 0;

		if (session.getAttribute("update_time_" + bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (Long) session.getAttribute("update_time_" + bno);
		}
		long current_time = System.currentTimeMillis();
		// 일정 시간이 경과한 후 조회수 증가 처리
		if (current_time - update_time > 5 * 10000) {
			// 조회수 증가 처리
			QnADAO.viewCntQnA(bno);
			// 조회수를 올린 시간 저장
			session.setAttribute("update_time_" + bno, current_time);
		}
	}

	// 게시글 갯수
	public int getCountQnABoard(String searchOption, String keyword) throws Exception {
		return QnADAO.getCountQnABoard(searchOption, keyword);
	}
}
