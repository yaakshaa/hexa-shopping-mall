package com.itwill.shop.member;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberMapperTestMain {

	public static void main(String[] args) throws Exception {
		InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		
		try(SqlSession session=sqlSessionFactory.openSession(true)){
			MemberMapper mapper = session.getMapper(MemberMapper.class);
			
			Member member = mapper.findById("테스트");
			System.out.println("회원 조회 결과: "+member);
			
			int loginResult=mapper.login("테스트", "1111");
			System.out.println("로그인 성공 여부: "+(loginResult>0));
			
			int duplicate = mapper.countByMemberId("테스트");
			System.out.println("아이디 중복 여부: "+(duplicate>0));
		}

	}

}
