package exceptionhandler;

public enum ErrorCode {

	BAD_REQUEST(400, "COMMON-001", "클라이언트의 요청이 잘못된 경우"),
	INVALID_INPUT_VALUE(400, "COMMON-002", "유효성 검증에 실패한 경우"),
    INTERNAL_SERVER_ERROR(500, "COMMON-003", "서버에서 처리할 수 없는 경우"),
    DUPLICATE_LOGIN_ID(400, "ACCOUNT-001", "계정명이 중복된 경우"),
    UNAUTHORIZED(401, "ACCOUNT-002", "인증에 실패한 경우"),
    ACCOUNT_NOT_FOUND(404, "ACCOUNT-003", "계정을 찾을 수 없는 경우"),
    FORBIDDEN(403, "ACCOUNT-004", "권한이 부족한 경우"),
    TOKEN_NOT_EXISTS(404, "ACCOUNT-005", "해당 key의 인증 토큰이 존재하지 않는 경우");

    private final int status;
    private final String code;
    private final String message;

    ErrorCode(int status, String code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }

	public int getStatus() {
		return status;
	}

	public String getCode() {
		return code;
	}

	public String getMessage() {
		return message;
	}
}
