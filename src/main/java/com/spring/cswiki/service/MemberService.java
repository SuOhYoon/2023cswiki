package com.spring.cswiki.service;

import javax.servlet.http.HttpSession;
import com.spring.cswiki.dto.MemberDTO;

public interface MemberService {
	public MemberDTO login(MemberDTO dto) throws Exception;
	public void join(MemberDTO dto) throws Exception;
}
