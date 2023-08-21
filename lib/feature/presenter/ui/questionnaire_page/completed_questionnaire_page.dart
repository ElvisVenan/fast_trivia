import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../../consts/app_dimens.dart';
import '../../../../consts/app_routes.dart';
import '../../../../consts/app_strings.dart';

import '../../../../../feature/presenter/widgets/buttons_widgets/rounded_edge_button_widget.dart';
import '../../../domain/params/args_params/args_params.dart';
import 'historical_page.dart';

class CompletedQuestionnairePage extends StatelessWidget {
  final ArgsParams? args;

  const CompletedQuestionnairePage({super.key, this.args});

  static const String routePath = AppRoutes.appCompletedQuestionnairePage;

  static void navigate(ArgsParams args) =>
      Modular.to.navigate(routePath, arguments: args);

  static void push(ArgsParams args) =>
      Modular.to.pushNamed(routePath, arguments: args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.resultString,
              style: TextStyle(
                fontSize: AppDimens.fontSizeBigDimension,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: AppDimens.tinyMarginDimension,
            ),
            Text(
              "${args?.firstArgs ?? AppStrings.noHitsString} ${AppStrings.correctString}",
              style: const TextStyle(
                fontSize: AppDimens.fontSizeMiniDimension,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppDimens.defaultMarginDimension),
              child: SizedBox(
                height: 30,
                width: 100,
                child: RoundedEdgeButtonWidget(
                    text: AppStrings.answersString,
                    onPressed: () => HistoricalPage.navigate(
                          ArgsParams(
                              secondArgs: args?.secondArgs ?? [],
                              thirdArgs: args?.thirdArgs ?? []),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
