package com.itwill.shop.member;

import java.util.List;
import java.util.Scanner;

public class MemberServiceTestMain {

	public static void main(String[] args) throws Exception {
		MemberDao memberDao= new MemberDaoImplMyBatis();
		MemberService memberService = new MemberServiceImpl(memberDao);
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("----- 회원 기능 테스트 시작 -----");

		
		Member newMember=new Member("테스트2", "1234", "테스트2", "test2@test.com", "031-4293", "대구", "N");
		
		if(!memberService.isDuplicated(newMember.getMemberId())) {
			boolean isAdded=memberService.addMember(newMember);
			System.out.println("1. 회원가입 결과: "+(isAdded?"성공":"실패"));
		}else {
			System.out.println("이미 존재하는 ID입니다.");
		}
		
		boolean loginSuccess=memberService.login("테스트2", "1234");
		System.out.println("2. 로그인 결과: "+(loginSuccess?"성공":"실패"));
		
		Member foundMember=memberService.getMember("테스트2");
		System.out.println("3. 회원 조회 결과:\n"+foundMember);
		
		foundMember.setMemberPhone("010-3425-8903");
		foundMember.setMemberAddress("서울");
		int updateResult=memberService.updateMember(foundMember);
		System.out.println("4. 회원 수정 결과: "+(updateResult>0?"수정 성공":"수정실패"));
		
		List<Member> memberList=memberService.getAllMembers();
		System.out.println("5. 전체 회원 목록:");
		for(Member m : memberList) {
			System.out.println(m);
		}
		
		boolean isAdmin=memberService.isAdmin("테스트2");
		System.out.println("6. 관리자 여부: "+(isAdmin?"Y":"N"));
		
		System.out.print("7. 삭제할 회원 ID 입력: ");
		String deleteId=scanner.nextLine();
		int deleteResult=memberService.deleteMember(deleteId);
		System.out.println("삭제 결과: "+(deleteResult>0?"삭제 완료":"회원 없음 또는 실패"));
		scanner.close();
		
		System.out.println("----- 테스트 종료 -----");
		
	}

}
