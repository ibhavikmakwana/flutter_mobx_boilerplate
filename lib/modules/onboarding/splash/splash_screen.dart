import 'package:flutter/material.dart';
import 'package:fluttermobxboilerplate/utility/preferences_service.dart';
import 'package:fluttermobxboilerplate/values/routes.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initFlow();
  }

  _initFlow() async {
    final prefService = Provider.of<PreferencesService>(context);
    //Adding some delay as User don't like to see `MainScreen` without some processing.
    await Future.delayed(Duration(milliseconds: 2000), () {
      if (prefService.isUserLoggedIn)
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.home,
          (Route<dynamic> route) => false,
        );
      else
        Navigator.of(context).pushNamedAndRemoveUntil(
          Routes.login,
          (Route<dynamic> route) => false,
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.blue);
  }
}
