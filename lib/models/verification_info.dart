import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_info.freezed.dart';

@freezed
abstract class VerificationInfo with _$VerificationInfo {
  const VerificationInfo._();

  const factory VerificationInfo({
    required String deviceCode, 
    required String userCode,
    required String verificationUri,
  }) = _VertificationInfo;
}