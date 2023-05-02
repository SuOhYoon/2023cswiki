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
		// board/list.jsp嚥∽옙 占쎈７占쎌뜖占쎈뎃
		return "board/list";
	}

	// 野껊슣�뻻�눧占� 占쎌삂占쎄쉐 占쎈읂占쎌뵠筌욑옙嚥∽옙 占쎌뵠占쎈짗
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String getcreate() throws Exception {
		return "board/create";
	}

	// 野껊슣�뻻�눧占� 占쎌삂占쎄쉐 post
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String postcreate(BoardVO vo) throws Exception {
		service.create(vo);
		return "redirect:list";
	}

	// 寃뚯떆臾� �긽�꽭 �럹�씠吏�濡� �씠�룞
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String getdetail(Model model, int bl_num) {
		BoardVO data = service.detail(bl_num);// bl_num媛� �꽆源�
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

	// 寃뚯떆湲� �닔�젙 post
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String postupdate(BoardVO vo) throws Exception {
		service.update(vo);
		return "redirect:list"; // 由ъ뒪�듃濡� 由щ떎�씠�젆�듃
	}

	// 寃뚯떆臾� �궘�젣
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String postdelete(int bl_num) throws Exception {
		service.delete(bl_num);
		return "redirect:list";
	}

}