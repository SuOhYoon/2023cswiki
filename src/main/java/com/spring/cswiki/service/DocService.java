package com.spring.cswiki.service;

import java.util.List;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.SmallCategoryVO;

public interface DocService {
	public List<BigCategoryVO> list();
	public List<SmallCategoryVO> s_category(int b_ca_num);
	public List<DocDTO> doc_list(int s_ca_num);
	public void create(DocDTO dto);
	public DocDTO doc(int d_num);
	public void edit(DocDTO dto);
	public void delete(int d_num);
	public void acl(DocDTO dto);
	public void aclwipe(DocDTO dto);
	public DocDTO search(String d_title);
	public List<BigCategoryVO> getBigCategories();
	public List<SmallCategoryVO> getSmallCategoriesByBigCategoryNum(int bigCategoryNum);
}
