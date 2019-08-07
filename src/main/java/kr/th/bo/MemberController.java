package kr.th.bo;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.th.bo.service.MemberService;
import kr.th.bo.vo.MemberVO;
import lombok.Setter;

@Controller
public class MemberController {

	@Setter(onMethod_ = @Autowired)
	private MemberService service;

	@ResponseBody
	@PostMapping("/join/idcheck") // 회원가입아이디체크
	public int idCheck(String userId) {
		return service.idCheck(userId);
	}

	@ResponseBody
	@PostMapping("/join/phonecheck") // 회원가입전화번호체크
	public int phoneCheck(String userPhone) {
		return service.phoneCheck(userPhone);
	}

	@PostMapping("/join/memberjoin") // 회원가입
	public String memberJoin(MemberVO member, HttpSession session) {
		int result = service.joinMember(member);
		if (result == 1) {
			session.setAttribute("loginInfo", service.getMemberInfo(member));
			return "redirect:/joinok";
		} else {
			return "redirect:/common/exception";
		}
	}

	@PostMapping("/login/checklogin")
	public String loginDo(MemberVO member, HttpSession session, RedirectAttributes red) {
		if (service.loginCheck(member)) {
			session.setAttribute("loginInfo", service.getMemberInfo(member));
			return "redirect:/board";
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>(); // 로그인실패시 에러메시지담고 리다이렉트
			map.put("errorId", member.getUserId());
			map.put("loginErrorMsg", "아이디 또는 비밀번호를 다시 확인하세요.");
			red.addFlashAttribute("errormap", map);
			return "redirect:/login";
		}
	}
}
