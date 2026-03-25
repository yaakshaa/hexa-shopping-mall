package com.itwill.shop.member;

import com.itwill.shop.member.MemberMapper;

import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDaoImplMyBatis implements MemberDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	public MemberDaoImplMyBatis() throws Exception {
		this.sqlSessionFactory=
				new SqlSessionFactoryBuilder()
				.build(Resources.getResourceAsStream("mybatis-config.xml"));
	}
	
	@Override
	public int insert(Member member) throws Exception {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		MemberMapper memberMapper = sqlSession.getMapper(MemberMapper.class);
		int rowCount = memberMapper.insert(member);
		sqlSession.close();
		return rowCount;

	}

	@Override
	public Member findById(String memberId) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		MemberMapper memberMapper=sqlSession.getMapper(MemberMapper.class);
		Member member = memberMapper.findById(memberId);
		sqlSession.close();
		return member;
	}

	@Override
	public int update(Member member) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		MemberMapper memberMapper=sqlSession.getMapper(MemberMapper.class);
		int rowCount=memberMapper.update(member);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public int delete(String memberId) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		MemberMapper memberMapper=sqlSession.getMapper(MemberMapper.class);
		int rowCount=memberMapper.delete(memberId);
		sqlSession.close();
		return rowCount;
	}

	@Override
	public List<Member> findAll() throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		MemberMapper memberMapper=sqlSession.getMapper(MemberMapper.class);
		List<Member> memberList=memberMapper.findAll();
		sqlSession.close();
		return memberList;
	}

	@Override
	public boolean login(String memberId, String memberPassword) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		MemberMapper memberMapper=sqlSession.getMapper(MemberMapper.class);
		int count=memberMapper.login(memberId, memberPassword);
		sqlSession.close();
		return count>0;
	}

	@Override
	public boolean isDuplicated(String memberId) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		MemberMapper memberMapper=sqlSession.getMapper(MemberMapper.class);
		int count=memberMapper.countByMemberId(memberId);
		sqlSession.close();
		return count>0;
	}

	@Override
	public boolean isAdmin(String memberId) throws Exception {
		SqlSession sqlSession=sqlSessionFactory.openSession(true);
		MemberMapper memberMapper=sqlSession.getMapper(MemberMapper.class);
		String isAdmin =memberMapper.isAdmin(memberId);
		sqlSession.close();
		return "Y".equalsIgnoreCase(isAdmin);
	}
}
