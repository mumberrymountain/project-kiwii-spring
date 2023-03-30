package controller;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import exceptionhandler.BusinessException;
import exceptionhandler.ErrorCode;
import interceptor.LoggedInGuard;
import lombok.RequiredArgsConstructor;
import service.IndexService;
import vo.BookVO;
import vo.MemberVO;

@Controller
@RequestMapping("/")
@RequiredArgsConstructor
public class IndexController {
	
	private final IndexService indexService;
	
	@GetMapping("/")
	public String indexPage(Model model) throws NotFoundException, BusinessException {
		
		HashMap<String, List<BookVO>> map = indexService.indexPage();
		model.addAllAttributes(map);
		
		return "WEB-INF/views/index.jsp";
	}
}
