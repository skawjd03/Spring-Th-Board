package kr.th.bo.vo;

import lombok.Data;

@Data
public class MemberVO { // 회원 VO

	private String userId;

	private String userPass;

	private String userEmail;

	private String userPhone;

	private String userProfile;

	private String userNick;

	private String isshow;

	private int userNo;
}
