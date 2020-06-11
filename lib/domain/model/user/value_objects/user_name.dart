import 'package:base_structure/domain/model/core/exceptions.dart';
import 'package:base_structure/domain/model/core/value_object.dart';

class UserName extends ValueObject<String> {
  UserName(String value): super(value);

  @override
  void validator() {
    if (super.value == null) {
      throw EmptyValidationException();
    }

    if (super.value.isEmpty) {
      throw EmptyValidationException();
    }
  }
}