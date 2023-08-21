import 'package:fast_trivia/feature/data/datasources/questions_datasources/questions_datasources.dart';
import 'package:fast_trivia/feature/data/datasources/questions_datasources/questions_datasources_impl.dart';
import 'package:fast_trivia/feature/domain/repositories/questions_repositories/questions_repositories.dart';
import 'package:fast_trivia/feature/domain/usecases/questions_usecases/get_questions_usecase.dart';
import 'package:fast_trivia/feature/domain/usecases/questions_usecases/get_questions_usecase_impl.dart';
import 'package:fast_trivia/feature/presenter/controllers/questions_controller/questions_controller.dart';
import 'package:fast_trivia/feature/presenter/ui/home_page/home_page.dart';
import 'package:fast_trivia/feature/presenter/ui/questionnaire_page/completed_questionnaire_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'consts/app_routes.dart';

import 'feature/data/repositories/questions_repositories/questions_repositories.dart';
import 'feature/presenter/ui/questionnaire_page/historical_page.dart';
import 'feature/presenter/ui/questionnaire_page/questionnaire_page.dart';
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
    Bind.lazySingleton<QuestionsDataSources>((i) => QuestionsDatasourcesImpl()),
  ];

  List<Bind> get repositoriesBinds => [
    Bind.lazySingleton<QuestionsRepositories>((i) => QuestionsRepositoriesImpl(i())),
  ];

  List<Bind> get usecasesBinds => [
    Bind.lazySingleton<GetQuestionsUsecase>((i) => GetQuestionsUsecaseImpl(i())),
  ];

  final List<Bind> controllersBinds = [
    Bind.factory((i) => QuestionsController()),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(AppRoutes.appDefaultPage, child: (context, args) => const SplashPage()),
    ChildRoute(AppRoutes.appSplashPage, child: (context, args) => const SplashPage()),
    ChildRoute(AppRoutes.appHomePage, child: (context, args) => HomePage(args: args.data,)),
    ChildRoute(AppRoutes.appQuestionnairePage, child: (context, args) => const QuestionnairePage()),
    ChildRoute(AppRoutes.appCompletedQuestionnairePage, child: (context, args) => CompletedQuestionnairePage(args: args.data)),
    ChildRoute(AppRoutes.appHistoricalPage, child: (context, args) => HistoricalPage(args: args.data)),
  ];
}