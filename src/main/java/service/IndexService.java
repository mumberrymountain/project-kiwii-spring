package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.javassist.NotFoundException;

import vo.BookVO;

public interface IndexService {
	
	public HashMap<String, List<BookVO>> indexPage() throws NotFoundException;
}
