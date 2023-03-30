package com.spring.cswiki.dao;

import java.util.List;
import com.spring.cswiki.dto.BoardVO;


public interface boardDAO {
	public List<BoardVO> list();// 조회
}
