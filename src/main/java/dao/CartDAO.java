package dao;

import java.util.HashMap;
import java.util.List;

import vo.CartVO;
import vo.PaymentVO;

public interface CartDAO {
	public int cartCount(int id);
	
	public List<CartVO> viewMyCartList(int id);
	
	public CartVO cartDuplicationCheck(HashMap<String, Integer> map);
	
	public int insertIntoMyCart(HashMap<String, Integer> map);
	
	public int deleteFromMyCart(HashMap<String, Integer> map);
	
	public CartVO goOrderPage(HashMap<String, Integer> map);
	
	public int saveInLibrary(HashMap<String, Integer> map);
	
	public int deleteFromCart(HashMap<String, Integer> map);
	
	public int saveInPayment(PaymentVO vo);
}
