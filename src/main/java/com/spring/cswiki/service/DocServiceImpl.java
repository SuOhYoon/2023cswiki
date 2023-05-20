package com.spring.cswiki.service;

import java.util.List;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.SmallCategoryVO;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.cswiki.dao.DocDAO;

@Service
public class DocServiceImpl implements DocService {

	@Inject
	private DocDAO dao;
	@Override
	public List<BigCategoryVO> list() {
		// TODO Auto-generated method stub
		return dao.list();
	}
	
	@Override
	public List<SmallCategoryVO> s_category(int b_ca_num) {
		// TODO Auto-generated method stub
		return dao.s_category(b_ca_num);
	}

	@Override
	public List<DocDTO> doc_list(int s_ca_num) {
		// TODO Auto-generated method stub
		return dao.doc_list(s_ca_num);
	}
	
	@Override
	public void create(DocDTO dto) {
		dao.create(dto);		
	}

	@Override
	public DocDTO doc(int d_num) {
		// TODO Auto-generated method stub
		return dao.doc(d_num);
	}

	@Override
	public void edit(DocDTO dto) {
		dao.edit(dto);		
	}

	@Override
	public void delete(int d_num) {
		dao.delete(d_num);		
	}

	@Override
	public void acl(DocDTO dto) {
		dao.acl(dto);	
	}
	
	@Override
	public void aclwipe(DocDTO dto) {
		dao.aclwipe(dto);
		
	}
	
	@Override
	public DocDTO search(String d_title) {
		return dao.search(d_title);
	}

	@Override
	public List<BigCategoryVO> getBigCategories() {
		return dao.getBigCategories();
	}

	@Override
	public List<SmallCategoryVO> getSmallCategoriesByBigCategoryNum(int bigCategoryNum) {
		return dao.getSmallCategoriesByBigCategoryNum(bigCategoryNum);
	}
}
