package dao;

import java.util.List;

import org.apache.ibatis.javassist.NotFoundException;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import service.IndexService;
import vo.BookVO;
import vo.CommentVO;

@Repository("bookDAO")
@RequiredArgsConstructor
public class BookDAOImpl implements BookDAO {
	
	
	private final SqlSession sqlSession;

	@Override
	public List<BookVO> selectBookToday() throws NotFoundException{
		List<BookVO> vo = sqlSession.selectList("b.bookToday");
		if(vo.isEmpty()) throw new NotFoundException("오늘의 책 데이터가 Null입니다.");
		return vo;
	}

	@Override
	public List<BookVO> selectNewBook() throws NotFoundException{
		List<BookVO> vo = sqlSession.selectList("b.newBook");
		if(vo.isEmpty()) throw new NotFoundException("신간 데이터가 Null입니다.");
		return vo;
	}

	@Override
	public List<BookVO> selectBestSeller() throws NotFoundException {
		List<BookVO> vo = sqlSession.selectList("b.bestSeller"); 
		if(vo.isEmpty()) throw new NotFoundException("베스트셀러 데이터가 Null입니다.");
		return vo;
	}

	@Override
	public int bookCount(int id) {
		int bookCount =  sqlSession.selectOne("b.bookCount", id);
		return bookCount;
	}

	@Override
	public BookVO bookView(int id) {
		BookVO book = sqlSession.selectOne("b.bookView", id);
		return book;
	}

	@Override
	public List<CommentVO> commentView(int id) {
		List<CommentVO> comment = sqlSession.selectList("b.commentView", id);
		return comment;
	}

}
