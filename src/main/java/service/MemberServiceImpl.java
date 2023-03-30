package service;

import java.util.HashMap;
import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import dao.BookDAO;
import dao.CartDAO;
import dao.MemberDAO;
import exceptionhandler.BusinessException;
import exceptionhandler.ErrorCode;
import lombok.RequiredArgsConstructor;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;
import vo.MemberVO;
import vo.PaymentVO;

@Service("membersService")
@RequiredArgsConstructor
public class MemberServiceImpl implements MembersService {

	private final MemberDAO memberDAO;
	private final CartDAO cartDAO;
	private final BookDAO bookDAO;
	
	@Value("${COOLSMS_API_KEY}")
	String COOLSMS_API_KEY;
	
	@Value("${COOLSMS_API_SECRET}")
	String COOLSMS_API_SECRET;
	
	@Value("${COOLSMS_API_SENDER}")
	String COOLSMS_API_SENDER;

	@Override
	public HashMap<String, Object> login(HashMap<String, String> map) {
		
		MemberVO member = memberDAO.login(map.get("memId"));
		if(member == null) throw new BusinessException(ErrorCode.UNAUTHORIZED, "존재하지 않는 아이디입니다.");
		
		Boolean result = BCrypt.checkpw(map.get("memPwd"), member.getMemPwd());
		if(result == false) throw new BusinessException(ErrorCode.UNAUTHORIZED, "존재하지 않는 비밀번호입니다.");
		
		HashMap<String, Object> loginInfo = new HashMap<String, Object>();
		loginInfo.put("memId", member.getMemId());
		loginInfo.put("id", member.getId());
		
		return loginInfo;
	}

	@Override
	public String idCheck(String memId) {
		MemberVO sameId = memberDAO.idCheck(memId);
		if(sameId != null) return "sameid_exists";
		else return "sameid_not_exists";
	}

	@Override
	public void cellPhoneNumberCertifiyNumSend(int certifyNum, String memCellNum ) {
	
		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(COOLSMS_API_KEY, COOLSMS_API_SECRET, "https://api.coolsms.co.kr");
		
		Message message = new Message();
		message.setFrom(COOLSMS_API_SENDER);
        message.setTo(memCellNum);
        message.setText("[" + certifyNum + "] KIWII 인증번호를 입력해주세요.");
		
        System.out.println("/여기서 막히나? 파트 2");
        
        messageService.sendOne(new SingleMessageSendingRequest(message));
	}

	@Override
	@Transactional
	public MemberVO register(MemberVO vo) {
		String hashedPassword = BCrypt.hashpw(vo.getMemPwd(), BCrypt.gensalt(12));
		vo.setMemPwd(hashedPassword);
		
		
		int res = memberDAO.register(vo);
		if (res < 1) throw new BusinessException(
									ErrorCode.INTERNAL_SERVER_ERROR, 
									"서버에서 예기치 않은 오류가 발생해 회원가입에 실패했습니다.");
		
		MemberVO member = memberDAO.registerSuccess(vo.getMemId());
		return member;
	}

	@Override
	public String findId(MemberVO vo) {
		if(vo.getMemEmail() != null) {
			String memId = memberDAO.findIdByEmail(vo);
			if(memId == null) throw new BusinessException(ErrorCode.ACCOUNT_NOT_FOUND, 
														"입력하신 정보에 해당하는 아이디가 존재하지 않습니다.");
			return memId;
		}
		else if(vo.getMemCellNum() != null) {
			String memId = memberDAO.findIdByPhoneNumber(vo);
			if(memId == null) throw new BusinessException(ErrorCode.ACCOUNT_NOT_FOUND, 
														"입력하신 정보에 해당하는 아이디가 존재하지 않습니다.");
			return memId;
		}
		
		throw new BusinessException(ErrorCode.BAD_REQUEST, "이메일 혹은 전화번호가 입력되지 않았습니다.");
	}

	@Override
	public HashMap<String, Object> myPage(int id, String memId) {
		MemberVO member = memberDAO.myPage(memId);
		int bookCount = bookDAO.bookCount(id);
		int cartCount = cartDAO.cartCount(id);
		
		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("memId", member.getMemId());
		res.put("memEmail", member.getMemEmail());
		res.put("bookCount", bookCount);
		res.put("cartCount", cartCount);
		
		return res;
	}

	@Override
	public List<PaymentVO> myPaymentSelect(int id) {
		List<PaymentVO> payment = memberDAO.myPaymentSelect(id);
		return payment;
	}

	@Override
	public MemberVO pwdCheck(String memId, String checkPwd) {
		MemberVO member = memberDAO.pwdCheck(memId);
		if(member == null) throw new BusinessException(
				ErrorCode.UNAUTHORIZED, "비밀번호가 일치하지 않습니다.");
		
		Boolean result = BCrypt.checkpw(checkPwd, member.getMemPwd());
		if(result == false) throw new BusinessException(
				ErrorCode.UNAUTHORIZED, "비밀번호가 일치하지 않습니다.");
		
		return member;
	}

	@Override
	public int emailUpdate(String memId, String memEmail) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("memEmail", memEmail);
		
		int res = memberDAO.emailUpdate(map);
		if(res < 1) throw new BusinessException(
				ErrorCode.INTERNAL_SERVER_ERROR, "예기치 못한 서버 오류로 인해 이메일 변경에 실패했습니다.");
		
		return res;
	}

	@Override
	public int pwdUpdate(String memId, String memPwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("memId", memId);
		map.put("memEmail", memPwd);
		
		int res = memberDAO.pwdUpdate(map);
		if(res < 1) throw new BusinessException(
				ErrorCode.INTERNAL_SERVER_ERROR, "예기치 못한 서버 오류로 인해 비밀번호 변경에 실패했습니다.");
		
		return res;
	}
	
	
}
