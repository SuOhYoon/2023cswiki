package com.spring.cswiki.service;

import java.util.List;
import com.spring.cswiki.dto.BoardVO;

public interface boardService {
	
	public List<BoardVO> list();
	public void create(BoardVO vo);
	public BoardVO detail(int bl_num);
	public void update(BoardVO vo);
	public void delete(int bl_num);
}
