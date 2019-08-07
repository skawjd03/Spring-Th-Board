package kr.th.bo.service;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.th.bo.mapper.BoardMapper;
import kr.th.bo.vo.CommentVO;
import kr.th.bo.vo.PostWithComment;
import kr.th.bo.vo.ThumbsVO;
import kr.th.bo.vo.BoardVO;
import kr.th.bo.vo.domain.Criteria;
import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getPostList(Criteria ctr) {
		return mapper.selectboardList(ctr);
	}

	@Override
	public int countTotal(Criteria ctr) {
		return mapper.countTotal(ctr);
	}

	@Override
	public int upPostHit(int postNo) {
		return mapper.updatePostHit(postNo);
	}

	@Override
	@Transactional
	public int writePost(BoardVO board,MultipartFile uploadFile, String path) {
		String profileName = uploadFile.getOriginalFilename().split("\\.")[0]+new Date().getTime()+"."+ uploadFile.getOriginalFilename().split("\\.")[1];
		File saveProfile = new File(path,profileName);
		if(mapper.insertPost(board) > 0) {	// 게시글 업로드
			try {	
				uploadFile.transferTo(saveProfile); // 파일 저장
				mapper.insertFile("/bo/resources/upload/"+profileName,uploadFile.getOriginalFilename());
			} catch (Exception e) {
				e.printStackTrace();
				return -2;
			}
			return 1;
		}else {
			return -1;			
		}
	}

	@Override
	public int changePost(BoardVO board) {
		return mapper.updatePost(board);
	}

	@Override
	public int removePost(int postNo) {
		return mapper.deletePost(postNo);
	}

	@Override
	public int writeComment(CommentVO comment) {
		return mapper.insertComment(comment);
	}

	@Override
	public PostWithComment getPostWithComment(int postNo, Criteria ctr) {
		PostWithComment pwc = new PostWithComment();
		pwc.setPost(mapper.selectPost(postNo));
		pwc.setComment(mapper.selectComment(ctr, postNo));
		return pwc;
	}

	@Override
	public int commentCountTotal(int postNo) {
		return mapper.commentCountTotal(postNo);
	}

	@Override
	public int updateThumbs(ThumbsVO thumbs) {
		mapper.updateThumbs(thumbs);
		return mapper.selectThumbs(thumbs);
	}

	@Override
	public BoardVO getPostInfo(int postNo) {
		return mapper.selectPost(postNo);
	}

}
