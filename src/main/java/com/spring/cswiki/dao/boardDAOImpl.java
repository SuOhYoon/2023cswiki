package com.spring.cswiki.dao;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.spring.cswiki.dto.BoardVO;
import com.spring.cswiki.dto.CommentVO;

@Repository
public class boardDAOImpl implements boardDAO {

	@Inject
	private SqlSession sql;

	private static String namespace = "com.spring.cswiki.mappers.board";

	@Override
	public List<BoardVO> board() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	@Override
	public List<BoardVO> list() {
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void create(BoardVO vo) {
		sql.insert(namespace + ".create", vo);
	}

	@Override
	public BoardVO detail(int bl_num) {
		return sql.selectOne(namespace + ".detail", bl_num);
	}

	@Override
	public void update(BoardVO vo) {
		sql.update(namespace + ".update", vo);
	}
	
	@Override
	public void delete(int bl_num) {
		sql.delete(namespace + ".delete", bl_num);
	}
	
	@Override
	public List<CommentVO> comment(int bl_num) {
		return sql.selectList(namespace + ".comment",  bl_num);
	}
	@Override
	public void commentw(CommentVO vo) {
		sql.insert(namespace + ".commentw", vo);
	}
	@Override
	public void commentu(CommentVO vo) {
		sql.update(namespace + ".commentu", vo);
		
	}
	@Override
	public void commentd(CommentVO vo) {
		sql.delete(namespace + ".commentu", vo);
		
	}
}
