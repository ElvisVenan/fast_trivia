import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

import 'package:fast_trivia/app_module.dart';
import 'app_widget.dart';

void main() async {
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );

  await Modular.isModuleReady<AppModule>();
}

