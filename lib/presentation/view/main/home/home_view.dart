import 'package:base_structure/application/common/disposable_widget/disposable_widget.dart';
import 'package:base_structure/application/stores/main/home_store.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';

class HomeView extends StatelessWidget {
  final _store = Inject.instance<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return DisposableWidget(
      store: _store,
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}