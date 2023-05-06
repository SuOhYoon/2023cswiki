package com.spring.cswiki.dao;

import java.util.List;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.SmallCategoryVO;

public interface DocDAO {
//	public List<BigCategoryVO> list(); // 문서 대분류 조회
	public List<BigCategoryVO> list(); // 문서 전체 조회
	public List<SmallCategoryVO> s_category(int b_ca_num); // 문서 소분류 조회
	public List<DocDTO> doc_list(int s_ca_num); // 분류별 문서 조회
	public void create(DocDTO dto); //새 문서 작성
	public DocDTO doc(int d_num); // 문서 본문 보기
	public void edit(DocDTO dto); // 문서 편집
	public void delete(int d_num); // 문서 삭제
	public void acl(DocDTO dto); // acl 수정
	public void aclwipe(DocDTO dto); // acl 삭제
	public List<DocDTO> search(String d_title, int d_num); // 문서 검색
}
