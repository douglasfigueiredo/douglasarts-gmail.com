import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final SharedPreferences shared;

  _RegisterControllerBase(this.shared);

  @observable
  String email = "";

  @observable
  String senha = "";

  @observable
  String confirmarSenha = "";

  @action
  void setEmail(String value) => email = value;

  @action
  void setSenha(String value) => senha = value;

  @action
  void setConfirmarSenha(String value) => confirmarSenha = value;

  @action
  Future<bool> salvar() async {
    if (senha != confirmarSenha) {
      return false;
    }
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
      email: email,
      password: senha,
    ))
        .user;

    var tokenId = await user.getIdToken();
    var valid = tokenId != null;

    if (valid) {
      shared.setString("token", tokenId.token);
    }
    return valid;
  }
}
