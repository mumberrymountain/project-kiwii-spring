package exceptionhandler;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ErrorResponse {
	 private final Boolean success;
	 private final int status;
	 private final String message;
}
