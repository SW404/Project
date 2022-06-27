package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.MyPetDAO;
import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.MyPetVO;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;

@Controller
@RequestMapping("/mypet")
public class MyPetController {
	@Resource(name = "uploadPath")
	String path;
	
	@Autowired
	MyPetDAO mpdao;
	
	//�Խñ� ������
	@RequestMapping("/read")
	public String read(int mpno, Model model) {
		model.addAttribute("pageName", "mypet/read.jsp");
		model.addAttribute("vo", mpdao.read(mpno));
		return "/home";
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(MyPetVO vo, MultipartHttpServletRequest multi) throws Exception, IOException{
		MultipartFile file=multi.getFile("file");
		//���Ͼ��ε�
		String mpimage="mypet/" + System.currentTimeMillis() + "_" + file.getOriginalFilename();
		file.transferTo(new File(path + mpimage));
		vo.setMpimage(mpimage);
		
		//������ ����
		mpdao.insert(vo);
		return "redirect:/mypet/list";
	}
	
	@RequestMapping("/insert")
	public String insert(Model model){
		model.addAttribute("pageName", "mypet/insert.jsp");
		return "/home";
	}
	
	@RequestMapping("/update")
	public String update(Model model, int mpno){
		model.addAttribute("vo", mpdao.read(mpno));
		model.addAttribute("pageName", "mypet/update.jsp");
		return "/home";
	}
	
	//��� ������
	@RequestMapping("/list")
	public String list(Model model){
		model.addAttribute("pageName", "mypet/list.jsp");
		return "/home";
	}
	
	//JSON������ ����
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> list(Criteria cri){
		HashMap<String, Object> map=new HashMap<>();
		cri.setPerPageNum(6);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mpdao.count(cri));
		
		map.put("pm", pm);
		map.put("list", mpdao.list(cri));		
		return map;
	}
	
	// �Խñۻ���
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String delete(MyPetVO vo, Criteria cri, RedirectAttributes rttr) {
		rttr.addAttribute("page", cri.getPage());
		 mpdao.delete(vo.getMpno());
		return "redirect:/mypet/list";
	}
	
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public void like(MyPetVO vo) throws Exception {
		mpdao.like(vo);
		System.out.println(vo.getMpcount());
	}

}
