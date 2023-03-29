package com.spring.cswiki.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cswiki.dto.MemberDTO;
import com.spring.cswiki.service.MemberService;

@Controller
@RequestMapping("/member/*")

public class MemberController {
	private final Logger LOG = LoggerFactory.getLogger(MemberController.class.getName());
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
    @RequestMapping(value="/loginProcess", method = RequestMethod.POST)
    public String login(MemberDTO dto, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
    	LOG.info("post login");
		
        HttpSession session = req.getSession();
        MemberDTO login = service.login(dto);
    		
        if(login == null) {
            session.setAttribute("member", null);
            session.setAttribute("p_id", null);
            rttr.addFlashAttribute("msg", false);
            LOG.info("로그인 실패......");
            return "member/login";
        } else {
            LOG.info("로그인 성공!");
            session.setAttribute("member", login);
            session.setAttribute("p_id", login);
        }
        return "redirect:/";
    }
    
    // 로그아웃 처리
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception{
		session.invalidate();
		LOG.info("로그아웃 성공!");
		return "redirect:/";
	}
}