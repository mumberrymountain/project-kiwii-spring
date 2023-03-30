package vo;

import java.util.Date;

import lombok.Data;

@Data
public class CommentVO {
	private int id;
	private int bookId;
	private int reply;
	private String commenterId;
	private Date commentedDate;
	private int rating;
	private int likeCount;
	private int spoiler;
	private String content;
	private int ref;
}
