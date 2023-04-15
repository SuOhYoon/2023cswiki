package com.spring.cswiki.service;

import java.util.List;

import javax.servlet.http.HttpSession;
import com.spring.cswiki.dto.MemberDTO;

public interface MemberService {
	public MemberDTO login(MemberDTO dto) throws Exception;
	public void join(MemberDTO dto) throws Exception;
	public List<MemberDTO> list();
	public void grant(MemberDTO dto) throws Exception;
}
