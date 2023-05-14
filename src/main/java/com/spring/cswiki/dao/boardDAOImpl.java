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

	@Override
	public List<BoardVO> board() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	@Override
	public List<BoardVO> list() {
		return sql.selectList(namespace + ".list");
	}

	// �Խñ� ���
	@Override
	public void create(BoardVO vo) {
		sql.insert(namespace + ".create", vo);
	}

	// �Խù� �󼼺��� �ҷ�����
	@Override
	public BoardVO detail(int bl_num) {
		return sql.selectOne(namespace + ".detail", bl_num);
	}

	// �Խù� ����
	@Override
	public void update(BoardVO vo) {
		sql.update(namespace + ".update", vo);
	}
	
	// �Խñ� ����
	@Override
	public void delete(int bl_num) {
		sql.delete(namespace + ".delete", bl_num);
	}

}
