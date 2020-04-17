import 'package:fluttermobxboilerplate/values/imports.dart';

import 'route_generator.dart';
import 'store/theme/theme_store.dart';
import 'utility/preferences_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (BuildContext context) => ThemeStore(),
        ),
        Provider(
          create: (BuildContext context) => PreferencesService(),
        ),
      ],
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
        title: Strings.appName,
        theme: ThemeData(primarySwatch: BaseColors.colorBlue),
        darkTheme: ThemeData.dark(),
        themeMode: Provider.of<ThemeStore>(context).themeMode,
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
