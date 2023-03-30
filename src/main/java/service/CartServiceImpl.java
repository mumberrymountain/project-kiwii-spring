package service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import dao.BookDAO;
import dao.CartDAO;
import dao.MemberDAO;
import exceptionhandler.BusinessException;
import exceptionhandler.ErrorCode;
import lombok.RequiredArgsConstructor;
import vo.CartVO;
import vo.PaymentVO;

@Service("cartService")
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {

	private final CartDAO cartDAO;
	private final MemberDAO memberDAO;
	private final DataSourceTransactionManager transactionManager;
	
	@Override
	public List<CartVO> viewMyCartList(int id) {
		List<CartVO> myCart = cartDAO.viewMyCartList(id);
		return myCart;
	}

	@Override
	public String insertIntoMyCart(int bookId, int id) {
		
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("bookId", bookId);
		map.put("id", id);
		
		CartVO duplicatedCart = cartDAO.cartDuplicationCheck(map);
		
		if(duplicatedCart != null) return "duplicatedCartExists";
		
		int res = cartDAO.insertIntoMyCart(map);
		if(res < 1) throw new BusinessException(
								ErrorCode.INTERNAL_SERVER_ERROR, 
								"예기치 않은 서버 오류로 인해 상품을 장바구니에 넣는데 실패했습니다.");
		return "insertCartSucceed";
	}

	@Override
	public String deleteFromMyCart(int bookId, int id) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("bookId", bookId);
		map.put("id", id);
		
		int res = cartDAO.deleteFromMyCart(map);
		if(res < 1) throw new BusinessException(
				ErrorCode.INTERNAL_SERVER_ERROR, 
				"예기치 않은 서버 오류로 인해 장바구니에서 상품을 삭제하는데 실패했습니다.");
		else return "delete_succeed";
	}

	@Override
	public HashMap<String, Object> goOrderPage(int[] bookIdArr, int id) {
		ArrayList<CartVO> orderList = new ArrayList<CartVO>();
		int totalPrice = 0;
		
		for(int bookId: bookIdArr) {
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			map.put("bookId", bookId);
			map.put("id", id);
			
			CartVO order = cartDAO.goOrderPage(map);
			totalPrice = totalPrice + order.getSellprice();
			
			orderList.add(order);
		}
		
		String memName = memberDAO.getMemName(id);
		
		HashMap<String, Object> res = new HashMap<String, Object>();
		res.put("orderList", orderList);
		res.put("totalPrice", totalPrice);
		res.put("memName", memName);

		return res;
	}

	@Override
	public PaymentVO orderSucceed(List<CartVO> orderList, 
								int id, String paymentdetail, int amount) {
		
		DefaultTransactionDefinition def = new DefaultTransactionDefinition();
		def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
		TransactionStatus status = transactionManager.getTransaction(def);
		
		try {
			for(CartVO order: orderList) {
				HashMap<String, Integer> map = new HashMap<String, Integer>();
				map.put("id", id);
				map.put("bookId", order.getBookId());
				
				int res1 = cartDAO.saveInLibrary(map);
				int res2 = cartDAO.deleteFromCart(map);
				
				if(res1 < 1 || res2 < 1) throw new BusinessException(ErrorCode.INTERNAL_SERVER_ERROR, 
												"예기치 못한 오류로 인해 결제에 실패했습니다.");
				
			}
			
			PaymentVO vo = new PaymentVO();
			vo.setMemberId(id);
			vo.setPaymentdetail(paymentdetail);
			vo.setAmount(amount);
			
			int res3 = cartDAO.saveInPayment(vo);
			if(res3 < 1) throw new BusinessException(
					ErrorCode.INTERNAL_SERVER_ERROR, "예기치 못한 오류로 인해 결제에 실패했습니다.");
			
			transactionManager.commit(status);
			
			return vo;
			
		}catch (Exception e){
			transactionManager.rollback(status);
			throw e;
		}
		
		
	}

}
