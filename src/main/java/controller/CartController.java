package controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import interceptor.LoggedInGuard;
import interceptor.NotLoggedInGuard;
import lombok.RequiredArgsConstructor;
import retrofit2.http.Query;
import service.CartService;
import vo.BookVO;
import vo.CartVO;
import vo.PaymentVO;

@Controller
@RequestMapping("/cart")
@RequiredArgsConstructor
public class CartController {
	
	private final CartService cartService;
	
	@LoggedInGuard
	@GetMapping()
	public String viewMyCart(@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo,
							 Model model) {
		int id = Integer.parseInt(loginInfo.get("id"));
		
		List<CartVO> myCart = cartService.viewMyCartList(id);
		model.addAttribute("myCart", myCart);
		
		return "/WEB-INF/views/bookcart.jsp";
	}
	
	@PostMapping()
	@ResponseBody()
	public String insertIntoMyCart(@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo,
									@RequestBody() HashMap<String, Integer> body) {
		
		int id = Integer.parseInt(loginInfo.get("id"));
		int bookId = body.get("bookId");
		System.out.println(bookId);
		String result = cartService.insertIntoMyCart(bookId, id);
			
		return result;
	}
	
	@DeleteMapping()
	@ResponseBody()
	public String deleteFromMyCart(@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo,
									CartVO vo) {
		
		int id = Integer.parseInt(loginInfo.get("id"));
		int bookId = vo.getBookId();
		String result = cartService.deleteFromMyCart(bookId, id);
			
		return result;
	}
	
	@PostMapping("/delete/selected")
	@ResponseBody()
	public String deleteCheckedFromMyCart(@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo, 
											@RequestBody() HashMap<String, int[]> body) {
		
		int id = Integer.parseInt(loginInfo.get("id"));
		int[] bookIdArr = body.get("bookIdArr");
		
		for(int bookId: bookIdArr) {
			cartService.deleteFromMyCart(bookId, id);
		}
		
		return "delete_succeed";
	}
	
	@NotLoggedInGuard
	@GetMapping("/order")
	public String goOrderPage(@Query("bookIdArr") int[] bookIdArr, 
							@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo,
							Model model, HttpServletRequest request) {
		
		int id = Integer.parseInt(loginInfo.get("id"));
		HashMap<String, Object> res = cartService.goOrderPage(bookIdArr, id);
		List<CartVO> orderList = (List<CartVO>) res.get("orderList");
		int totalPrice = (int) res.get("totalPrice");
		String memName = (String) res.get("memName");
		
		HttpSession session = request.getSession();
		session.setAttribute("orderList", orderList);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("memName", memName);
		
		return "/WEB-INF/views/orderpage.jsp";
	}
	
	@LoggedInGuard
	@GetMapping("/order/succeed")
	public String orderSucceed(@Query("amount") int amount, @Query("orderName") String orderName,
								@Query("orderId") String orderId, HttpServletRequest request,
								@SessionAttribute(name = "loginInfo") HashMap<String, String> loginInfo,
								@SessionAttribute(name = "orderList") List<CartVO> orderList,
								Model model) {
		
		int id = Integer.parseInt(loginInfo.get("id"));
		PaymentVO vo = cartService.orderSucceed(orderList, id, orderName, amount);
		
		model.addAttribute("totalPrice", amount);
		model.addAttribute("orderList", orderList);
		
		return "/WEB-INF/views/ordercompletepage.jsp";
	}
}
