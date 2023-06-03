package com.spring.cswiki.service;
import java.util.List;

import javax.inject.Inject;
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
	public MemberDTO login(String u_id){
		return dao.login(u_id);
	}

	@Override
	public List<MemberDTO> list() {
		return dao.list();
	}

	@Override
	public void grant(MemberDTO dto) throws Exception {
		dao.grant(dto);
	}
}
