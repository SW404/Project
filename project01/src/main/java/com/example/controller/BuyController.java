package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.dao.BuyDAO;
import com.example.domain.BuyVO;
import com.example.domain.CartVO;

@Controller
@RequestMapping("/buy")
public class BuyController {
	@Autowired
	BuyDAO dao;

	// �Խñ� �Է�
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	@ResponseBody
	public String insertPost(BuyVO vo){
		dao.insert(vo);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public void delete(String bno) {
		dao.delete(Integer.parseInt(bno));
	} 
}
