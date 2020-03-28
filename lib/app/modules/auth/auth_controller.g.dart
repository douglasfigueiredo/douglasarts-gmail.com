// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthController on _AuthControllerBase, Store {
  final _$emailAtom = Atom(name: '_AuthControllerBase.email');

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

  final _$senhaAtom = Atom(name: '_AuthControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$emailErrorAtom = Atom(name: '_AuthControllerBase.emailError');

  @override
  String get emailError {
    _$emailErrorAtom.context.enforceReadPolicy(_$emailErrorAtom);
    _$emailErrorAtom.reportObserved();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.context.conditionallyRunInAction(() {
      super.emailError = value;
      _$emailErrorAtom.reportChanged();
    }, _$emailErrorAtom, name: '${_$emailErrorAtom.name}_set');
  }

  final _$senhaErrorAtom = Atom(name: '_AuthControllerBase.senhaError');

  @override
  String get senhaError {
    _$senhaErrorAtom.context.enforceReadPolicy(_$senhaErrorAtom);
    _$senhaErrorAtom.reportObserved();
    return super.senhaError;
  }

  @override
  set senhaError(String value) {
    _$senhaErrorAtom.context.conditionallyRunInAction(() {
      super.senhaError = value;
      _$senhaErrorAtom.reportChanged();
    }, _$senhaErrorAtom, name: '${_$senhaErrorAtom.name}_set');
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future<bool> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$_AuthControllerBaseActionController =
      ActionController(name: '_AuthControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo = _$_AuthControllerBaseActionController.startAction();
    try {
      return super.setSenha(value);
    } finally {
      _$_AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},emailError: ${emailError.toString()},senhaError: ${senhaError.toString()}';
    return '{$string}';
  }
}
