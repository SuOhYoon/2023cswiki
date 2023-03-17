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
	public void join(MemberDTO dto) throws Exception {
		dao.join(dto);				
	}

	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return dao.login(dto);
	}
}
