package com.hyper.model.qna.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyper.model.qna.QnAVO;

@Repository
public class QnADAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	//답글
	public void answerQnABoard(QnAVO vo) {
		mybatis.update("QnADAO.answerQnABoard",vo);
	}
	// 게시글 쓰기
	public void createQnABoard(QnAVO vo) {
		mybatis.insert("QnADAO.createQnABoard", vo);
	}

	// 게시글 수정
	public void updateQnABoard(QnAVO vo) {
		mybatis.update("QnADAO.updateQnABoard", vo);
	}

	// 게시글 삭제
	public void deleteQnABoard(int bno) {
		mybatis.update("QnADAO.deleteQnABoard", bno);
	}
	
	// 게시글 삭제 체크
	public int checkQnABoard(int bno) throws Exception {
		return mybatis.selectOne("QnADAO.checkQnABoard", bno);
	}

	// 게시글 읽기
	public QnAVO readQnABoard(int bno) {
		return (QnAVO) mybatis.selectOne("QnADAO.readQnABoard", bno);
	}
	
	// 이전글
	public QnAVO QnApreviousB(int bno) {
		return (QnAVO) mybatis.selectOne("QnADAO.QnApreviousB", bno);
	}

	// 다음글
	public QnAVO QnAnextB(int bno) {
		return (QnAVO) mybatis.selectOne("QnADAO.QnAnextB", bno);
	}
	
	// 게시물 목록
	public List<QnAVO> listAllQnABoard(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("QnADAO.listAllQnABoard", map);
	}

	// 조회수
	public void viewCntQnA(int bno) {
		mybatis.update("QnADAO.viewCntQnA", bno);
	}

	// 게시글 갯수
	public int getCountQnABoard(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("QnADAO.getCountQnABoard", map);
	}

}
