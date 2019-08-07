package kr.th.bo.vo;

import java.util.List;

import lombok.Data;

@Data
public class PostWithComment { // 게시글정보와 댓글리스트 DTO
	
	private BoardVO post;
	
	private List<CommentVO> comment;
}
