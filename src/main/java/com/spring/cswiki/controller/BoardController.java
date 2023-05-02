package com.spring.cswiki.controller;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.spring.cswiki.dto.BoardVO;
import com.spring.cswiki.service.boardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	@Inject
	private boardService service;

	@RequestMapping(value = "/list", method = RequestMethod.GET) // url mapping
	public String getList(Model model) throws Exception {
		List<BoardVO> list = service.list();
		model.addAttribute("list", list);
		// board/list.jsp濡� �룷�썙�뵫
		return "board/list";
	}

	// 寃뚯떆臾� �옉�꽦 �럹�씠吏�濡� �씠�룞
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getcreate() throws Exception {
		return "board/create";
	}

	// 寃뚯떆臾� �옉�꽦 post
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postcreate(BoardVO vo) throws Exception {
		service.create(vo);
		return "redirect:list";
	}

	// 게시물 상세 페이지로 이동
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getdetail(Model model, int bl_num) {
		BoardVO data = service.detail(bl_num);// bl_num값 넘김
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

	// 게시글 수정 post
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postupdate(BoardVO vo) throws Exception {
		service.update(vo);
		return "redirect:list"; // 리스트로 리다이렉트
	}

	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postdelete(int bl_num) throws Exception {
		service.delete(bl_num);
		return "redirect:list";
	}

}