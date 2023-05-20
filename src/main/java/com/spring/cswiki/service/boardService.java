package com.spring.cswiki.service;

import java.util.List;
import com.spring.cswiki.dto.BoardVO;
import com.spring.cswiki.dto.CommentVO;

public interface boardService {
	public List<BoardVO> board();
	public List<BoardVO> list();
	public void create(BoardVO vo);
	public BoardVO detail(int bl_num);
	public void update(BoardVO vo);
	public void delete(int bl_num);
	public List<CommentVO> comment(int bl_num); // 댓글 조회
	public void commentw(CommentVO vo);
	public void commentu(CommentVO vo); // 댓글 수정
	public void commentd(CommentVO vo); // 댓글 삭제
}
