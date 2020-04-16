import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttermobxboilerplate/values/base_colors.dart';
import 'package:provider/provider.dart';

import 'modules/home/home_screen.dart';
import 'store/theme/theme_store.dart';

void main() {
  runApp(
    Provider(
      create: (BuildContext context) => ThemeStore(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      name: 'theme_store_observer',
      builder: (BuildContext context) => MaterialApp(
        title: 'Flutter MobX Boilerplate',
        theme: ThemeData(primarySwatch: BaseColors.colorBlue),
        darkTheme: ThemeData.dark(),
        themeMode: Provider.of<ThemeStore>(context).themeMode,
        home: HomeScreen(),
      ),
    );
  }
}
