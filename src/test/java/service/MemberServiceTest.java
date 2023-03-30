package service;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import dao.MemberDAOImpl;
import vo.MemberVO;

public class MemberServiceTest {

	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void idCheckTest() {
	
		MemberDAOImpl memberDAO =  new MemberDAOImpl(sqlSession);
		MemberVO vo = memberDAO.idCheck("test111");
		System.out.println(vo);
		// MemberServiceImpl memberService = new MemberServiceImpl(memberDAO);
		// String vo = memberService.idCheck("test111");
		// System.out.println(memberDAO);
		// System.out.println(memberService);
		
	}
}
