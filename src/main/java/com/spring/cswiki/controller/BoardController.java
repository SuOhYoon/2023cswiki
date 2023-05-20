package com.spring.cswiki.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.cswiki.dto.BoardVO;
import com.spring.cswiki.dto.CommentVO;
import com.spring.cswiki.service.MemberService;
import com.spring.cswiki.service.boardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private boardService service;
	private MemberService mservice;

	// 게시글 목록 출력
	@RequestMapping(value = "/list", method = RequestMethod.GET) // url mapping
	public String getList(Model model) throws Exception {
		List<BoardVO> list = service.list();
		model.addAttribute("list", list);
		return "board/list";
	}
	
	// 게시글 작성 페이지 이동
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getcreate() throws Exception {
		return "board/create";
	}

	// 게시글 작성
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postcreate(BoardVO vo, HttpSession session) throws Exception {
		vo.setU_id((String) session.getAttribute("u_id"));
		service.create(vo);
		return "redirect:list";
	}
	
	// 게시글 정보
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getdetail(Model model, int bl_num) throws Exception {
		BoardVO data = service.detail(bl_num);
		List<CommentVO> comment = service.comment(bl_num);
		model.addAttribute("data", data);
		model.addAttribute("comment", comment);
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
		return "redirect:list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postdelete(int bl_num) throws Exception {
		service.delete(bl_num);
		return "redirect:list";
	}
	
	// 댓글 작성
	@RequestMapping(value="/commentw", method = RequestMethod.POST)
	public String commentw(CommentVO vo, RedirectAttributes rttr) throws Exception{
		service.commentw(vo);
		rttr.addAttribute("bl_num", vo.getBl_num());
		return "redirect:/board/detail";	
	}
	
	// 댓글 수정창 이동
	@RequestMapping(value="/commentu", method = RequestMethod.GET)
	public String commentuView(CommentVO vo, RedirectAttributes rttr) throws Exception{
		service.commentu(vo);
		rttr.addAttribute("bl_num", vo.getBl_num());
		return "redirect:/board/detail";	
	}
	
	// 댓글 수정
	@RequestMapping(value="/commentu", method = RequestMethod.POST)
	public String commentu(CommentVO vo, RedirectAttributes rttr) throws Exception{
		service.commentu(vo);
		rttr.addAttribute("bl_num", vo.getBl_num());
		return "redirect:/board/detail";	
	}
}