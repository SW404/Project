package com.example.dao;

import java.util.List;

import com.example.domain.BuyVO;
import com.example.domain.Criteria;
import com.example.domain.ShopVO;
import com.example.domain.UserVO;

public interface AdminDAO {
	public List<ShopVO> list(Criteria cri);
	public void admininsert(ShopVO vo);
	public void adminupdate(ShopVO vo);
	public List<BuyVO> alltrade(Criteria cri);
	public List<UserVO> userlist(Criteria cri);
	public ShopVO read(int id);
	public int total();
	public int usertotal();
	public int alltradetotal();
	public void delete(int id);
	public void statusUpdate(String uid, int status);
	public void deliveryUpdate(String uid, String delivery);
}
