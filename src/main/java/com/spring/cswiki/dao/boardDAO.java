package com.spring.cswiki.dao;

import java.util.List;
import com.spring.cswiki.dto.BoardVO;

public interface boardDAO {
	public List<BoardVO> list();// 조회

	public void create(BoardVO vo); // 쓰기

	public BoardVO detail(int bl_num); // 상세보기

	public void update(BoardVO vo); // 수정하기
	
	public void delete(int bl_num); // 삭제하기

}
