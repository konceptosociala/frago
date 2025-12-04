import 'package:freezed_annotation/freezed_annotation.dart';

part 'access_token_info.freezed.dart';

@freezed
sealed class AccessTokenInfo with _$AccessTokenInfo {
  const factory AccessTokenInfo.token(String token)         = Token;
  const factory AccessTokenInfo.error(AccessTokenError err) = Error;
}

@freezed
sealed class AccessTokenError with _$AccessTokenError {
  const factory AccessTokenError.authPending()          = AuthPending;
  const factory AccessTokenError.slowDown(int interval) = SlowDown;
  const factory AccessTokenError.expired()              = ExpiredToken;
  const factory AccessTokenError.invalid(String err)    = InvalidError;
}