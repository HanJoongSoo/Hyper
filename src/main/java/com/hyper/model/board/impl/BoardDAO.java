package com.hyper.model.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hyper.model.board.BoardVO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	// 게시글 쓰기
	public void createBoard(BoardVO vo) {
		mybatis.insert("BoardDAO.createBoard", vo);
	}

	// 게시글 수정
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.updateBoard", vo);
	}

	// 게시글 삭제
	public void deleteBoard(int bno) {
		mybatis.update("BoardDAO.deleteBoard", bno);
	}

	// 게시글 삭제 체크
	public int checkBoard(int bno) throws Exception {
		return mybatis.selectOne("BoardDAO.checkBoard", bno);
	}

	// 게시글 읽기
	public BoardVO readBoard(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.readBoard", bno);
	}

	// 이전글
	public BoardVO previousB(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.previousB", bno);
	}

	// 다음글
	public BoardVO nextB(int bno) {
		return (BoardVO) mybatis.selectOne("BoardDAO.nextB", bno);
	}

	// 게시물 목록
	public List<BoardVO> listAllBoard(String searchOption, String keyword, int start, int end) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		map.put("start", start);
		map.put("end", end);
		return mybatis.selectList("BoardDAO.listAllBoard", map);
	}

	// 조회수
	public void viewCnt(int bno) {
		mybatis.update("BoardDAO.viewCnt", bno);
	}

	// 게시글 갯수
	public int getCountBoard(String searchOption, String keyword) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);
		return mybatis.selectOne("BoardDAO.getCountBoard", map);
	}

}
