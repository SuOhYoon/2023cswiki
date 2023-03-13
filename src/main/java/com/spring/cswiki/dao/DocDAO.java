package com.spring.cswiki.dao;

import java.util.List;
import com.spring.cswiki.dto.DocDTO;

public interface DocDAO {
	public List<DocDTO> list(); //문서 목록 조회
	public void create(DocDTO dto); //새 문서 작성
	public DocDTO doc(int d_num); // 문서 본문 보기
	public void edit(DocDTO dto); // 문서 편집
	public void delete(int d_num); // 문서 삭제
}
