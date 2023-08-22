import 'package:flutter/material.dart';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_dimens.dart';
import '../../../../consts/app_routes.dart';
import '../../../../consts/app_strings.dart';

import '../../../../../feature/presenter/controllers/questions_database_controller/questions_database_controller.dart';
import '../../../../../feature/domain/params/args_params/args_params.dart';
import '../../../../../feature/presenter/ui/home_page/home_page.dart';
import '../../widgets/buttons_widgets/circular_button_with_icon_widget.dart';
import '../../widgets/app_bar_widgets/app_bar_of_color_dark_blue_widget.dart';
import '../../widgets/containers_widgets/container_with_rounded_edges_widget.dart';
import '../../widgets/containers_widgets/white_card_with_borders_widget.dart';
import '../../widgets/buttons_widgets/rounded_edge_button_widget.dart';
import '../../widgets/text_widgets/title_and_subtitle_widget.dart';

class HistoricalPage extends StatelessWidget {
  final ArgsParams? args;

  const HistoricalPage({super.key, this.args});

  static const String routePath = AppRoutes.appHistoricalPage;

  static void navigate(ArgsParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  @override
  Widget build(BuildContext context) {
    final questionsDatabaseController = Modular.get<QuestionsDatabaseController>();
    questionsDatabaseController.getQuestionsFromDatabase();
    questionsDatabaseController.getOptionsFromDatabase();

    return Scaffold(
      appBar: const AppBarOfColorDarkBlueWidget(
        title: AppStrings.historicalString,
      ),
      body: ContainerWithRoundedEdgesWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Observer(builder: (context) {
              return TitleAndSubtitleWidget(
                title: questionsDatabaseController.questionnaires?[questionsDatabaseController.changeQuestionInt].title ?? "",
                subtitle: questionsDatabaseController
                    .questionnaires?[questionsDatabaseController.changeQuestionInt].question ?? "",
              );
            }),
            Observer(builder: (context) {
              return Expanded(
                child: ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, i) {
                      return Observer(builder: (context) {
                        return WhiteCardWithBordersWidget(
                          color: _selectColorsForCorrectAndIncorrectAnswers(
                              i, questionsDatabaseController.changeQuestionInt),
                          text: questionsDatabaseController.questionnaires?[questionsDatabaseController.changeQuestionInt].options[i].title
                              ?? "",
                        );
                      });
                    }),
              );
            }),
            Padding(
              padding: const EdgeInsets.all(AppDimens.smallMarginDimension),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircularButtonWithIconWidget(
                      icon: Icons.home,
                      onPressed: () => HomePage.navigate(const ArgsParams()),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.all(AppDimens.smallMarginDimension),
                      child: Observer(builder: (context) {
                        return Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: RoundedEdgeButtonWidget(
                              text: AppStrings.answersString,
                              onPressed: () async {
                                questionsDatabaseController.changeQuestion();
                              },
                            ));
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color? _selectColorsForCorrectAndIncorrectAnswers(i, select) {
    if (i == args!.correctQuestions![select].answer - 1) {
      return Colors.green;
    }
    if (i + 1 == args?.selectedQuestions![select]) {
      return Colors.red;
    } else {
      return null;
    }
  }
}
