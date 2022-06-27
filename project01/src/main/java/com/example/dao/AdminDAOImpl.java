package com.example.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.domain.BuyVO;
import com.example.domain.Criteria;
import com.example.domain.ShopVO;
import com.example.domain.UserVO;

@Repository
public class AdminDAOImpl implements AdminDAO{
	@Autowired
	SqlSession session;
	String namespace="com.example.mapper.AdminMapper";

	@Override
	public List<ShopVO> list(Criteria cri) {
		return session.selectList(namespace + ".list",cri);
	}

	@Override
	public void admininsert(ShopVO vo) {
		session.insert(namespace + ".admininsert", vo);
		
	}

	@Override
	public void adminupdate(ShopVO vo) {
		session.update(namespace + ".adminupdate", vo);
		
	}

	@Override
	public List<BuyVO> alltrade(Criteria cri) {
		return session.selectList(namespace + ".alltrade", cri);
	}
	
	@Override
	public List<UserVO> userlist(Criteria cri) {
		return session.selectList(namespace + ".userlist", cri);
	}
	
	@Override
	public ShopVO read(int id) {
		return session.selectOne(namespace + ".read",id);
	}
	
	@Override
	public int total() {
		return session.selectOne(namespace + ".total");
	}

	@Override
	public void delete(int id) {
		session.delete(namespace + ".delete", id);
	}
	
	@Override
	   public void statusUpdate(String uid, int status) {
	      Map<String,Object> map = new HashMap<>();
	      map.put("uid", uid);
	      map.put("status", status);
	      
	      session.update(namespace + ".statusUpdate", map);
	   }
	
	@Override
	public int usertotal() {
		return session.selectOne(namespace + ".usertotal");
	}
	
	@Override
	public int alltradetotal() {
		return session.selectOne(namespace + ".alltradetotal");
	}
	
	@Override
	public void deliveryUpdate(String uid, String delivery) {
		Map<String,Object> map = new HashMap<>();
	    map.put("uid", uid);
	    map.put("delivery", delivery);
		
		session.selectOne(namespace + ".deliveryUpdate",map);
	}
}
