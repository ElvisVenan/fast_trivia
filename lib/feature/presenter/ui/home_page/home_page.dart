import 'package:fast_trivia/feature/presenter/controllers/questions_controller/questions_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String routePath = AppRoutes.appHomePage;

  static void navigate() => Modular.to.navigate(routePath);

  @override
  Widget build(BuildContext context) {
    final getQuestions = Modular.get<QuestionsController>();
    getQuestions.getQuestions();

    return Scaffold(
      backgroundColor: AppColors.lightGray,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
      ),
      body: Center(
        child: Observer(
          builder: (context) {
            return Text(getQuestions.question, style: TextStyle(color: Colors.black),);
          }
        ),
      ),
    );
  }
}
