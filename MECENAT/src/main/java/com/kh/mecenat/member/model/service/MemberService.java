package com.kh.mecenat.member.model.service;

import java.util.ArrayList;

import com.kh.mecenat.common.PageInfo;
import com.kh.mecenat.member.model.vo.Member;
import com.kh.mecenat.performance.model.vo.Review;

public interface MemberService {

	// 회원 가입
	int signup(Member m);

	// 회원 탈퇴
	int deleteMember(String userId);

	// ID 중복 체크
	int checkDupId(String checkId);

	// EMAIL 중복 체크
	int checkDupEmail(String checkEmail);

	// 로그인 서비스
	Member loginMember(String userId);

	// 로그인 유저
	Member loginUser(Member m);
	
	//아이디 찾기
	Member memberIdSearch(Member m);
	
	// 비밀번호 찾기
	Member selectMember(String email);

	// 비밀번호 재설정
	int search_Pwd_New(Member vo);
	
	//마이페이지 회원정보 수정
	int updateMember(Member m);

	int blackMember(String userId);
	
	int blackCancelMember(String userId);

	int selectListCount();

	ArrayList<Member> selectAllMemberList(PageInfo pi);
	
	Member selectm(String userId);
	
	ArrayList<Review> selectReviewList(String userId);

	

	
	
	

	


	
	


}
