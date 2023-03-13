package com.spring.cswiki.service;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;

import com.spring.cswiki.dao.MemberDAO;
import com.spring.cswiki.dto.MemberDTO;

@Service 
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;
	@Override
	public String login(MemberDTO dto, HttpSession session) {
		String name = dao.loginCheck(dto);
		 if (name != null) { // 세션 변수 저장
		  session.setAttribute("u_id", dto.getU_id());
		  session.setAttribute("name", name);
		}
		 return name; 
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate(); // 세션 초기화
	}

	@Override
	public void join(MemberDTO dto) {
		dao.join(dto);				
	}
}
