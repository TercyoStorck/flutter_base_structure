import 'package:base_structure/application/common/disposable_widget/disposable_widget.dart';
import 'package:base_structure/application/modules/main_module.dart';
import 'package:base_structure/application/stores/main/login_store.dart';
import 'package:base_structure/infrastructure/resource/internationalization.gen.dart';
import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';

class LoginView extends StatelessWidget {
  final _store = Inject.instance<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return DisposableWidget(
      store: _store,
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: RaisedButton(
            onPressed: () => Navigator.of(context).pushNamed(
              MainModule.routePaths.home,
            ),
            child: Text(
              Intl.login.btnLogin(),
            ),
          ),
        ),
      ),
    );
  }
}
