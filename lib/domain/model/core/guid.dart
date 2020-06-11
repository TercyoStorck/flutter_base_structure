import 'package:uuid/uuid.dart';

import 'exceptions.dart';
import 'value_object.dart';

class Guid extends ValueObject<String> {
  Guid(String value): super(value);

  factory Guid.generate() {
    final guid = Uuid().v1();
    return Guid(guid);
  }

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