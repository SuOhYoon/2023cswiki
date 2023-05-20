package com.spring.cswiki.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.spring.cswiki.dao.boardDAO;
import com.spring.cswiki.dto.BoardVO;
import com.spring.cswiki.dto.CommentVO;

@Service
public class boardServiceImpl implements boardService {

	@Inject
	private boardDAO dao;

	@Override
	public List<BoardVO> board() {
		// TODO Auto-generated method stub
		return dao.board();
	}

	@Override
	public List<BoardVO> list() {
		return dao.list();
	}

	@Override
	public void create(BoardVO vo) {
		dao.create(vo);
	}

	@Override
	public BoardVO detail(int bl_num) {
		return dao.detail(bl_num);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	public void delete(int bl_num) {
		dao.delete(bl_num);
	}
	@Override
	public List<CommentVO> comment(int bl_num) {
		// TODO Auto-generated method stub
		return dao.comment(bl_num);
	}
	@Override
	public void commentw(CommentVO vo) {
		dao.commentw(vo);
	}

	@Override
	public void commentu(CommentVO vo) {
		dao.commentu(vo);
		
	}

	@Override
	public void commentd(CommentVO vo) {
		dao.commentd(vo);	
	}
}
