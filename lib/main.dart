import 'package:flutter/material.dart';
import 'package:moduler_route/moduler_route.dart';
import 'package:internationalization/internationalization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'application/modules/main_module.dart';
import 'infrastructure/resource/application_theme.dart';
import 'infrastructure/resource/internationalization.gen.dart';

void main() => runApp(Application());

class Application extends StatelessWidget with Moduler {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: applicationThemeData,
      supportedLocales: Intl.suportedLocales,
      localizationsDelegates: [
        InternationalizationDelegate(
          translationsPath: Intl.stringsPath,
          suportedLocales: Intl.suportedLocales,
          files: Intl.files,
        ),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: MainModule.routePaths.login,
      onGenerateRoute: routeTo,
      onUnknownRoute: unknownRoute,
      navigatorObservers: [modulerRouteObserver],
    );
  }

  @override
  List<Module> get modules => [
        MainModule(),
      ];

  @override
  List<Injector> get globalInjections => [];
}
