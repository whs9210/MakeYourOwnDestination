package com.champion.mvc01;


import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PlaceCommentDAO {

	@Autowired
	SqlSessionTemplate myBatis;
	
	public void insert(PlaceCommentDTO p_dto) {
		myBatis.insert("placecomment.insert",p_dto);
	}
	
	public void delete(PlaceCommentDTO p_dto) {
		myBatis.delete("placecomment.delete",p_dto);
	}
	
	
	public List<PlaceCommentDTO> selectAll(PlaceCommentDTO p_dto) {
		List<PlaceCommentDTO> p_list = myBatis.selectList("placecomment.selectAll",p_dto);
		return p_list;
	}
}
