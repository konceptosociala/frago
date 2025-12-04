import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_info.freezed.dart';

@freezed
abstract class VertificationInfo with _$VertificationInfo {
  const VertificationInfo._();

  const factory VertificationInfo({
    required String deviceCode, 
    required String userCode,
    required String verificationUri,
  }) = _VertificationInfo;
}