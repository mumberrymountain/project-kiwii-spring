package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BookDAO;
import lombok.RequiredArgsConstructor;
import retrofit2.http.Query;
import service.BookService;
import vo.BookVO;
import vo.CommentVO;
import vo.MemberVO;

@Controller
@RequestMapping("/books")
@RequiredArgsConstructor
public class BooksController {
	
	private final BookService bookService;
	
	@GetMapping()
	public String bookView(@Query(value = "id") int id, Model model) {
		
		HashMap<String, Object> map =  bookService.bookView(id);
		BookVO book = (BookVO) map.get("book");
		
		List<CommentVO> comment = (List<CommentVO>) map.get("comment");
		
		model.addAttribute("book", book);
		model.addAttribute("comment", comment);
		
		return "/WEB-INF/views/bookview.jsp";
	}
	
	
}
