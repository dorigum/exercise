package com.multi.exercise;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	@Autowired
	MemberService memservice;
	
	// 로그인 폼으로 이동
	@RequestMapping("loginForm")
	public String loginForm() {
		return "loginForm";
	}

	// 로그인 체크
	@RequestMapping("/login")
	public String loginCheck(@RequestParam("id") String id, @RequestParam("pwd") String pwd, HttpSession session) {
		// memberservice에서 로긴 체크
		MemberVO vo =memservice.loginCheck(id, pwd);

		// 결과 받아서 id와 비밀전호가 일치하면 세션 변수로 저장
		if (vo != null) {
			session.setAttribute("sid", vo.getId());
		}else {
			session.setAttribute("ERRORMSG", true);
			return "loginForm";
		}

		return "redirect:/"; // index 페이지로 포워딩
	}

	// 로그 아웃
	@RequestMapping("/logout")
	public String userLogout(HttpSession session) {
		// 로그 아웃
		session.invalidate();
		return "redirect:/";
	}

	// 회원 가입 폼으로 이동
	@RequestMapping("joinForm")
	public String joinForm() {
		return "joinForm";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping("idCheck") 
	public int idCheck(@RequestParam("id") String id)  {
		return memservice.idCheck(id); 
	}
	  
	// 회원 가입 완료
	@RequestMapping("join")
	public String join(HttpServletRequest request, HttpServletResponse response, HttpSession session ) {
		// memberservice에서 로긴 체크
		String id =request.getParameter("Id");
		String pwd =request.getParameter("pwd");
		String name =request.getParameter("memName");
		String email =request.getParameter("email");
		System.out.println(id+pwd+name+email);
		MemberVO vo =memservice.join(id, pwd, name, email);
		session.setAttribute("sid", id);
		// 조인 컨펌으로 이동
		return "joinConfirm"; //
	}
	
}
