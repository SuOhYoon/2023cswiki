package com.spring.cswiki.dao;

import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.spring.cswiki.dto.MemberDTO;

	@Repository // 현재 클래스를 dao bean으로 등록
	public class MemberDAOImpl implements MemberDAO {
	private static String namespace = "com.spring.cswiki.mappers.member";
	@Inject
	SqlSession sql; // SqlSession 의존관계 주입
	
	@Override
	public String loginCheck(MemberDTO dto) {
		return sql.selectOne(namespace + ".doc", dto);
	}

	@Override
	public List<MemberDTO> list() {
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void join(MemberDTO dto) {
		sql.insert(namespace + ".join", dto);		
	}
}
