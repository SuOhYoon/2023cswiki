package com.spring.cswiki.service;

import java.util.List;

import com.spring.cswiki.dto.DocDTO;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.spring.cswiki.dao.DocDAO;

@Service
public class DocServiceImpl implements DocService {

	@Inject
	private DocDAO dao;
	
	public List<DocDTO> list() {
		// TODO Auto-generated method stub
		return dao.list();
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
	public void aclinsert(DocDTO dto) {
		dao.aclinsert(dto);
		
	}

	@Override
	public void aclupdate(DocDTO dto) {
		dao.aclupdate(dto);
		
	}
}
