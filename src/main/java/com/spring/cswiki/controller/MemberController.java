package com.spring.cswiki.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.cswiki.dto.MemberDTO;
import com.spring.cswiki.dao.MemberDAO;
import com.spring.cswiki.service.MemberService;

@Controller
@RequestMapping("/member/*")

public class MemberController {
	@Inject
	private MemberService service;
	   
    // 회원가입 페이지로 이동
    @RequestMapping(value = "/join", method = RequestMethod.GET)
    public String getjoin() throws Exception {
       return "member/join";
    }
    
    // 회원 가입 처리 후 메인페이지로 이동
    @RequestMapping(value = "/join", method = RequestMethod.POST)
    public String postjoin(MemberDTO dto) throws Exception {
    	service.join(dto);
       return "redirect:/";
    }
    
    // 로그인 페이지로 이동
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getlogin() throws Exception {
       return "member/login";
    }
    
    // 로그인 처리, 값이 일치하면 로그인 수행 후 메인 페이지로 이동, 일치하지 않으면 다시 로그인 페이지로 이동
    @RequestMapping(value="/login", method = RequestMethod.GET)
    public String postlogin(MemberDTO dto, HttpSession session) throws Exception{
    	String name = service.login(dto, session);
    	if (name!= null) {
    		return "redirect/";
    	} else {
    		return "member/login";
    	}
    }
}
