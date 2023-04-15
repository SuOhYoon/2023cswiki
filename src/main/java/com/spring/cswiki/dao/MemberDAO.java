package com.spring.cswiki.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.spring.cswiki.dto.MemberDTO;

public interface MemberDAO {
	public MemberDTO login(MemberDTO dto) throws Exception; // 로그인 처리
	public List<MemberDTO> list(); //회원 목록 조회
	public void join(MemberDTO dto) throws Exception; // 회원가입
	public void logout(HttpSession session) throws Exception; // 로그아웃
	public void grant(MemberDTO dto) throws Exception; // 권한 부여
}
