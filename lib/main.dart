import 'package:flutter/material.dart';
import 'package:hasura_graphql_postgress/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var shared = await SharedPreferences.getInstance();
  runApp(ModularApp(module: AppModule(shared)));
}
