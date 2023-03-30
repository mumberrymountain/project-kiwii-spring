package service;

import java.util.HashMap;
import java.util.List;

import vo.MemberVO;
import vo.PaymentVO;

public interface MembersService {
	public HashMap<String, Object> login(HashMap<String, String> map);
	
	public String idCheck(String memId);
	
	public void cellPhoneNumberCertifiyNumSend(int certifyNum, String memCellNum);

	public MemberVO register(MemberVO vo);
	
	public String findId(MemberVO vo);
	
	public HashMap<String, Object> myPage(int id, String memId);
	
	public List<PaymentVO> myPaymentSelect(int id);
	
	public MemberVO pwdCheck(String memId, String checkPwd);
	
	public int emailUpdate(String memId, String memEmail);
	
	public int pwdUpdate(String memId, String memPwd);
}
