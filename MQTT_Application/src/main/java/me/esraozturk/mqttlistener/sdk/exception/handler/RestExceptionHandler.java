package me.esraozturk.mqttlistener.sdk.exception.handler;

import me.esraozturk.mqttlistener.sdk.api.Error;
import me.esraozturk.mqttlistener.sdk.api.ApiResponse;
import me.esraozturk.mqttlistener.sdk.api.ErrorCode;
import me.esraozturk.mqttlistener.sdk.api.SubError;
import me.esraozturk.mqttlistener.sdk.exception.*;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.support.MethodArgumentNotValidException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.List;
import java.util.stream.Collectors;


@RestControllerAdvice
public class RestExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public ResponseEntity<ApiResponse<Void>> handleMethodArgumentNotValid(MethodArgumentNotValidException exception) {
        List<SubError> subErrors = exception.getBindingResult().getFieldErrors().stream().map(fieldError -> new SubError(fieldError.getField(), fieldError.getDefaultMessage())).collect(Collectors.toList());
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.INVALID_METHOD_ARGUMENT, subErrors)));
    }

    @ExceptionHandler(EntityNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleEntityNotFound(EntityNotFoundException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.ENTITY_NOT_FOUND, exception.getMessage())));
    }

    @ExceptionHandler(DuplicateFieldException.class)
    public ResponseEntity<ApiResponse<Void>> handleDuplicateField(DuplicateFieldException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.DUPLICATE_FIELD, exception.getMessage())));
    }

    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleUserNotFound(UserNotFoundException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.USER_NOT_FOUND, exception.getMessage())));
    }

    @ExceptionHandler(InvalidRefreshTokenException.class)
    public ResponseEntity<ApiResponse<Void>> handleInvalidRefreshToken(InvalidRefreshTokenException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.INVALID_REFRESH_TOKEN, exception.getMessage())));
    }

    @ExceptionHandler(InvalidPasswordResetTokenException.class)
    public ResponseEntity<ApiResponse<Void>> handleInvalidPasswordResetToken(InvalidPasswordResetTokenException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.INVALID_PASSWORD_RESET_TOKEN, exception.getMessage())));
    }

    @ExceptionHandler(HttpMediaTypeNotSupportedException.class)
    public ResponseEntity<ApiResponse<Void>> handleHttpMediaTypeNotSupported(HttpMediaTypeNotSupportedException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.MEDIA_TYPE_NOT_SUPPORTED, exception.getMessage())));
    }

    @ExceptionHandler(RequestedMediaNotFoundException.class)
    public ResponseEntity<ApiResponse<Void>> handleRequestedMediaNotFound(RequestedMediaNotFoundException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.REQUESTED_MEDIA_NOT_FOUND, exception.getMessage())));
    }

    @ExceptionHandler(PlatformNotAllowedException.class)
    public ResponseEntity<ApiResponse<Void>> handlePlatformNotAllowed(PlatformNotAllowedException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.PLATFORM_NOT_ALLOWED, exception.getMessage())));
    }

    @ExceptionHandler(EntityUsedException.class)
    public ResponseEntity<ApiResponse<Void>> handleEntityUsed(EntityUsedException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.ENTITY_USED, exception.getMessage())));
    }

    @ExceptionHandler(EmailCannotBeSendException.class)
    public ResponseEntity<ApiResponse<Void>> handleEmailCannotBeSend(EmailCannotBeSendException exception) {
        return ResponseEntity.status(HttpStatus.OK).body(new ApiResponse<>(new Error(ErrorCode.EMAIL_CANNOT_BE_SEND, exception.getMessage())));
    }

}
