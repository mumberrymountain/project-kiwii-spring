package vo;

import lombok.Data;

@Data
public class MemberVO {
	private int id;
	private String memId;
	private String memPwd;
	private String memName;
	private String memEmail;
	private String memCellNum;
	private String memGender;
	private String memBirth;
}
