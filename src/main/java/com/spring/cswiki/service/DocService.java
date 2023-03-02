package com.spring.cswiki.service;

import java.util.List;

import com.spring.cswiki.dto.DocDTO;

public interface DocService {
	public List<DocDTO> list();
	public void create(DocDTO dto);
}
