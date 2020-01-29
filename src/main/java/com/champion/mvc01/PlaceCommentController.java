package com.champion.mvc01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PlaceCommentController {

	@Autowired
	 PlaceCommentDAO p_dao;
	
	@RequestMapping("placeinsert")
	public void pinsert(PlaceCommentDTO p_dto) {
		p_dao.insert(p_dto);
	}
	
	
	@RequestMapping("placelist")
	public void pselect(PlaceCommentDTO p_dto,Model model) throws Exception {
		List<PlaceCommentDTO> P_list = p_dao.selectAll(p_dto);
		model.addAttribute("P_list", P_list);
	}
	
	@RequestMapping("placedelete")
	public void pname(PlaceCommentDTO p_dto) {
		p_dao.delete(p_dto);
	}
	
	
}




