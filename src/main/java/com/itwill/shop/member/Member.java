package com.itwill.shop.member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
public class Member {
/*	이름              널?       유형            
	--------------- -------- ------------- 
	MEMBER_ID       NOT NULL VARCHAR2(100) 
	MEMBER_PASSWORD NOT NULL VARCHAR2(100) 
	MEMBER_NAME     NOT NULL VARCHAR2(100) 
	MEMBER_EMAIL             VARCHAR2(100) 
	MEMBER_PHONE    NOT NULL VARCHAR2(100) 
	MEMBER_ADDRESS           VARCHAR2(100) 
	IS_ADMIN                 VARCHAR2(10)
*/
	private String memberId;
	private String memberPassword;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private String memberAddress;
	private String isAdmin;
	
	
	public Member(String memberId, String memberPassword, String memberName, String memberEmail, String memberPhone,
			String memberAddress, String isAdmin) {
		super();
		this.memberId = memberId;
		this.memberPassword = memberPassword;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberAddress = memberAddress;
		this.isAdmin = isAdmin;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPassword() {
		return memberPassword;
	}

	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getIsAdmin() {
		return isAdmin;
	}

	public void setIsAdmin(String isAdmin) {
		this.isAdmin = isAdmin;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPassword=" + memberPassword + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", memberAddress=" + memberAddress
				+ ", isAdmin=" + isAdmin + "]";
	}

}
