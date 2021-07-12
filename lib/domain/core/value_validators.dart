import 'package:dartz/dartz.dart';
import 'package:latihanddd/domain/core/failures.dart';

import 'validators.dart';

Either<ValueFailure<String>, String> validateFullName(String input) {
  if (input.length > 2) {
    return right(input);
  } else {
    return left(ValueFailure.shortFullName(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  if (Validators.isValidEmail(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (Validators.isValidPassword(input)) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateRetypePassword(
    String input, String previous) {
  if (input == previous) {
    return right(input);
  } else {
    return left(ValueFailure.passwordNotSame(failedValue: input));
  }
}
