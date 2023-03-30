package controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import exceptionhandler.BusinessException;
import exceptionhandler.ErrorCode;
import interceptor.LoggedInGuard;
import interceptor.NotLoggedInGuard;
import lombok.RequiredArgsConstructor;
import service.IndexService;
import service.MembersService;
import vo.MemberVO;
import vo.PaymentVO;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Controller
@RequestMapping("/members")
@RequiredArgsConstructor
public class MembersController {

	private final MembersService membersService;

	@NotLoggedInGuard
	@GetMapping("/login")
	public String loginPage(Model model){
		return "/WEB-INF/views/login.jsp";
	}
	
	@PostMapping("/login")
	@ResponseBody
	public boolean login(@RequestBody MemberVO vo, HttpServletRequest request) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", vo.getMemId());
		map.put("memPwd", vo.getMemPwd());
		
		HashMap<String, Object> loginInfo = membersService.login(map);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginInfo", loginInfo);
		
		return true;
	}
	
	@LoggedInGuard
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginInfo");
		
		return "/WEB-INF/views/index.jsp";
	}
	
	@NotLoggedInGuard
	@GetMapping("/register")
	public String registerPage() {
		return "/WEB-INF/views/register.jsp";
	}
	
	@PostMapping("/register")
	@ResponseBody
	public String register(HttpServletRequest request, @RequestBody MemberVO vo) {
		MemberVO member = membersService.register(vo);
		
		HttpSession session = request.getSession();
		session.setAttribute("registeredMember", member);
		
		return "register-success";
	}
	
	@ResponseBody
	@PostMapping("/idcheck")
	public String idCheckSearchMember(@RequestBody MemberVO vo) {
		String idCheckSearchMember = membersService.idCheck(vo.getMemId());
		return idCheckSearchMember;
	}
	
	@ResponseBody
	@PostMapping("/cellphonenumber-certify-send")
	public boolean cellPhoneNumberCertifiyNumSend(@RequestBody MemberVO vo, HttpServletRequest request) {

		Double randomNum = Math.floor(Math.random()*(9999-1000+1)) + 1000;
		
		DecimalFormat df = new DecimalFormat("0");
		int certifyNum = Integer.parseInt(df.format(randomNum));
		
		membersService.cellPhoneNumberCertifiyNumSend(certifyNum, vo.getMemCellNum());
		
		HttpSession session = request.getSession();
		session.setAttribute("certifyNum", certifyNum);
		
		return true;
	}
	
	@ResponseBody
	@PostMapping("/check-phonecertify-number")
	public String checkPhoneCertifyNumber(HttpServletRequest request, @RequestBody HashMap<String, String> map) {
		String phoneNumCertify = map.get("phoneNumCertify");
		
		HttpSession session = request.getSession();
		String certifyNum = String.valueOf(session.getAttribute("certifyNum"));
		
		if(phoneNumCertify != certifyNum) return "certify_failure";
		else return "certify_success";
	}
	
	@NotLoggedInGuard
	@GetMapping("/register/success")
	public String registerSuccess(HttpServletRequest request, Model model,
			@SessionAttribute(name = "registeredMember") HashMap<String, String> registeredMember) {
		
		model.addAttribute("memId", registeredMember.get("memId"));
		model.addAttribute("memName", registeredMember.get("memName"));
		model.addAttribute("memEmail", registeredMember.get("memEmail"));
		
		return "/WEB-INF/views/registercomplete.jsp";
	}
	
	@NotLoggedInGuard
	@GetMapping("/find/id")
	public String findIdPage() {
		return "/WEB-INF/views/findidpage.jsp";
	}
	
	@PostMapping("/find/id")
	@ResponseBody
	public String findId(@RequestBody MemberVO vo) {
		String memId = membersService.findId(vo);
		
		return memId;
	}
	
	@GetMapping("/popup")
	public String idCheckPopUp(String memberId, Model model) {
		model.addAttribute("memberId", memberId);
		
		return "/WEB-INF/views/idcheckpopup.jsp";
	}
	
	@LoggedInGuard
	@GetMapping("/")
	public String myPage(HttpServletRequest request, Model model,
			@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo) {
		
		String memId = loginInfo.get("memId");
		int id = Integer.parseInt(loginInfo.get("id"));
		
		HashMap<String, Object> res =  membersService.myPage(id, memId);
		model.addAllAttributes(res);
		
		return "/WEB-INF/views/mypage.jsp";
	}
	
	@LoggedInGuard
	@GetMapping("/payments")
	public String myPaymentDetails(HttpServletRequest request, Model model,
			@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo) {
		
		int id = Integer.parseInt(loginInfo.get("id"));
		
		List<PaymentVO> payment = membersService.myPaymentSelect(id);
		model.addAttribute("payment", payment);
		
		return "/WEB-INF/views/paymentdetails.jsp";
	}
	
	@GetMapping("/modify")
	public String myInfoModify(HttpServletRequest request) {
		
		return "/WEB-INF/views/myinfomodify.jsp";
	}
	
	@LoggedInGuard
	@PostMapping("/modify")
	@ResponseBody
	public MemberVO pwdCheck(HttpServletRequest request, @RequestBody MemberVO vo, Model model,
			@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo) {
		String memId = loginInfo.get("memId");
		String checkPwd = vo.getMemPwd();
		
		MemberVO memInfo = membersService.pwdCheck(memId, checkPwd);
		
		HttpSession session = request.getSession();
		session.setAttribute("memInfo", memInfo);
		model.addAttribute("memInfo", memInfo);
		
		return memInfo;
	}
	
	@PatchMapping("/modify/email")
	@ResponseBody
	public int emailUpdate(@RequestBody MemberVO vo, 
			@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo) {
		
		String memId = loginInfo.get("memId");
		String memEmail = vo.getMemEmail();
		
		int res = membersService.emailUpdate(memId, memEmail);
		
		return res;
	}
	
	@PatchMapping("/modify/pwd")
	@ResponseBody
	public int pwdUpdate(@RequestBody MemberVO vo, 
			@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo) {
		
		String memId = loginInfo.get("memId");
		String memPwd = vo.getMemPwd();
		
		int res = membersService.pwdUpdate(memId, memPwd);
		
		return res;
	}
}
