package com.kh.mecenat.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.mecenat.member.model.vo.Member;

public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		// 로그인 되어있는지 아닌지 확인하는 작업
		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser != null) { // 로그인되어있는 정보가 있다면 Controller 요청 실행

			if (loginUser.getUserId().equals("admin")) {
				session.setAttribute("alertMsg", "관리자님 안녕하세요");
			} else {
//				session.setAttribute("alertMsg", loginUser.getUserName() + "님 안녕하세요.");
			}
			return true;
		} else {
			// 로그인 되어 있지 않는 경우 - Controller 요청 처리 하지 않음
			session.setAttribute("alertMsg", "로그인 후 가능한 서비스입니다.");
			response.sendRedirect(request.getContextPath());

			return false;
		}
		//test01

	}

}
