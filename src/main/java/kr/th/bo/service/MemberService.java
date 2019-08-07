package kr.th.bo.service;

import kr.th.bo.vo.MemberVO;

public interface MemberService {

	public int joinMember(MemberVO member);

	public int idCheck(String userId);

	public int phoneCheck(String phone);

	public boolean loginCheck(MemberVO member);

	public MemberVO getMemberInfo(MemberVO member);
}
