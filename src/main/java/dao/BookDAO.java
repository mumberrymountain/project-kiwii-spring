package dao;

import java.util.List;

import org.apache.ibatis.javassist.NotFoundException;

import vo.BookVO;
import vo.CommentVO;

public interface BookDAO {
	
	public List<BookVO> selectBookToday() throws NotFoundException;
	
	public List<BookVO> selectNewBook() throws NotFoundException;
	
	public List<BookVO> selectBestSeller() throws NotFoundException;
	
	public int bookCount(int id);
	
	public BookVO bookView(int id);
	
	public List<CommentVO> commentView(int id);
}
