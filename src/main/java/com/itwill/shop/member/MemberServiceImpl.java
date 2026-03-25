package com.itwill.shop.member;

import java.util.List;

public class MemberServiceImpl implements MemberService {
	private MemberDao memberDao;
	public MemberServiceImpl(MemberDao memberDao) {
		this.memberDao=memberDao;
	}
	@Override
	public boolean addMember(Member newMember) throws Exception {
		int result=memberDao.insert(newMember);
		return result>0;
	}
	@Override
	public boolean isDuplicated(String memberId) throws Exception {
		return memberDao.isDuplicated(memberId);
	}
	@Override
	public Member getMember(String memberId) throws Exception {
		return memberDao.findById(memberId);
	}
	@Override
	public int updateMember(Member member) throws Exception {
		return memberDao.update(member);
	}
	@Override
	public int deleteMember(String memberId) throws Exception {
		return memberDao.delete(memberId);
	}
	@Override
	public List<Member> getAllMembers() throws Exception {
		
		return memberDao.findAll();
	}
	@Override
	public boolean login(String memberId, String memberPassword) throws Exception {
		
		return memberDao.login(memberId, memberPassword);
	}
	@Override
	public boolean isAdmin(String memberId) throws Exception {
		
		return memberDao.isAdmin(memberId);
	}
}
