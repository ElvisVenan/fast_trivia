import 'package:fast_trivia/feature/presenter/ui/questionnaire_page/questionnaire_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_dimens.dart';
import '../../../../consts/app_routes.dart';

import '../../../../consts/app_strings.dart';
import '../../../../feature/domain/params/args_params/args_params.dart';
import '../../../../feature/presenter/controllers/questions_controller/questions_controller.dart';
import '../../widgets/buttons_widgets/rounded_edge_button_widget.dart';

class HomePage extends StatelessWidget {
  final ArgsParams? args;

  const HomePage({super.key, this.args});

  static const String routePath = AppRoutes.appHomePage;

  static void navigate(ArgsParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static void push(ArgsParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  @override
  Widget build(BuildContext context) {
    final getQuestions = Modular.get<QuestionsController>();
    getQuestions.getQuestions();
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
      ),
      body: Align(
        alignment: Alignment.bottomCenter,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(AppDimens.ampleMarginDimension),
            topRight: Radius.circular(AppDimens.ampleMarginDimension),
          ),
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.8,
            width: double.infinity,
            color: AppColors.pureWhiteColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedEdgeButtonWidget(
                  text: AppStrings.newQuestionnaireString,
                  onPressed: () {
                    QuestionnairePage.navigate(const ArgsParams());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
