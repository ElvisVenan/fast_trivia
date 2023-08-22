import 'package:fast_trivia/feature/presenter/controllers/questions_database_controller/questions_database_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_colors.dart';
import '../../../../consts/app_routes.dart';
import '../../../../consts/app_dimens.dart';
import '../../../../consts/app_strings.dart';

import '../../../../feature/domain/params/args_params/args_params.dart';
import '../../../../feature/presenter/ui/questionnaire_page/completed_questionnaire_page.dart';
import '../../../../feature/presenter/controllers/questions_controller/questions_controller.dart';

import '../../widgets/app_bar_widgets/app_bar_of_color_dark_blue_widget.dart';
import '../../widgets/buttons_widgets/rounded_edge_button_widget.dart';
import '../../widgets/containers_widgets/container_with_rounded_edges_widget.dart';
import '../../widgets/containers_widgets/white_card_with_borders_widget.dart';
import '../../widgets/text_widgets/title_and_subtitle_widget.dart';

class QuestionnairePage extends StatelessWidget {
  const QuestionnairePage({super.key});

  static const String routePath = AppRoutes.appQuestionnairePage;

  static void navigate(ArgsParams args) => Modular.to.navigate(routePath);

  @override
  Widget build(BuildContext context) {
    final questionsDatabaseController = Modular.get<QuestionsDatabaseController>();
    final questionsController = Modular.get<QuestionsController>();
    questionsController.getQuestions();
    return Scaffold(
      appBar: const AppBarOfColorDarkBlueWidget(
        title: AppStrings.questionnairesString,
      ),
      body: ContainerWithRoundedEdgesWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: AppDimens.bigMarginDimension,
            ),
            Observer(builder: (context) {
              return TitleAndSubtitleWidget(
                title: questionsController
                    .questions[questionsController.changeQuestionInt].title,
                subtitle: questionsController
                    .questions[questionsController.changeQuestionInt].question,
              );
            }),
            Observer(builder: (context) {
              return Expanded(
                child: ListView.builder(
                    itemCount: questionsController.options.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          questionsController.getSelectedIndex(i);
                          questionsController.userResponse = i;
                        },
                        child: Observer(builder: (context) {
                          return WhiteCardWithBordersWidget(
                            color: i == questionsController.selectedIndex
                                ? AppColors.lightGray
                                : null,
                            text: questionsController
                                .questions[questionsController
                                .changeQuestionInt]
                                .options[i]
                                .title,

                          );
                        }),
                      );
                    }),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(AppDimens.smallMarginDimension),
              child: Observer(
                builder: (context) {
                  return Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: questionsController.selectedIndex != -1 ? RoundedEdgeButtonWidget(
                      text: AppStrings.confirmString,
                      onPressed: () async {
                        questionsController.changeQuestionList
                            .add(questionsController.selectedIndex + 1);
                        questionsController.selectedIndex = -1;
                        questionsController.changeQuestion();
                        questionsController.calculateCorrectAnswers();
                        if (questionsController.idx >=
                            questionsController.questions.length) {
                          await questionsController.getQuestions();
                          CompletedQuestionnairePage.navigate(ArgsParams(
                              correctAnswersCount: questionsController.correctAnswers,
                              selectedQuestions:
                              questionsController.changeQuestionList,
                              correctQuestions:
                              questionsController.questions));
                          await questionsDatabaseController.saveQuestions(questionsController.questionnaire!);
                        }
                      },
                    ) : const SizedBox(),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
