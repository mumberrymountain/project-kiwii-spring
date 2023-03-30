package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class CartDAOTest {
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void cartListTest(){
		System.out.println(sqlSession);
		
		List<Object> myCart = sqlSession.selectList("c.viewMyCartList", 5);
		System.out.println(myCart);
	}
}
