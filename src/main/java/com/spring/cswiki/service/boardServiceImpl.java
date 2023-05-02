package com.spring.cswiki.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;

import com.spring.cswiki.dao.boardDAO;
import com.spring.cswiki.dto.BoardVO;

@Service
public class boardServiceImpl implements boardService {

	@Inject
	private boardDAO dao;

	// �쉶�썝 紐⑸줉
	@Override
	public List<BoardVO> list() {
		return dao.list();
	}

	@Override
	public void create(BoardVO vo) {
		dao.create(vo);
	}

	// 게시물 상세보기 불러오기
	@Override
	public BoardVO detail(int bl_num) {
		return dao.detail(bl_num);
	}

	// 게시물 수정
	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	// 게시물 삭제
	public void delete(int bl_num) {
		dao.delete(bl_num);
	}
}
