package controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import service.MembersService;

public class MemberControllerTest {
	
	@Autowired
	MembersService membersService;
	
	@Autowired
	HttpServletRequest request;
	
	@Test
	public void checkPhoneCertifyNumberTest() {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("phoneNumCertify", "1111");
		
		MembersController controller = new MembersController(membersService);
		
		String res = controller.checkPhoneCertifyNumber(request, map);
		System.out.println(res);
	}

}
