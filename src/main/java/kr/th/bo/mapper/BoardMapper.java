package kr.th.bo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.th.bo.vo.CommentVO;
import kr.th.bo.vo.ThumbsVO;
import kr.th.bo.vo.BoardVO;
import kr.th.bo.vo.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> selectboardList(Criteria ctr);

	public BoardVO selectPost(int postNo);

	public int countTotal(Criteria ctr);

	public int updatePostHit(int postNo);

	public int insertPost(BoardVO board);
	
	public int insertFile(@Param("filePath")String filePath,@Param("fileName")String fileName);

	public int updatePost(BoardVO board);

	public int deletePost(int postNo);

	public List<CommentVO> selectComment(@Param("ctr") Criteria ctr, @Param("postNo") int postNo);

	public int commentCountTotal(int postNo);

	public int insertComment(CommentVO comment);

	public void updateThumbs(ThumbsVO thumbs);

	public int selectThumbs(ThumbsVO thumbs);
}
