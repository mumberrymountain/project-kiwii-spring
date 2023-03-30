package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import exceptionhandler.BusinessException;
import exceptionhandler.ErrorCode;
import lombok.RequiredArgsConstructor;
import service.IndexService;
import service.MembersService;
import vo.MemberVO;
import vo.PaymentVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	SqlSession sqlSession;

	public MemberDAOImpl(SqlSession sqlSession) {
		super();
		this.sqlSession = sqlSession;
	}

	@Override
	public MemberVO login(String memId) {
		MemberVO member = sqlSession.selectOne("m.login", memId);
		return member;
	}

	@Override
	public MemberVO idCheck(String memId) {
		MemberVO sameId = sqlSession.selectOne("m.idCheck", memId);
		return sameId;
	}

	@Override
	public int register(MemberVO vo) {
		int res = sqlSession.insert("m.register", vo);
		return res;
	}

	@Override
	public MemberVO registerSuccess(String memId) {
		MemberVO member = sqlSession.selectOne("m.registerSuccess", memId);
		return member;
	}
	
	@Override
	public String findIdByPhoneNumber(MemberVO vo) {
		String memId = sqlSession.selectOne("m.findIdByPhoneNumber", vo);
		return memId;
	}
	
	@Override
	public String findIdByEmail(MemberVO vo) {
		String memId = sqlSession.selectOne("m.findIdByEmail", vo);
		return memId;
	}

	@Override
	public MemberVO myPage(String memId) {
		MemberVO member = sqlSession.selectOne("m.myPage", memId);
		return member;
	}

	@Override
	public List<PaymentVO> myPaymentSelect(int id) {
		List<PaymentVO> payment = sqlSession.selectList("m.myPaymentSelect", id);
		return payment;
	}

	@Override
	public MemberVO pwdCheck(String memId) {
		MemberVO member = sqlSession.selectOne("m.pwdCheck", memId);
		return member;
	}

	@Override
	public int emailUpdate(HashMap<String, String> map) {
		int res = sqlSession.update("m.emailUpdate", map);
		return res;
	}

	@Override
	public int pwdUpdate(HashMap<String, String> map) {
		int res = sqlSession.update("m.pwdUpdate", map);
		return res;
	}

	@Override
	public String getMemName(int id) {
		MemberVO member = sqlSession.selectOne("m.getMemName", id);
		String memName = member.getMemName();
		return memName;
	}
}
