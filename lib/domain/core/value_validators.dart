import 'package:dartz/dartz.dart';
import 'package:latihanddd/domain/core/failures.dart';

import 'validators.dart';

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
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}
