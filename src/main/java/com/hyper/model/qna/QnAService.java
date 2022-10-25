package com.hyper.model.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface QnAService {

	void createQnABoard(QnAVO vo) throws Exception; // 게시글 쓰기

	void updateQnABoard(QnAVO vo) throws Exception; // 게시글 수정

	void deleteQnABoard(int bno) throws Exception; // 게시글 삭제

	int checkQnABoard(int bno) throws Exception; // 게시글 삭제 체크, 숨김

	QnAVO readQnABoard(int bno) throws Exception; // 게시글 읽기

	void viewCntQnA(int bno, HttpSession session) throws Exception; // 조회수

	QnAVO QnApreviousB(int bno) throws Exception; // 이전글

	QnAVO QnAnextB(int bno) throws Exception; // 다음글

	List<QnAVO> listAllQnABoard(String searchOption, String keyword, int start, int end) throws Exception; // 게시글 목록

	int getCountQnABoard(String searchOption, String keyword) throws Exception; // 게시글 갯수

	void answerQnABoard(QnAVO vo) throws Exception; // 답글

}
