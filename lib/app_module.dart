import 'package:flutter_modular/flutter_modular.dart';

import 'consts/app_routes.dart';

import 'feature/presenter/ui/home_page/home_page.dart';
import 'feature/presenter/ui/splash_page/splash_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
    ...datasourcesBinds,
    ...repositoriesBinds,
    ...usecasesBinds,
    ...controllersBinds,
  ];

  List<Bind> get datasourcesBinds => [

  ];

  List<Bind> get repositoriesBinds => [

  ];

  List<Bind> get usecasesBinds => [

  ];

  final List<Bind> controllersBinds = [

  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(AppRoutes.appDefaultPage, child: (context, args) => const SplashPage()),
    ChildRoute(AppRoutes.appSplashPage, child: (context, args) => const SplashPage()),
    ChildRoute(AppRoutes.appHomePage, child: (context, args) => const HomePage()),
  ];
}