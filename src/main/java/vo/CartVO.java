package vo;

import lombok.Data;

@Data
public class CartVO {
    private int id;
    private int memberId;
    private int bookId;
    private String image;
    private String title;
    private String author;
    private int sellprice;
}
