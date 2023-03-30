package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Service;

import dao.BookDAO;
import lombok.RequiredArgsConstructor;
import vo.BookVO;
import vo.CommentVO;

@Service("bookService")
@RequiredArgsConstructor
public class BookServiceImpl implements BookService {
	private final BookDAO bookDAO;

	@Override
	public HashMap<String, Object> bookView(int id) {
		BookVO book = bookDAO.bookView(id);
		List<CommentVO> comment = bookDAO.commentView(id);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("book", book);
		map.put("comment", comment);
		
		return map;
	}
}
