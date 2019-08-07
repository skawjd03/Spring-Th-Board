package kr.th.bo;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.th.bo.service.BoardServiceImpl;
import kr.th.bo.vo.domain.Criteria;
import kr.th.bo.vo.domain.PageingInfo;
import lombok.Setter;

@Controller
public class HomeController {

	@Setter(onMethod_ = @Autowired)
	private BoardServiceImpl service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "redirect:/board";
	}

	@GetMapping("/login") // 로그인페이지 호출
	public void getLoginPage() {}

	@GetMapping("/join") // 회원가입 페이지 호출
	public void getJoinPage() {}
	
	@GetMapping("/joinok") // 회원가입 완료 페이지 호출
	public void getJoinOk() {}

	@GetMapping("/board") // 게시판 호출(게시판글 리스트와 페이징정보)
	public void getBoardPage(Criteria cri, Model model) {
		model.addAttribute("list", service.getPostList(cri));
		model.addAttribute("pageMaker", new PageingInfo(cri, service.countTotal(cri)));
	}

	@GetMapping("/logout") // 로그아웃
	public String logout(HttpSession session) {
		session.removeAttribute("loginInfo");
		return "redirect:/board";
	}
	
	

}
