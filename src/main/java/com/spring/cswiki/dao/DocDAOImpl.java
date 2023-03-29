package com.spring.cswiki.dao;

import java.util.List;

import com.spring.cswiki.dto.DocDTO;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


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

	@Override
	public DocDTO doc(int d_num) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".doc", d_num);
	}

	@Override
	public void edit(DocDTO dto) {
		sql.update(namespace+".edit", dto);		
	}

	@Override
	public void delete(int d_num) {
		sql.delete(namespace+".delete", d_num);	
	}

	@Override
	public void aclinsert(DocDTO dto) {
		sql.insert(namespace + ".create", dto);	
		
	}

	@Override
	public void aclupdate(int d_num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void acldelete(int d_num) {
		// TODO Auto-generated method stub
		
	}
}
