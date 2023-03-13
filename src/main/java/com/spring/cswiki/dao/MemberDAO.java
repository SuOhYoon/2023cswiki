package com.spring.cswiki.dao;

import java.util.List;

import com.spring.cswiki.dto.MemberDTO;

public interface MemberDAO {
	public String loginCheck(MemberDTO dto);
	public List<MemberDTO> list(); //회원 목록 조회
	public void join(MemberDTO dto); //새 문서 작성
}
