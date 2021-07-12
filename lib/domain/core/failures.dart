import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.shortFullName({
    required String failedValue,
  }) = ShortFullName<T>;
  const factory ValueFailure.passwordNotSame({
    required String failedValue,
  }) = PasswordNotSame<T>;
}
