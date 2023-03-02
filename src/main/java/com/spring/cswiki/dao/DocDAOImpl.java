package com.spring.cswiki.dao;

import java.util.List;

import com.spring.cswiki.dto.DocDTO;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.spring.cswiki.dto.DocDTO;

@Repository
public class DocDAOImpl implements DocDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.spring.cswiki.mappers.doc";
	
	public List<DocDTO> list(){
		return sql.selectList(namespace + ".list");
	}

	@Override
	public void create(DocDTO dto) {
		sql.insert(namespace + ".create", dto);		
	}
}
