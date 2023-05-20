package com.spring.cswiki.dao;

import java.util.List;
import com.spring.cswiki.dto.BoardVO;
import com.spring.cswiki.dto.CommentVO;

public interface boardDAO {
	public List<BoardVO> board(); // 게시판별 목록 전체 출력
	public List<BoardVO> list();// 게시글 목록 출력
	public void create(BoardVO vo); // 글 작성
	public BoardVO detail(int bl_num); // 글 상세정보
	public void update(BoardVO vo); // 글 수정
	public void delete(int bl_num); // 글 삭제
	public List<CommentVO> comment(int bl_num); // 댓글 조회
	public void commentw(CommentVO vo); // 댓글 작성
	public void commentu(CommentVO vo); // 댓글 수정
	public void commentd(CommentVO vo); // 댓글 삭제
}
