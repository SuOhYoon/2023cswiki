package com.spring.cswiki.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.spring.cswiki.dto.MemberDTO;

	@Repository // 현재 클래스를 dao bean으로 등록
	public class MemberDAOImpl implements MemberDAO {
	private static String namespace = "com.spring.cswiki.mappers.member";
	@Inject
	SqlSession sql; // SqlSession 의존관계 주입
	
	@Override
	public MemberDTO login(String u_id) { 
		return sql.selectOne(namespace + ".login", u_id);
	}

	@Override
	public List<MemberDTO> list() {
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void join(MemberDTO dto) { 
		sql.insert(namespace + ".join", dto);		
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void grant(MemberDTO dto) throws Exception {
		sql.update(namespace+".grant", dto);
	}
}
