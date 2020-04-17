// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_LoginStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$emailErrorMessageAtom = Atom(name: '_LoginStore.emailErrorMessage');

  @override
  String get emailErrorMessage {
    _$emailErrorMessageAtom.context.enforceReadPolicy(_$emailErrorMessageAtom);
    _$emailErrorMessageAtom.reportObserved();
    return super.emailErrorMessage;
  }

  @override
  set emailErrorMessage(String value) {
    _$emailErrorMessageAtom.context.conditionallyRunInAction(() {
      super.emailErrorMessage = value;
      _$emailErrorMessageAtom.reportChanged();
    }, _$emailErrorMessageAtom, name: '${_$emailErrorMessageAtom.name}_set');
  }

  final _$passwordErrorMessageAtom =
      Atom(name: '_LoginStore.passwordErrorMessage');

  @override
  String get passwordErrorMessage {
    _$passwordErrorMessageAtom.context
        .enforceReadPolicy(_$passwordErrorMessageAtom);
    _$passwordErrorMessageAtom.reportObserved();
    return super.passwordErrorMessage;
  }

  @override
  set passwordErrorMessage(String value) {
    _$passwordErrorMessageAtom.context.conditionallyRunInAction(() {
      super.passwordErrorMessage = value;
      _$passwordErrorMessageAtom.reportChanged();
    }, _$passwordErrorMessageAtom,
        name: '${_$passwordErrorMessageAtom.name}_set');
  }

  final _$networkStateAtom = Atom(name: '_LoginStore.networkState');

  @override
  NetworkState get networkState {
    _$networkStateAtom.context.enforceReadPolicy(_$networkStateAtom);
    _$networkStateAtom.reportObserved();
    return super.networkState;
  }

  @override
  set networkState(NetworkState value) {
    _$networkStateAtom.context.conditionallyRunInAction(() {
      super.networkState = value;
      _$networkStateAtom.reportChanged();
    }, _$networkStateAtom, name: '${_$networkStateAtom.name}_set');
  }

  final _$validateAndLoginAsyncAction = AsyncAction('validateAndLogin');

  @override
  Future<bool> validateAndLogin() {
    return _$validateAndLoginAsyncAction.run(() => super.validateAndLogin());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  void updateEmail(String text) {
    final _$actionInfo = _$_LoginStoreActionController.startAction();
    try {
      return super.updateEmail(text);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updatePassword(String text) {
    final _$actionInfo = _$_LoginStoreActionController.startAction();
    try {
      return super.updatePassword(text);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},password: ${password.toString()},emailErrorMessage: ${emailErrorMessage.toString()},passwordErrorMessage: ${passwordErrorMessage.toString()},networkState: ${networkState.toString()}';
    return '{$string}';
  }
}
