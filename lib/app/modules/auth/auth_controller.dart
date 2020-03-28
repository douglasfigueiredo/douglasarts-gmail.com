import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final SharedPreferences shared;

  _AuthControllerBase(this.shared);
  @observable
  String email = "";

  @observable
  String senha = "";

  @action
  void setEmail(String value) => email = value;

  @action
  void setSenha(String value) => senha = value;

  @action
  Future<bool> login() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
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
