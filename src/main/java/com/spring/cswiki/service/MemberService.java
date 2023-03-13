package com.spring.cswiki.service;

import javax.servlet.http.HttpSession;
import com.spring.cswiki.dto.MemberDTO;

public interface MemberService {
	public String login(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);
	public void join(MemberDTO dto);
}
