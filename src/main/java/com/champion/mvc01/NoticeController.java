package com.champion.mvc01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class NoticeController {

	@Autowired
	FileUploadService fileUploadService;

	@Autowired
	NoticeDAO Ndao;

	@Autowired
	CommentDAO Cdao;

	@Autowired
	PlaceDAO Pdao;

	@RequestMapping("noticeall")
	public void noticeall(Model model) {
		List<NoticeDTO> Nlist = Ndao.selectAll();
		model.addAttribute("Nlist", Nlist);
	}

	@RequestMapping("selectone")
	public void selectone(Model model, NoticeDTO dto) throws Exception {
		NoticeDTO dto2 = Ndao.select(dto);
		model.addAttribute("dto", dto2);
	}

	@RequestMapping("Ninsert")
	 public String Ninsert(Model model, NoticeDTO dto) {
		
	 System.out.println(dto);
	 Ndao.insert(dto);
	 List<NoticeDTO> list = Ndao.selectAll();
	 model.addAttribute("Nlist", list);
	 return "noticeall";
	 }

	@RequestMapping("Ndelete")
	public void del(NoticeDTO dto) {
		Ndao.delete(dto);
	}

	@RequestMapping("Nupdate")
	public void update(NoticeDTO dto, Model model) {
		NoticeDTO dto2 = Ndao.select(dto);
		model.addAttribute("dto", dto2);
	}

	@RequestMapping("Newupdate")
	public String Newupdate(Model model, NoticeDTO dto) {
		// 이미지 경로 저장

		Ndao.update(dto);
		List<NoticeDTO> list = Ndao.selectAll();
		model.addAttribute("Nlist", list);
		return "noticeall";

	}

	@RequestMapping("Pinsert")
	public void Pinsert(Model model) {
		List<PlaceDTO> Plist = Pdao.pnameList();
		model.addAttribute("Plist", Plist);
	}
	
	@RequestMapping("Pimage")	
	public void Pimages(Model model,PlaceDTO p_dto) {
		PlaceDTO dto = Pdao.place_images(p_dto);
		model.addAttribute("dto",dto);
	}
}
