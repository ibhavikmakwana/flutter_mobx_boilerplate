import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  //Let's generate theme_store.g.dart file using a command.
  @observable
  ThemeMode themeMode = ThemeMode.system;

  @action
  void switchTheme(ThemeMode mode) => themeMode = mode;
}
