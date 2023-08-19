import 'package:flutter_modular/flutter_modular.dart';

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

  ];
}