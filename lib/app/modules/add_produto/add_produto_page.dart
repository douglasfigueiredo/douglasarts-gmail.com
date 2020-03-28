import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_graphql_postgress/app/modules/add_produto/add_produto_module.dart';
import 'package:hasura_graphql_postgress/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:hasura_graphql_postgress/app/shared/widgets/custom_combobox/custom_combobox_widget.dart';
import 'package:hasura_graphql_postgress/app/shared/widgets/label/label_widget.dart';

import 'add_produto_controller.dart';

class AddProdutoPage extends StatefulWidget {
  final String title;
  const AddProdutoPage({Key key, this.title = "Adicionar Produto"})
      : super(key: key);

  @override
  _AddProdutoPageState createState() => _AddProdutoPageState();
}

class _AddProdutoPageState
    extends ModularState<AddProdutoPage, AddProdutoController> {
  AddProdutoController controller = AddProdutoModule.to.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LabelWidget(title: "Descrição:"),
            TextField(
              onChanged: controller.setDescricao,
              decoration: InputDecoration(
                hintText: "Descrição do produto",
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            LabelWidget(title: "Valor:"),
            TextField(
              onChanged: controller.setValor,
              // keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: "valor",
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            LabelWidget(title: "Categoria do Produto:"),
            Observer(
              builder: (_) {
                if (controller.tipoProduto != null)
                  return CustomComboboxWidget(
                    items: controller.tipoProduto.categoriaProduto
                        .map(
                          (data) => Model(data.id, data.descricao),
                        )
                        .toList(),
                    onChange: (item) => controller.setSelectedCategoria(
                      TipoECategoriaDto(id: item.id, descricao: item.descricao),
                    ),
                    itemSelecionado: null,
                  );

                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            LabelWidget(title: "Tipo do Produto:"),
            Observer(
              builder: (_) {
                if (controller.tipoProduto != null)
                  return CustomComboboxWidget(
                    items: controller.tipoProduto.tipoProduto
                        .map(
                          (data) => Model(data.id, data.descricao),
                        )
                        .toList(),
                    onChange: (item) => controller.setSelectedTipo(
                      TipoECategoriaDto(id: item.id, descricao: item.descricao),
                    ),
                    itemSelecionado: null,
                  );

                return Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      width: 2,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Salvar",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () async {
                  var result = await controller.salvar();
                  if (result) {
                    Modular.to.pop();
                  } else {
                    showDialog(
                      context: context,
                      child: AlertDialog(
                        content: Text("Erro ao tentar salvar o produto!"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Fechar"),
                            onPressed: () {
                              Modular.to.pop();
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
