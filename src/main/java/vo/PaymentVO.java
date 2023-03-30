package vo;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {
	private int id;
	private int memberId;
	private Date purchasedate;
	private String paymentdetail;
	private int amount;
}
