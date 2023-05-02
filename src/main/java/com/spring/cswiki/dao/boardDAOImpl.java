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

	// 게시글 목록
	// @Override
	public List<BoardVO> list() {
		return sql.selectList(namespace + ".list");
	}

	// 게시글 등록
	@Override
	public void create(BoardVO vo) {
		sql.insert(namespace + ".create", vo);
	}

	// 게시물 상세보기 불러오기
	@Override
	public BoardVO detail(int bl_num) {
		return sql.selectOne(namespace + ".detail", bl_num);
	}

	// 게시물 수정
	@Override
	public void update(BoardVO vo) {
		sql.update(namespace + ".update", vo);
	}
	
	// 게시글 삭제
	@Override
	public void delete(int bl_num) {
		sql.delete(namespace + ".delete", bl_num);
	}

}
