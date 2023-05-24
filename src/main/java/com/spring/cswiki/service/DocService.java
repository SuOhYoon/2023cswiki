package com.spring.cswiki.service;

import java.util.List;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.DocHistoryDTO;
import com.spring.cswiki.dto.SmallCategoryVO;

public interface DocService {
	public List<BigCategoryVO> list(); // 1단계 분류 조회
	public List<SmallCategoryVO> s_category(int b_ca_num); // 2단계 분류 조회
	public List<DocDTO> doc_list(int s_ca_num); // 분류별 문서 조회
	public void createbigcategory(BigCategoryVO vo);
	public void createsmallcategory(SmallCategoryVO vo);
	public int create(DocDTO dto); //새 문서 작성
	public List<DocHistoryDTO> getDocHistory(int d_num); // 문서 역사 보기
	public DocDTO version(int d_num, String d_version); // 문서 버전별 내용 확인
	public DocDTO doc(int d_num); // 문서 본문 보기
	public int edit(DocDTO dto); // 문서 편집
	public void delete(int d_num); // 문서 삭제
	public void acl(DocDTO dto); // acl 수정
	public void aclwipe(DocDTO dto); // acl 삭제
	public DocDTO search(String d_title); // 문서 검색
}
