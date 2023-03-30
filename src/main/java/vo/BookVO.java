package vo;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BookVO {
	private int id ;
	private String title;
	private String genre;
	private String subgenre;
	private String image;
	private String author;
	private String publisher;
	private int pbPrice; 
	private int ebPrice;
	private int sellPrice;
	private String publishDate;
	private String fileInfo;
	private int bookToday;
	private String isbn;
	private int sold;
	private String introduce;
	private String authorInfo;
	private String toc;
}
