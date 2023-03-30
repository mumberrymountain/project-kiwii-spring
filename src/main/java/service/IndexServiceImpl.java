package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.javassist.NotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.BookDAO;
import lombok.RequiredArgsConstructor;
import vo.BookVO;

@Service("indexService")
@RequiredArgsConstructor
public class IndexServiceImpl implements IndexService {
	
	
	private final BookDAO bookDAO;

	@Override
	public HashMap<String, List<BookVO>> indexPage() throws NotFoundException {
		
		List<BookVO> bt = bookDAO.selectBookToday();
		List<BookVO> nb = bookDAO.selectNewBook();
		List<BookVO> bs = bookDAO.selectBestSeller();
			
		HashMap<String, List<BookVO>> map = new HashMap<String, List<BookVO>>();
		map.put("nb", nb);
		map.put("bt", bt);
		map.put("bs", bs);
			
		return map;	
	}

}
