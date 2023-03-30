package dao;

import java.util.HashMap;
import java.util.List;

import vo.MemberVO;
import vo.PaymentVO;

public interface MemberDAO {
	public MemberVO login(String memId);
	
	public MemberVO idCheck(String memId);
	
	public int register(MemberVO vo);
	
	public MemberVO registerSuccess(String memId);

	public String findIdByPhoneNumber(MemberVO vo);

	public String findIdByEmail(MemberVO vo);
	
	public MemberVO myPage(String memId);
	
	public List<PaymentVO> myPaymentSelect(int id);
	
	public MemberVO pwdCheck(String memId);
	
	public int emailUpdate(HashMap<String, String> map);
	
	public int pwdUpdate(HashMap<String, String> map);
	
	public String getMemName(int id);
}
