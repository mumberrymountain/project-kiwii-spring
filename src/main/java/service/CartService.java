package service;

import java.util.HashMap;
import java.util.List;

import vo.CartVO;
import vo.PaymentVO;

public interface CartService {

	public List<CartVO> viewMyCartList(int id);
	
	public String insertIntoMyCart(int bookId, int id);
	
	public String deleteFromMyCart(int bookId, int id);
	
	public HashMap<String, Object> goOrderPage(int[] bookIdArr, int id);
	
	public PaymentVO orderSucceed(List<CartVO> orderList, int id, String paymentdetail, int amount);
}
