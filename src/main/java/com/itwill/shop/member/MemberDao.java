package com.itwill.shop.member;

import java.util.List;

public interface MemberDao {
	
	//회원 가입
	int insert(Member member) throws Exception;
	
	//회원 조회
	Member findById(String memberId) throws Exception;
	
	//회원 정보 수정
	int update(Member member) throws Exception;
	
	//회원 삭제
	int delete(String memberId) throws Exception;
	
	//전체 회원 조회
	List<Member> findAll() throws Exception;
	
	
	//로그인 검증
	boolean login(String memberId, String memberPassword) throws Exception;
	
	//아이디 중복 체크
	boolean isDuplicated(String memberId) throws Exception;
	
	//관리자 여부 체크
	boolean isAdmin(String memberId) throws Exception;
}
