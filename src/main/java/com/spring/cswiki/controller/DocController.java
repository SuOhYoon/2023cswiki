package com.spring.cswiki.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.SmallCategoryVO;
import com.spring.cswiki.dao.DocDAO;
import com.spring.cswiki.service.DocService;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.JsonObject;


@Controller
@RequestMapping("/doc/*")

public class DocController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Inject
	private DocService service;
	    // 파일 업로드
		@RequestMapping(value="/ckUpload", method=RequestMethod.POST)
		@ResponseBody
		public String fileUpload(HttpServletRequest req, HttpServletResponse resp, MultipartHttpServletRequest multiFile) throws Exception {
	    JsonObject json = new JsonObject();
	    PrintWriter printWriter = null;
	    OutputStream out = null;
	    MultipartFile file = multiFile.getFile("upload");
	    if (file != null) {
	        if (file.getSize() > 0 && StringUtils.isNotBlank(file.getName())) {
	            if (file.getContentType().toLowerCase().startsWith("image/")) {
	                try {
	                    String fileName = file.getName();
	                    byte[] bytes = file.getBytes();
	                    String uploadPath = req.getServletContext().getRealPath("/resources/ckimage/");
	                    File uploadFile = new File(uploadPath);
	                    if (!uploadFile.exists()) {
	                        uploadFile.mkdirs();
	                    }
	                    fileName = UUID.randomUUID().toString();
	                    uploadPath = uploadPath + "/" + fileName;
	                    out = new FileOutputStream(new File(uploadPath));
	                    out.write(bytes);
	                    
	                    printWriter = resp.getWriter();
	                    resp.setContentType("text/html");
	                    String fileUrl = req.getContextPath() + "/resources/ckimage/" + fileName;
	                    
	                    // json 데이터로 등록
	                    // {"uploaded" : 1, "fileName" : "test.jpg", "url" : "/img/test.jpg"}
	                    // 이런 형태로 리턴이 나가야함.
	                    json.addProperty("uploaded", 1);
	                    json.addProperty("fileName", fileName);
	                    json.addProperty("url", fileUrl);
	                    
	                    printWriter.println(json);
	                } catch (IOException e) {
	                    e.printStackTrace();
	                } finally {
	                    if (out != null) {
	                        out.close();
	                    }
	                    if (printWriter != null) {
	                        printWriter.close();
	                    }       
	                }
	            }
	        }
	    }
	    return null;
	}
	// 분류 페이지로 이동 및 대분류 보기
//	@RequestMapping(value="/list", method=RequestMethod.GET) //url mapping
//    public String getList(Model model) throws Exception{
//		List<BigCategoryVO> list = service.list();
//		model.addAttribute("list", list);		
//		return "doc/list";
//    }
	
	// 전체 문서 보기
	@RequestMapping(value="/list", method=RequestMethod.GET) //url mapping
    public String getList(Model model) throws Exception{
		List<DocDTO> list = service.list();
		model.addAttribute("list", list);		
		return "doc/list";
    }
	// 소분류 페이지로 이동 및 소분류 보기
	@RequestMapping(value="/s_category/{b_ca_num}", method=RequestMethod.GET) //url mapping
    public String gets_category(@PathVariable int b_ca_num, Model model) throws Exception{
		List<SmallCategoryVO> s_category = service.s_category(b_ca_num);
		model.addAttribute("s_category", s_category);		
		return "doc/s_category";
    }
	
	// 
	@RequestMapping(value="/doc_list", method=RequestMethod.GET) //url mapping
    public String getdoc_list(Model model) throws Exception{
		List<DocDTO> doc_list = service.doc_list();
		model.addAttribute("doc_list", doc_list);		
		return "doc/doc_list";
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
    public String getdoc(Model model, Integer d_num) throws Exception {
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
    
    // 문서 ACL 조정 페이지 이동(관리자 전용)
    @RequestMapping(value="/acl", method=RequestMethod.GET)
    public String getacl(Model model, int d_num) throws Exception{
    	DocDTO doc = service.doc(d_num);
    	model.addAttribute("doc", doc);
    	return "doc/acl";
    }
    
    // 문서 ACL 수정 및 ACL화면 출력
    @RequestMapping(value="/acl", method=RequestMethod.POST)
    public String postacl(DocDTO dto) throws Exception{
    	service.acl(dto);
    	return "doc/acl";
    }
    
    // 문서 검색
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public void getsearch(Model model, @RequestParam("d_num") int d_num, @RequestParam(value = "title",required = false, defaultValue = "") String title
      ) throws Exception {
     
     List<DocDTO> search = null; 
     //list = service.listPage(page.getDisplayPost(), page.getPostNum());
     search = service.search(title, d_num);
     
     model.addAttribute("search", search);
     
    }
}
