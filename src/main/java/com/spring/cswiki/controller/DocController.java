package com.spring.cswiki.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.cswiki.dto.BigCategoryVO;
import com.spring.cswiki.dto.DocDTO;
import com.spring.cswiki.dto.DocHistoryDTO;
import com.spring.cswiki.dto.SmallCategoryVO;
import com.spring.cswiki.dto.StarVO;
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
import org.springframework.web.servlet.ModelAndView;

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
	// 1단계 분류 페이지로 이동 및 1단계 분류 보기
	@RequestMapping(value="/list", method=RequestMethod.GET) //url mapping
	public ModelAndView getBigCategoryList() {
	    ModelAndView modelAndView = new ModelAndView("doc/list");
	    List<BigCategoryVO> list = service.list();
	    modelAndView.addObject("list", list);
	    return modelAndView;
	  }
	
	// 1단계 분류 추가 화면 띄우기
	@RequestMapping(value="/createbigcategory", method=RequestMethod.GET)
	public ModelAndView getcreatebigcategory() throws Exception{
		ModelAndView modelAndView = new ModelAndView("doc/createbigcategory");
	    return modelAndView;
	}
	
	// 1단계 분류 추가 
	@RequestMapping(value="/createbigcategory", method=RequestMethod.POST)
	public String postcreatebigcategory(BigCategoryVO vo) throws Exception {
       service.createbigcategory(vo);
       return "redirect:list";
    }
	
	// 2단계 분류 페이지로 이동 및 2단계 분류 보기
	@RequestMapping(value = "/s_category", method = RequestMethod.GET)
    public String gets_category(Model model, @RequestParam("b_ca_num") int b_ca_num) throws Exception {
	   List<SmallCategoryVO> s_category = service.s_category(b_ca_num);
	   model.addAttribute("s_category", s_category);
	   model.addAttribute("b_ca_num", b_ca_num);
	   System.out.println("현재 분류 : " + b_ca_num);
       return "doc/s_category";
    }
	
	// 2단계 분류별 문서 보기
	@RequestMapping(value="/doc_list", method=RequestMethod.GET) //url mapping
    public String getdoc_list(Model model, @RequestParam("s_ca_num") int s_ca_num) throws Exception{
		List<DocDTO> doc_list = service.doc_list(s_ca_num);
		model.addAttribute("doc_list", doc_list);	
		model.addAttribute("b_ca_num", s_ca_num);
		return "doc/doc_list";
    }
	// 2단계 분류 추가 화면 띄우기
	@RequestMapping(value="/createsmallcategory", method=RequestMethod.GET)
		public String getcreatesmallcategory(Model model, @RequestParam("b_ca_num") int b_ca_num) throws Exception{	
		model.addAttribute("b_ca_num", b_ca_num);
		return "doc/createsmallcategory";
	}
	
	// 2단계 분류 추가 
	@RequestMapping(value="/createsmallcategory", method=RequestMethod.POST)
	public String postsmallbigcategory(SmallCategoryVO vo) throws Exception {
    service.createsmallcategory(vo);
       return "redirect:list";
    }
		
	// 문서 본문으로 이동
    @RequestMapping(value = "/doc", method = RequestMethod.GET)
    public String getdoc(Model model, @RequestParam(required = false) Integer d_num, @RequestParam(required = false) String d_title) throws Exception {
    	if (d_num != null) {
            DocDTO doc = service.doc(d_num);
            model.addAttribute("doc", doc);
        } else if (d_title != null) {
            DocDTO doc = service.search(d_title);
            model.addAttribute("doc", doc);
            model.addAttribute("d_title", d_title);
        }
       return "doc/doc";
    }

	// 문서 작성 페이지로 이동
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String getcreate() throws Exception {
       return "doc/create";
    }
    
    // 문서 작성
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public String postcreate(DocDTO dto) throws Exception {
       int result = service.create(dto);
       if(result > 0) {
    	   return "redirect:doc?d_num=" + dto.getD_num();
       } else {
    	   return "redirect:list";
       }
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
    	int result = service.edit(dto);
        if(result > 0) {
     	   return "redirect:doc?d_num=" + dto.getD_num();
        } else {
     	   return "redirect:list";
        }
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
    
    // 문서 ACL 수정 및 ACL화면 출력(관리자 전용)
    @RequestMapping(value="/acl", method=RequestMethod.POST)
    public String postacl(DocDTO dto, int d_num) throws Exception{
    	service.acl(dto);
    	return "redirect:acl?d_num=" + d_num;
    }
    
    // 문서 역사 보기
    @RequestMapping("/doc_history")
    public String getDocumentHistory(@RequestParam("d_num") int d_num, Model model) {
        List<DocHistoryDTO> historyList = service.getDocHistory(d_num);
        DocDTO doc = service.doc(d_num);
        model.addAttribute("historyList", historyList);
        model.addAttribute("doc", doc);
        return "doc/doc_history";
    }
    
    // 버전 별 문서 내용 보기
    @RequestMapping("/doc_version")
    public String version(@RequestParam("d_num") int d_num, @RequestParam("d_version") String d_version, Model model) {
		DocDTO version = service.version(d_num, d_version);
		model.addAttribute("version", version);
    	return "doc/doc_version";  	
    }
    
    // 즐겨찾기 등록
    @RequestMapping(value="/starcheck")
    public String starin(Model model, StarVO vo, int d_num, String u_id) {
    		DocDTO doc = service.doc(d_num);
        	model.addAttribute("doc", doc);
        	service.starin(vo);
        	return "redirect:doc?d_num=" + d_num;
    }
    
    // 즐겨찾기 삭제
    @RequestMapping(value="/starout")
    public String starout(Model model, StarVO vo, @RequestParam("d_num")int d_num, @RequestParam("u_id")String u_id) {
    	service.starout(vo);
    	model.addAttribute("u_id", u_id);
    	return "redirect:userstar?";
    }
    
    // 즐겨찾기 목록
    @RequestMapping(value="/userstar")
 	public String userstar(Model model, @RequestParam("u_id") String u_id) throws Exception{
		List<DocDTO> userstar = service.userstar(u_id);
		model.addAttribute("userstar", userstar);	
		model.addAttribute("u_id", u_id);
		return "doc/userstar";
    }
}
