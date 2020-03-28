// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterControllerBase, Store {
  final _$emailAtom = Atom(name: '_RegisterControllerBase.email');

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

  final _$senhaAtom = Atom(name: '_RegisterControllerBase.senha');

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

  final _$confirmarSenhaAtom =
      Atom(name: '_RegisterControllerBase.confirmarSenha');

  @override
  String get confirmarSenha {
    _$confirmarSenhaAtom.context.enforceReadPolicy(_$confirmarSenhaAtom);
    _$confirmarSenhaAtom.reportObserved();
    return super.confirmarSenha;
  }

  @override
  set confirmarSenha(String value) {
    _$confirmarSenhaAtom.context.conditionallyRunInAction(() {
      super.confirmarSenha = value;
      _$confirmarSenhaAtom.reportChanged();
    }, _$confirmarSenhaAtom, name: '${_$confirmarSenhaAtom.name}_set');
  }

  final _$salvarAsyncAction = AsyncAction('salvar');

  @override
  Future<bool> salvar() {
    return _$salvarAsyncAction.run(() => super.salvar());
  }

  final _$_RegisterControllerBaseActionController =
      ActionController(name: '_RegisterControllerBase');

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_RegisterControllerBaseActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String value) {
    final _$actionInfo =
        _$_RegisterControllerBaseActionController.startAction();
    try {
      return super.setSenha(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmarSenha(String value) {
    final _$actionInfo =
        _$_RegisterControllerBaseActionController.startAction();
    try {
      return super.setConfirmarSenha(value);
    } finally {
      _$_RegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},confirmarSenha: ${confirmarSenha.toString()}';
    return '{$string}';
  }
}
