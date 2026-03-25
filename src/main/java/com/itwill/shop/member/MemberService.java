package com.itwill.shop.member;

import java.util.List;

public interface MemberService {
	
	// 회원 가입(중복 확인은 호출하는 쪽에서 먼저 수행)
	public boolean addMember(Member newMember) throws Exception;
		
	//아이디 중복 확인 
	public boolean isDuplicated(String memberId) throws Exception;
	
	// 회원 조회
	public Member getMember(String memberId) throws Exception;
	
	// 회원 정보 수정
	public int updateMember(Member member) throws Exception;

	// 회원 탈퇴 delete
	public int deleteMember(String memberId) throws Exception;
	
	// 전체 회원 조회
	public List<Member> getAllMembers() throws Exception;

	// 로그인
	public boolean login(String memberId, String memberPassword) throws Exception;

	// 관리자 여부 확인
	public boolean isAdmin(String memberId) throws Exception;
}
