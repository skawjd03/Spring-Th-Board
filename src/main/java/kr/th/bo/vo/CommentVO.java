package kr.th.bo.vo;

import lombok.Data;

@Data
public class CommentVO { // 댓글 VO

	private String commentId;

	private String commentContent;

	private String commentDate;

	private String isshow;

	private String userNick;

	private String userProfile;

	private int commentNo;

	private int commentPno;

	private int commentThumbs;

	private int commentParent;

	private int lev;

}
