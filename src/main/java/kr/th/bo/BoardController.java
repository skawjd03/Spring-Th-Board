package kr.th.bo;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.th.bo.service.BoardService;
import kr.th.bo.vo.BoardVO;
import kr.th.bo.vo.CommentVO;
import kr.th.bo.vo.MemberVO;
import kr.th.bo.vo.ThumbsVO;
import kr.th.bo.vo.domain.Criteria;
import kr.th.bo.vo.domain.PageingInfo;
import lombok.Setter;

@Controller
public class BoardController {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Setter(onMethod_ = @Autowired)
	private ServletContext context;

	@GetMapping("/post")	
	public void getPostPage(int postNo, Criteria cri, Model model) { // 게시글 보기 (글 정보와 댓글 페이징처리)
		service.upPostHit(postNo);
		cri.setAmount(5);
		model.addAttribute("postWithComment", service.getPostWithComment(postNo, cri));
		model.addAttribute("pageMaker", new PageingInfo(cri, service.commentCountTotal(postNo)));
	}

	@PostMapping("/post/comment")
	@ResponseBody
	public String writeComment(CommentVO comment, HttpSession session) { // 댓글 쓰기
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		if(member == null) {
			return "redirect:/common/401"; //접근제한 에러
		}
		comment.setCommentId(member.getUserId());
		if (service.writeComment(comment) > 0) {
			return "success";
		} else {
			return "false";
		}
	}

	@PostMapping("/post/thumbs")
	@ResponseBody
	public int changeThumbs(ThumbsVO thumbs, HttpSession session) { // 댓글 좋아요(이미 누른사람은 -1)
		MemberVO member = (MemberVO) session.getAttribute("loginInfo");
		if (member == null) {
			return -2;
		}
		thumbs.setThumbsMno(member.getUserNo());
		return service.updateThumbs(thumbs);
	}

	@PostMapping("/write")
	public String writePost(BoardVO board,MultipartFile uploadFile) { // 게시글 쓰기
		if(service.writePost(board,uploadFile,context.getRealPath("\\resources\\upload")) > 0) {
			return "redirect:/board";			
		}else {
			return "redirect:/common/exception";
		}
	}

	@GetMapping("/post/remove")
	public String removePost(int postNo) { // 게시글 삭제
		if(service.removePost(postNo) > 0) {
			return "redirect:/board";			
		}else {
			return "redirect:/common/exception";
		}
	}

	@GetMapping("/update")
	public void getUpdatePage(int postNo, Model model) { //게시글 수정페이지
		model.addAttribute("bList", service.getPostInfo(postNo));
	}

	@PostMapping("/update/changepost")
	public String changePost(BoardVO board) { // 게시글 수정
		if(service.changePost(board) > 0) {
			return "redirect:/post?postNo=" + board.getPostNo();			
		}else {
			return "redirect:/common/exception";
		}
	}
	
	@GetMapping("/post/filedown") // 게시글 파일 다운로드
	public void postFileDonw(String fileName,String fileOrgName,HttpServletResponse response,HttpServletRequest request) throws IOException {
		File file = new File(context.getRealPath("\\resources\\upload"),fileName.split("/")[4]);
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		String header = request.getHeader("User-Agent");
	    String filenames;
	    if ((header.contains("MSIE")) || (header.contains("Trident")) || (header.contains("Edge"))) { //인터넷 익스플로러 10이하 버전, 11버전, 엣지에서 인코딩 
	    	filenames = URLEncoder.encode(fileOrgName, "UTF-8");
	    } else { //나머지 브라우저에서 인코딩
	    	filenames = new String(fileOrgName.getBytes("UTF-8"), "iso-8859-1");
	    } //형식을 모르는 파일첨부용 contentType
		    response.setContentType("application/octet-stream");
		    response.setHeader("Content-Disposition", "attachment; filename=\""+ filenames + "\""); //다운로드와 다운로드될 파일이름
		    FileCopyUtils.copy(in, response.getOutputStream()); //파일복사
		    in.close();
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
	}

}
