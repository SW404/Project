package com.example.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.CartDAO;
import com.example.domain.BuyVO;
import com.example.domain.CartVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ShopVO;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	CartDAO dao;
	
	@Resource(name="uploadPath")
	String path;
	
	//īƮ����
		@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
		public String deleteCart(CartVO vo) {
			dao.deleteCart(vo.getUid());
			return "redirect:/cart/list";
		}
	
	// ��ٱ��ϻ���
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(ShopVO vo, Criteria cri) {
		dao.delete(vo.getId());
		return "redirect:/cart/list";
	}
	
	@RequestMapping("/list.json")
	@ResponseBody
	public Map<String,Object> listJSON(Criteria cri,String uid, Model model){
		Map<String,Object> map=new HashMap<>();
		
		cri.setPerPageNum(4);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.total());
		
		map.put("pm", pm);
		map.put("list", dao.list(cri,uid));
		
		return map;
	}
	
	// �Խñ� �б�ȭ��
		@RequestMapping("/read")
		public String read(int id, Model model) {
			model.addAttribute("vo", dao.read(id));
			model.addAttribute("pageName", "cart/read.jsp");
			return "/home";
		}
	
	// ��ǰ ��� ������
	@RequestMapping("/list")
	public String list(Criteria cri, Model model, String uid) {
		CartVO vo= dao.readuser(uid);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pageName", "cart/list.jsp");
		return "/home";
	}
	
	// ��ǰ ��� ������
	@RequestMapping("/buy")
	public String buy(Criteria cri, Model model, String uid) {
		CartVO vo= dao.readuser(uid);
		vo.setSum(dao.sum(uid));
		
		model.addAttribute("vo", vo);
		model.addAttribute("pageName", "cart/buy.jsp");
		return "/home";
	}
	
}
