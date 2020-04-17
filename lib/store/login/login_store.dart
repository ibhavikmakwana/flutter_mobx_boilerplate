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

import 'package:fluttermobxboilerplate/utility/extensions.dart';
import 'package:fluttermobxboilerplate/utility/preferences_service.dart';
import 'package:fluttermobxboilerplate/utility/utils.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore(this._preferencesService);

  final PreferencesService _preferencesService;

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String emailErrorMessage;

  @observable
  String passwordErrorMessage;

  @observable
  NetworkState networkState = NetworkState.initial;

  @action
  void updateEmail(String text) => email = text;

  @action
  void updatePassword(String text) => password = text;

  @action
  Future<bool> validateAndLogin() async {
    // This method just fakes the login scenario.
    if (email.isEmpty) {
      emailErrorMessage = 'Please enter email.';
    } else if (!email.isValidEmail) {
      emailErrorMessage = 'Please enter valid email.';
    } else if (password.isEmpty) {
      passwordErrorMessage = 'Please enter password.';
    } else if (!password.isValidPassword) {
      passwordErrorMessage = 'Password must be greater then 6 characters.';
    } else {
      emailErrorMessage = null;
      passwordErrorMessage = null;
      networkState = NetworkState.loading;
      await Future.delayed(Duration(milliseconds: 2500));
      _preferencesService.isUserLoggedIn = true;
      networkState = NetworkState.completed;
      return true;
    }
    networkState = NetworkState.error;
    return false;
  }
}
