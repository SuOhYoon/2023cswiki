package com.spring.cswiki.dao;

import java.util.List;
import com.spring.cswiki.dto.BoardVO;

public interface boardDAO {
	public List<BoardVO> list();// ��ȸ

	public void create(BoardVO vo); // ����

	public BoardVO detail(int bl_num); // �󼼺���

	public void update(BoardVO vo); // �����ϱ�
	
	public void delete(int bl_num); // �����ϱ�

}
