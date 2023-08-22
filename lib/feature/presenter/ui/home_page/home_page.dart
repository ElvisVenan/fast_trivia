import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_dimens.dart';
import '../../../../consts/app_routes.dart';
import '../../../../consts/app_strings.dart';

import '../../../../feature/presenter/controllers/questions_database_controller/questions_database_controller.dart';
import '../../../../feature/presenter/ui/questionnaire_page/historical_page.dart';
import '../../../../feature/presenter/ui/questionnaire_page/questionnaire_page.dart';
import '../../../../feature/presenter/widgets/text_widgets/title_and_subtitle_widget.dart';
import '../../../../feature/domain/params/args_params/args_params.dart';
import '../../widgets/buttons_widgets/rounded_edge_button_widget.dart';
import '../../widgets/containers_widgets/card_with_icon_widget.dart';

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
    final getQuestionsController = Modular.get<QuestionsDatabaseController>();
    getQuestionsController.getQuestionnairesFromDatabase();

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
            child: Observer(builder: (context) {
              return Column(
                children: [
                  const TitleAndSubtitleWidget(
                    title: AppStrings.historicalString,
                    subtitle: AppStrings.seeQuestionsString,
                  ),
                  getQuestionsController.questionnaire!.isNotEmpty
                      ? Align(
                          alignment: Alignment.topCenter,
                          child: SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.3,
                            width: MediaQuery.sizeOf(context).width * 0.9,
                            child: ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return
                                    Observer(
                                      builder: (context) {
                                        return CardWithIconWidget(
                                          onPressed: () => HistoricalPage.navigate(
                                              const ArgsParams()),
                                          title: getQuestionsController
                                              .questionnaire?[0].title ??
                                              "",
                                        );
                                      }
                                    );
                                }),
                          ),
                        )
                      : const Text(AppStrings.noQuestionsString),
                  RoundedEdgeButtonWidget(
                    text: AppStrings.newQuestionnaireString,
                    onPressed: () {
                      QuestionnairePage.navigate(const ArgsParams());
                    },
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
