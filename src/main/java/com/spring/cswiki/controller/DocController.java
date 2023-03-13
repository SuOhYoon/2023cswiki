package com.spring.cswiki.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dao.DocDAO;
import com.spring.cswiki.service.DocService;

@Controller
@RequestMapping("/doc/*")

public class DocController {
	@Inject
	private DocService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET) //url mapping
    public String getList(Model model) throws Exception{
		List<DocDTO> list = service.list();
		model.addAttribute("list", list);		
		return "doc/list";
    }
	
	// 문서 작성 페이지로 이동
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String getcreate() throws Exception {
       return "doc/create";
    }
    
    // 문서 작성
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String postcreate(DocDTO dto) throws Exception {
    	service.create(dto);
       return "redirect:list";
    }
    
    // 문서 본문으로 이동
    @RequestMapping(value = "/doc", method = RequestMethod.GET)
    public String getdoc(Model model, int d_num) throws Exception {
       DocDTO doc = service.doc(d_num);
       model.addAttribute("doc", doc);
       return "doc/doc";
    }
    
    // 문서 편집창으로 이동
    @RequestMapping(value= "/edit", method = RequestMethod.GET)
    public String getedit(int d_num, Model model) throws Exception{
    	DocDTO doc = service.doc(d_num);
    	model.addAttribute("doc", doc);
    	return "doc/edit";
    }
    
    // 문서 편집 저장 및 목록 이동
    @RequestMapping(value="/edit", method=RequestMethod.POST)
    public String postedit(DocDTO dto) throws Exception{
    	service.edit(dto);
    	return "redirect:list";
    }
    
    // 문서 삭제 및 목록 이동
    @RequestMapping(value="/delete", method=RequestMethod.GET)
    public String postdelete(int d_num) throws Exception{
    	service.delete(d_num);
    	return "redirect:list";
    }
}
