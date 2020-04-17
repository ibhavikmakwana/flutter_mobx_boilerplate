/*
 * BSD 2-Clause License
 *
 * Copyright (c) 2020, Bhavik Makwana
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

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
