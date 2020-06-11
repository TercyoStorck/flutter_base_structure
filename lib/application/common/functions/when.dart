import 'package:flutter/foundation.dart';

R when<T, R>({
  @required T condition,
  @required Map<T, ReturnFunc<R>> cases,
  Function elseWhen,
}) {
  if (!cases.containsKey(condition) && elseWhen != null) {
    return elseWhen();
  }

  final function = cases[condition];
  return function();
}

typedef ReturnFunc<T> = T Function();
