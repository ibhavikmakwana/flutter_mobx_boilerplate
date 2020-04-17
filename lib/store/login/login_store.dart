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
