package com.spring.cswiki.service;

import java.util.List;

import com.spring.cswiki.dto.MemberDTO;

public interface MemberService {
	public MemberDTO login(String u_id);
	public void join(MemberDTO dto) throws Exception;
	public List<MemberDTO> list();
	public void grant(MemberDTO dto) throws Exception;
}
