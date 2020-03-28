import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_graphql_postgress/app/modules/home/home_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_controller.dart';
import 'widgets/card_produto/card_produto_widget.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  HomeController controller = HomeModule.to.get();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () async {
                SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                var token = sharedPreferences.setString('token', null);
                Modular.to.pushReplacementNamed('/auth');
              },
            )
          ],
        ),
        body: Observer(
          builder: (_) {
            if (controller.listaProdutos.hasError) {
              return Center(
                  child: Text("Ocorreu um erro ao realizar essa requisição."));
            }
            if (controller.listaProdutos.value == null) {
              return Center(child: CircularProgressIndicator());
            }
            controller.listaProdutos.value.sort((produto1, produto2) => produto1
                .nome
                .toLowerCase()
                .compareTo(produto2.nome.toLowerCase()));
            return ListView.builder(
              itemCount: controller.listaProdutos.value.length,
              itemBuilder: (context, index) {
                return CardProdutoWidget(
                  idProduto: controller.listaProdutos.value[index].id,
                  nomeProduto: controller.listaProdutos.value[index].nome,
                  categoriaProduto: controller
                      .listaProdutos.value[index].categoriaProduto.descricao,
                  tipoProduto: controller
                      .listaProdutos.value[index].tipoProduto.descricao,
                  valor: controller.listaProdutos.value[index].valor.toString(),
                );
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Modular.to.pushNamed('/AddProduto');
          },
        ),
      ),
      onWillPop: () async {
        bool result = false;
        await showDialog(
          context: context,
          child: AlertDialog(
            content: Text("Você deseja mesmo sair?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Sim"),
                onPressed: () {
                  result = true;
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Não"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
        return result;
      },
    );
  }
}
