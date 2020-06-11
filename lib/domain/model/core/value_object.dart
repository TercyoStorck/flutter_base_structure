import 'package:flutter/foundation.dart';

abstract class ValueObject<T> {
  final T _value;

  ValueObject(this._value) {
    this.validator();
  }

  @protected
  void validator();

  T get value => _value;
}