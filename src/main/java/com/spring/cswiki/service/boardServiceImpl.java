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

	// 회원 목록
	@Override
	public List<BoardVO> list() {
		return dao.list();
	}
}
