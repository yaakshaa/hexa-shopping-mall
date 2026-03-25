package com.itwill.shop.member;

public class MemberSQL {
	//회원등록
	public static final String MEMBER_INSERT=
			"INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address, is_admin) \r\n"
			+ "VALUES(?,?,?,?,?,?,?)";
	//회원 상세 조회
	public static final String MEMBER_SELECT_BY_ID=
			"SELECT * FROM member WHERE member_id = ?";
	//전체 회원 조회(관리자 기능용)
	public static final String MEMBER_SELECT_ALL=
			 "SELECT * FROM member";
	//회원 정보 수정
	public static final String MEMBER_UPDATE=
			"UPDATE member SET member_password = ?, member_name = ?, member_email = ?, member_phone = ?, member_address = ? " +
			"WHERE member_id = ?";
	//회원 탈퇴
	public static final String MEMBER_DELETE=
			"DELETE FROM member WHERE member_id = ?";
	//아이디 중복 체크
	public static final String MEMBER_ID_DUPLICATE_CHECK=
			"SELECT COUNT(*) FROM member WHERE member_id = ?";
	//로그인 검증(아이디+비밀번호 일치 여부)
	public static final String MEMBER_LOGIN_CHECK=
			"SELECT COUNT(*) FROM member WHERE member_id = ? AND member_password = ?";
	//관리자 여부 확인
	public static final String MEMBER_IS_ADMIN_CHECK=
			 "SELECT is_admin FROM member WHERE member_id = ?";
}
