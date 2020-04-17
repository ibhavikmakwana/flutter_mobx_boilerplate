import 'package:flutter/material.dart';
import 'package:fluttermobxboilerplate/store/login/login_store.dart';
import 'package:fluttermobxboilerplate/values/imports.dart';
import 'package:fluttermobxboilerplate/values/routes.dart';
import 'package:fluttermobxboilerplate/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _loginStore = Provider.of<LoginStore>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Observer(
              name: 'email_text_field_observer',
              builder: (_) => CustomTextField(
                hintText: Strings.emailHintLabel,
                onChanged: _loginStore.updateEmail,
                errorText: _loginStore.emailErrorMessage,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) => FocusScope.of(context).nextFocus(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Observer(
              name: 'password_text_field_observer',
              builder: (_) => CustomTextField(
                hintText: Strings.passwordHintLabel,
                onChanged: _loginStore.updatePassword,
                obscureText: true,
                textInputAction: TextInputAction.done,
                errorText: _loginStore.passwordErrorMessage,
                onSubmitted: (_) => FocusScope.of(context).unfocus(),
              ),
            ),
          ),
          Observer(
            name: 'login_button_observer',
            builder: (_) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                height: 48.0,
                minWidth: double.maxFinite,
                child: _loginStore.networkState == NetworkState.loading
                    ? CircularProgressIndicator(backgroundColor: Colors.white)
                    : _loginStore.networkState == NetworkState.completed
                        ? Icon(Icons.check)
                        : const Text(
                            Strings.loginText,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                color: Theme.of(context).buttonColor,
                onPressed: () => _loginAndNavigate(_loginStore, context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _loginAndNavigate(LoginStore loginStore, BuildContext context) async {
    final result = await loginStore.validateAndLogin();
    print('result: $result');
    if (result != null && result) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        Routes.home,
        (Route<dynamic> route) => false,
      );
    }
  }
}
