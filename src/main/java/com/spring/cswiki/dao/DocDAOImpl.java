package com.spring.cswiki.dao;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.DocHistoryDTO;
import com.spring.cswiki.dto.SmallCategoryVO;
import com.spring.cswiki.dto.StarVO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


@Repository
public class DocDAOImpl implements DocDAO {
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.spring.cswiki.mappers.doc";
	
	@Override
	public List<BigCategoryVO> list() {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".list");
	}
	
	@Override
	public List<SmallCategoryVO> s_category(int b_ca_num) {
		// TODO Auto-generated method stub
		return sql.selectList(namespace + ".s_category", b_ca_num);
	}
	
	@Override
	public List<DocDTO> doc_list(int s_ca_num) {
		return sql.selectList(namespace + ".doc_list", s_ca_num);
	}
	
	@Override
	public int create(DocDTO dto) {
		return sql.insert(namespace + ".create", dto);		
	}

	@Override
	public DocDTO doc(int d_num) {
		// TODO Auto-generated method stub
		return sql.selectOne(namespace + ".doc", d_num);
	}

	@Override
	public void createDocHistory(DocHistoryDTO dto) {
		sql.insert(namespace + ".createhistory", dto);
		
	}

	@Override
	public List<DocHistoryDTO> getDocHistory(int d_num) {
		// TODO Auto-generated method stub
		List<DocHistoryDTO> historyList = sql.selectList(namespace + ".getDocHistory", d_num);
		Collections.reverse(historyList);
		return historyList;
	}
	
	@Override
	public DocDTO version(int d_num, String d_version) {
		Map<String, Object> params = new HashMap<>();
		params.put("d_num", d_num);
		params.put("d_version", d_version);
		return sql.selectOne(namespace + ".version", params);
	}
	
	@Override
	public int edit(DocDTO dto) {
		return sql.update(namespace + ".edit", dto);		
	}

	@Override
	public void editHistory(DocHistoryDTO dto) {
		sql.insert(namespace + ".edithistory", dto);
	}
	
	@Override
	public void delete(int d_num) {
		sql.update(namespace + ".delete", d_num);	
	}
	
	@Override
	public void acl(DocDTO dto) {
		sql.update(namespace + ".acl", dto);
		
	}

	@Override
	public void aclwipe(DocDTO dto) {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public DocDTO search(String d_title) {
		return sql.selectOne(namespace + ".search", d_title);
	}

	@Override
	public void createbigcategory(BigCategoryVO vo) {
		sql.insert(namespace + ".createbigcategory", vo);	
	}

	@Override
	public void createsmallcategory(SmallCategoryVO vo) {
		sql.insert(namespace + ".createsmallcategory", vo);	
	}

	@Override
	public int starin(StarVO vo) {
		return sql.insert(namespace + ".starin", vo);
	}

	@Override
	public List<DocDTO> userstar(String u_id) {
		return sql.selectList(namespace + ".userstar", u_id);
	}

	@Override
	public int starout(StarVO vo) {
		return sql.delete(namespace + ".starout", vo);
	}
}
