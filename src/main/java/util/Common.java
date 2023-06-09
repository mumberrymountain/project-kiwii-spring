package util;

public class Common {
	
	public static String VIEW_PATH = "WEB-INF/views/";
	
	public static class Main{
		
		public final static String VIEW_PATH = "WEB-INF/views/";
		
		//한 페이지에 보여줄 게시물 갯수
		public final static int BLOCKLIST = 10;
		
		//페이지 메뉴 수 
		//<- 1 2 3 -> 
		public final static int BLOCKPAGE = 3;
	}
	
	//공지사항 게시판용 
	public static class Notice{
		public final static int BLOCKLIST = 20;
		public final static int BLOCKPAGE = 5;
	}
}
