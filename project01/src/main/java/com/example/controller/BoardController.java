package com.example.controller;

import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dao.BoardDAO;
import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.UserVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Resource(name="uploadPath")
	String path;
	@Autowired
	BoardDAO dao;

	// �Խñ� ������ ������
	@RequestMapping("/read")
	public String read(int bno, Model model) {
		dao.point(bno);
		model.addAttribute("pageName", "board/read.jsp");
		model.addAttribute("vo", dao.read(bno));
		return "/home";
	}

	// �Խñ� ��� ������
	@RequestMapping("/list")
	public String list(Model model) {

		model.addAttribute("pageName", "board/list.jsp");
		return "/home";
	}

	// �Խñ۸�� JSON �����ͻ���
	@RequestMapping("/list.json")
	@ResponseBody
	public HashMap<String, Object> listJSON(Criteria cri) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(10);

		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(5);
		pm.setTotalCount(dao.count(cri));

		map.put("pm", pm);// ����������
		map.put("list", dao.list(cri)); // ��� ������

		return map;
	}

	// �Խñ� �Է�ȭ��
	@RequestMapping("/insert")
	public String insert(Model model) {
		model.addAttribute("pageName", "board/insert.jsp");
		return "/home";
	}

	// �Խñ� �Է�
	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insertPost(BoardVO vo) {
		dao.insert(vo);
		return "redirect:/board/list";
	}

	// �Խñۼ���
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updatePost(BoardVO vo) {
		System.out.println(vo.toString());
		dao.update(vo);
		return "redirect:/board/list";
	}

	// �Խñۼ��� �̵�
	@RequestMapping("/update")
	public String update(Model model, int bno) {
		model.addAttribute("vo", dao.read(bno));
		model.addAttribute("pageName", "board/update.jsp");
		return "/home";
	}
	// �Խñۻ���
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String delete(BoardVO vo, Criteria cri, RedirectAttributes rttr) {
			rttr.addAttribute("page", cri.getPage());
			dao.delete(vo.getBno());
			return "redirect:/board/list";
		}
}