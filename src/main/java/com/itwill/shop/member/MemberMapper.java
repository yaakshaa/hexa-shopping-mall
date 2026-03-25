package com.itwill.shop.member;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface MemberMapper {
	/*
	 * insert, update, delete, findById, findAll, isIdDuplicated, loginCheck, isAdmin
	 */
	
	@Insert("INSERT INTO member(member_id, member_password, member_name, member_email, member_phone, member_address, is_admin) \r\n"
			+ "VALUES(#{memberId},#{memberPassword},#{memberName},#{memberEmail},#{memberPhone},#{memberAddress},#{isAdmin})")
	public  int insert(Member member);
	
	@Update("UPDATE member SET member_password = #{memberPassword}, member_name = #{memberName}, member_email = #{memberEmail}, member_phone = #{memberPhone}, member_address = #{memberAddress} " +
			"WHERE member_id = #{memberId}")
	public int update(Member member);
	
	@Delete("DELETE FROM member WHERE member_id = #{memberId}")
	public int delete(@Param("memberId") String memberId) throws Exception;
	
	@Select("SELECT * FROM member WHERE member_id = #{memberId}")
	public Member findById(@Param("memberId") String memberId);
	
	@Select("SELECT * FROM member")
	public List<Member> findAll();
	
	@Select("SELECT COUNT(*) FROM member WHERE member_id = #{memberId}")
	public int countByMemberId(@Param("memberId")String memberId);
	
	@Select("SELECT COUNT(*) FROM member WHERE member_id = #{memberId} AND member_password = #{memberPassword}")
	public int login(@Param("memberId") String memberId,@Param("memberPassword")String memberPassword);
	
	@Select( "SELECT is_admin FROM member WHERE member_id = #{memberId}")
	public String isAdmin(@Param("memberId")String memberId);
}
