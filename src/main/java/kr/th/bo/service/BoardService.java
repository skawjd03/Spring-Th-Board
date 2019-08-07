package kr.th.bo.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kr.th.bo.vo.CommentVO;
import kr.th.bo.vo.PostWithComment;
import kr.th.bo.vo.ThumbsVO;
import kr.th.bo.vo.BoardVO;
import kr.th.bo.vo.domain.Criteria;

public interface BoardService {
	
	public List<BoardVO> getPostList(Criteria cri);

	public int countTotal(Criteria cri);

	public int upPostHit(int postNo);

	public int writePost(BoardVO post,MultipartFile uploadFile, String path);

	public int changePost(BoardVO post);

	public int removePost(int postNo);

	public int writeComment(CommentVO comment);

	public PostWithComment getPostWithComment(int postNo, Criteria cri);

	public int commentCountTotal(int postNo);

	public int updateThumbs(ThumbsVO thumbs);

	public BoardVO getPostInfo(int postNo);
}
