package com.spring.cswiki.service;

import java.util.List;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.SmallCategoryVO;

public interface DocService {
	public List<DocDTO> list();
//	public List<BigCategoryVO> list();
	public List<SmallCategoryVO> s_category(int b_ca_num);
	public List<DocDTO> doc_list();
	public void create(DocDTO dto);
	public DocDTO doc(int d_num);
	public void edit(DocDTO dto);
	public void delete(int d_num);
	public void acl(DocDTO dto);
	public void aclwipe(DocDTO dto);
	public List<DocDTO> search(String d_title, int d_num);
}
