package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import vo.CartVO;
import vo.PaymentVO;

@Repository("cartDAO")
@RequiredArgsConstructor
public class CartDAOImpl implements CartDAO {

	private final SqlSession sqlSession;
	
	@Override
	public int cartCount(int id) {
		int cartCount =  sqlSession.selectOne("b.bookCount", id);
		return cartCount;
	}

	@Override
	public List<CartVO> viewMyCartList(int id) {
		List<CartVO> myCart = sqlSession.selectList("c.viewMyCartList", id);
		return myCart;
	}

	@Override
	public CartVO cartDuplicationCheck(HashMap<String, Integer> map) {
		CartVO duplicatedCart = sqlSession.selectOne("c.cartDuplicationCheck", map);
		return duplicatedCart;
	}

	@Override
	public int insertIntoMyCart(HashMap<String, Integer> map) {
		int res = sqlSession.insert("c.insertIntoMyCart", map);
		return res;
	}

	@Override
	public int deleteFromMyCart(HashMap<String, Integer> map) {
		int res = sqlSession.delete("c.deleteFromMyCart", map);
		return res;
	}

	@Override
	public CartVO goOrderPage(HashMap<String, Integer> map) {
		CartVO order = sqlSession.selectOne("c.goOrderPage", map);
		return order;
	}

	@Override
	public int saveInLibrary(HashMap<String, Integer> map) {
		int res = sqlSession.insert("c.saveInLibrary", map);
		return res;
	}

	@Override
	public int deleteFromCart(HashMap<String, Integer> map) {
		int res = sqlSession.delete("c.deleteFromCart", map);
		return res;
	}

	@Override
	public int saveInPayment(PaymentVO vo) {
		int res = sqlSession.insert("c.saveInPayment", vo);
		return res;
	}
	
}
