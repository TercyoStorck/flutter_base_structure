import 'package:flutter/widgets.dart';

import 'disposable_store.dart';

class DisposableWidget extends StatefulWidget {
  final DisposableStore _store;
  final Widget _child;

  DisposableWidget({
    @required DisposableStore store,
    @required Widget child,
  })  : _store = store,
        _child = child;

  @override
  _DisposableWidgetState createState() => _DisposableWidgetState();
}

class _DisposableWidgetState extends State<DisposableWidget> {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void dispose() {
    widget._store.dispose();
    super.dispose();
  }
}
