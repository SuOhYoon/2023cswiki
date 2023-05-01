package com.spring.cswiki.dao;

import java.util.HashMap;
import java.util.List;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.SmallCategoryVO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class DocDAOImpl implements DocDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.spring.cswiki.mappers.doc";
	
//	@Override
//	public List<BigCategoryVO> list() {
//		// TODO Auto-generated method stub
//		return sql.selectList(namespace + ".list");
//	}
	
	@Override
	public List<DocDTO> list() {
		return sql.selectList(namespace + ".list");
	}

	@Override
	public List<SmallCategoryVO> s_category(int b_ca_num) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".s_category");
	}
	
	@Override
	public List<DocDTO> doc_list() {
		return sql.selectList(namespace + ".doc_list");
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
	public void acl(DocDTO dto) {
		sql.update(namespace+".acl", dto);
		
	}

	@Override
	public void aclwipe(DocDTO dto) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public List<DocDTO> search(String d_title, int d_num) {
		HashMap<String, Object> data = new HashMap<String, Object>();
		  
		  data.put("d_num", d_num);
		  data.put("d_title", d_title);
		  return sql.selectList(namespace + ".search", data);
	}
}
