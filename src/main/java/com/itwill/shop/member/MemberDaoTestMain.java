package com.itwill.shop.member;

import com.itwill.shop.common.DataSource;



public class MemberDaoTestMain {

	public static void main(String[] args) throws Exception {
		DataSource dataSource = new DataSource();
		MemberDaoImplMyBatis memberDao= new MemberDaoImplMyBatis();
		MemberService memberService = new MemberServiceImpl(memberDao);
		
		Member newMember = new Member("테스트", "1111", "테스트용", "test@test.com", "321-5467", "서울", "Y");
		
		System.out.println("-------- 1. 회원가입 --------");
		if(!memberService.isDuplicated(newMember.getMemberId())) {
			memberService.addMember(newMember);
			System.out.println("회원가입 성공!");
		}else {
			System.out.println("이미 존재하는 아이디입니다.");
		}
		
		System.out.println("-------- 2. 로그인 --------");
		boolean loginSuccess=memberService.login(newMember.getMemberId(), newMember.getMemberPassword());
		System.out.println("로그인 결과: "+(loginSuccess ? "성공":"실패"));
		
		System.out.println("-------- 3. 회원 정보 조회 --------");
		Member findMember=memberService.getMember(newMember.getMemberId());
		System.out.println(findMember);
		
		System.out.println("-------- 4. 관리자 여부 확인 --------");
		boolean isAdmin = memberService.isAdmin(newMember.getMemberId());
		System.out.println("관리자인가요?"+(isAdmin? "예":"아니오"));
		
		System.out.println("-------- 5. 회원 정보 수정 --------");
		findMember.setMemberPhone("083-8123");
		findMember.setMemberAddress("성남");
		memberService.updateMember(findMember);
		System.out.println("회원 정보 수정 완료");
		
		System.out.println("-------- 6. 전체 회원 리스트 --------");
		for(Member m : memberService.getAllMembers()) {
			System.out.println(m);
		}
		/*
		System.out.println("-------- 7. 회원 탈퇴 --------");
		memberService.deleteMember(newMember.getMemberId());
		System.out.println("회원 삭제 완료");
	   */
	}

}
