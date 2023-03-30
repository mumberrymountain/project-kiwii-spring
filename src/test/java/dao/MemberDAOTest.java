package dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import vo.MemberVO;

public class MemberDAOTest {
	
	@Autowired
	SqlSession sqlSession;

	@Test
	public void registerSuccessTest() {
		MemberDAOImpl memberDAO =  new MemberDAOImpl(sqlSession);
		// MemberVO vo = memberDAO.registerSuccess("test111");
		MemberVO vo = memberDAO.idCheck("test111");
		System.out.println(vo);
	}
}
