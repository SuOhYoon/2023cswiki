package com.spring.cswiki.service;

import java.sql.Time;
import java.util.Date;
import java.util.List;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.DocHistoryDTO;
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
	public int create(DocDTO dto) {
		int result = dao.create(dto);
		if(result > 0) {
			DocHistoryDTO dh = new DocHistoryDTO();
			dh.setD_num(dto.getD_num());
			dh.setD_version(1);
			dh.setD_summary("새 문서");
			dh.setD_content(dto.getD_content());
			dao.createDocHistory(dh);
		}
		return result;
	}

	@Override
	public DocDTO doc(int d_num) {
		// TODO Auto-generated method stub
		return dao.doc(d_num);
	}

	@Override
	public int edit(DocDTO dto) {
	    int result = dao.edit(dto);
	    if(result > 0) {
	        DocHistoryDTO dh = new DocHistoryDTO();
	        dh.setD_num(dto.getD_num()); // d_num 값을 설정해줘야 함
	        dh.setD_summary(dto.getD_summary());
	        dh.setD_content(dto.getD_content());
	        dao.editHistory(dh);
	    }
	    return result;
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
	public void createbigcategory(BigCategoryVO vo) {
		dao.createbigcategory(vo);		
	}

	@Override
	public void createsmallcategory(SmallCategoryVO vo) {
		dao.createsmallcategory(vo);
	}

	@Override
	public List<DocHistoryDTO> getDocHistory(int d_num) {
		// TODO Auto-generated method stub
		return dao.getDocHistory(d_num);
	}

	@Override
	public DocDTO version(int d_num, String d_version) {
		return dao.version(d_num, d_version);
	}
}
