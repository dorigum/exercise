package com.multi.exercise;

import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


@Service
public class MemberService  {
	
	@Autowired
	@Qualifier("IMemberDAO")
	IMemberDAO memdao;

	public MemberVO loginCheck(String id, String pwd) {
		//Mapper에게 값을 2개 이상 전달할 때 HashMap 사용
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		return memdao.loginCheck(map);
	}
	
	/*
	 * @Override public MemberVO idCheck(String id) { return dao.idCheck(id); }
	 */
	
	public int idCheck(String id) {
		return memdao.idCheck(id);
	}
	
	public MemberVO join(String id, String pwd, String name, String email) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("pwd", pwd);
		map.put("name", name);
		map.put("email", email);
		return memdao.join(map);
	}
	
}









