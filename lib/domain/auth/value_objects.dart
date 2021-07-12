import 'package:dartz/dartz.dart';
import 'package:latihanddd/domain/core/failures.dart';
import 'package:latihanddd/domain/core/value_objects.dart';
import 'package:latihanddd/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(
      validateEmailAddress(input),
    );
  }

  const EmailAddress._(this.value);
}

class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(
      validatePassword(input),
    );
  }

  const Password._(this.value);
}

class RetypePassword extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory RetypePassword(String input, String previous) {
    return RetypePassword._(
      validateRetypePassword(input, previous),
    );
  }

  const RetypePassword._(this.value);
}

class FullName extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory FullName(String input) {
    return FullName._(
      validateFullName(input),
    );
  }

  const FullName._(this.value);
}
