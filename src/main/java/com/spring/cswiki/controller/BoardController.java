package com.spring.cswiki.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.spring.cswiki.dto.BoardVO;
import com.spring.cswiki.service.MemberService;
import com.spring.cswiki.service.boardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private boardService service;
	private MemberService mservice;
	
	// 게시판 메인페이지로 이동 및 각 게시판 정보 출력
	@RequestMapping(value = "/b", method = RequestMethod.GET)
	public String getBoard(Model model) throws Exception{
		List<BoardVO> board =  service.board();
		model.addAttribute("board", board);
		return "board/b";
	}
	
	// 게시글 목록 출력
	@RequestMapping(value = "/list", method = RequestMethod.GET) // url mapping
	public String getList(Model model) throws Exception {
		List<BoardVO> list = service.list();
		model.addAttribute("list", list);
		return "board/list";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getcreate() throws Exception {
		return "board/create";
	}

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postcreate(BoardVO vo, HttpSession session) throws Exception {
		vo.setU_id((String) session.getAttribute("u_id"));
		service.create(vo);
		return "redirect:list";
	}

	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getdetail(Model model, int bl_num) {
		BoardVO data = service.detail(bl_num);
		model.addAttribute("data", data);
		return "board/detail";
	}

	// 게시물 수정 페이지로 이동
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String getupdate(int bl_num, Model model) throws Exception {
		BoardVO data = service.detail(bl_num);
		model.addAttribute("data", data);
		return "board/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postupdate(BoardVO vo) throws Exception {
		service.update(vo);
		return "redirect:list"; // 由ъ뒪�듃濡� 由щ떎�씠�젆�듃
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postdelete(int bl_num) throws Exception {
		service.delete(bl_num);
		return "redirect:list";
	}

}