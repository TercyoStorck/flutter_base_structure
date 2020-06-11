import 'package:base_structure/application/stores/main/home_store.dart';
import 'package:base_structure/application/stores/main/login_store.dart';
import 'package:base_structure/presentation/view/main/home/home_view.dart';
import 'package:base_structure/presentation/view/main/login/login_view.dart';
import 'package:moduler_route/moduler_route.dart';

final String _modulePath = "main";

class MainModule extends Module {
  static final routePaths = _Routes();

  @override
  String get path => _modulePath;

  @override
  List<ModuleRoute> get routes => [
        ModuleRoute(
          path: routePaths._login,
          builder: (_) => LoginView(),
        ),
        ModuleRoute(
          path: routePaths._home,
          builder: (_) => HomeView(),
        ),
      ];

  @override
  List<Injector> get injections => [
        // Stores
        Injector<LoginStore>(
          inject: (_) => LoginStore(),
        ),
        Injector<HomeStore>(
          inject: (_) => HomeStore(),
        ),
      ];
}

class _Routes {
  String _login = "login";
  String _home = "home";

  String get login => "$_modulePath/$_login";
  String get home => "$_modulePath/$_home";
}
