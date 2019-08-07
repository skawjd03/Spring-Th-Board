package kr.th.bo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.th.bo.mapper.MemberMapper;
import kr.th.bo.util.PasswordMd5;
import kr.th.bo.vo.MemberVO;
import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper mapper;

	@Override
	public int joinMember(MemberVO member) {
		member.setUserPass(new PasswordMd5().passMD5(member.getUserPass()));
		int result = 0;
		if(mapper.insertMember(member) > 0) {
			result = 1;
		}else result = -1;
		return result;
	}

	@Override
	public int idCheck(String userId) {
		return mapper.selectIdCheck(userId);
	}

	@Override
	public int phoneCheck(String phone) {
		return mapper.selectPhoneCheck(phone);
	}

	@Override
	public boolean loginCheck(MemberVO member) {
		member.setUserPass(new PasswordMd5().passMD5(member.getUserPass()));
		boolean result = false;
		if(mapper.selectLoginCheck(member) > 0) result = true;
		return result;
	}

	@Override
	public MemberVO getMemberInfo(MemberVO member) {
		return mapper.selectMember(member);
	}

}
