package com.spring.cswiki.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.spring.cswiki.dto.BoardVO;

@Repository
public class boardDAOImpl implements boardDAO {
	
	@Inject
	private SqlSession sql;

	private static String namespace = "com.spring.cswiki.mappers.board";

	// 게시물 목록
	// @Override
	public List<BoardVO> list() {
		return sql.selectList(namespace + ".list");
	}
}
