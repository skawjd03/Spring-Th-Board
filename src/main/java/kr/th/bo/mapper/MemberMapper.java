package kr.th.bo.mapper;

import kr.th.bo.vo.MemberVO;

public interface MemberMapper {
	
	public int insertMember(MemberVO member);
	
	public int selectIdCheck(String userId);
	
	public int selectPhoneCheck(String phone);
	
	public int selectLoginCheck(MemberVO member);
	
	public MemberVO selectMember(MemberVO member);
}
