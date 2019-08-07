package kr.th.bo.vo;

import lombok.Data;

@Data
public class BoardVO { // 게시글 VO + 파일 VO

	private String postTitle;

	private String postContent;

	private String postDate;

	private String isshow;

	private String postCategory;

	private String postWriter;

	private int postNo;

	private int postHit;
	
	private String filePath;
	
	private String fileName;
	
	private int fileNo;
	
	private int filePno;
	
}
