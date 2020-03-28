import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_graphql_postgress/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:hasura_graphql_postgress/app/modules/home/home_module.dart';
import 'package:hasura_graphql_postgress/app/shared/widgets/custom_combobox/custom_combobox_widget.dart';
import 'package:hasura_graphql_postgress/app/shared/widgets/label/label_widget.dart';
import 'update_produto_controller.dart';

class UpdateProdutoPage extends StatefulWidget {
  final String id;

  const UpdateProdutoPage({Key key, @required this.id}) : super(key: key);

  @override
  _UpdateProdutoPageState createState() => _UpdateProdutoPageState();
}

class _UpdateProdutoPageState extends State<UpdateProdutoPage> {
  UpdateProdutoController controller;
  @override
  void initState() {
    controller = HomeModule.to.get<UpdateProdutoController>({"id": widget.id});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Produto"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            LabelWidget(title: "Descrição:"),
            TextField(
              onChanged: controller.setDescricao,
              controller: controller.descricaoController,
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
            LabelWidget(title: "Categoria do Produto:"),
            Observer(
              builder: (_) {
                if (controller.updatedProduto != null)
                  return CustomComboboxWidget(
                    items: controller.updatedProduto.categoriaProduto
                        .map(
                          (data) => Model(data.id, data.descricao),
                        )
                        .toList(),
                    onChange: (item) => controller.setSelectedCategoria(
                      TipoECategoriaDto(id: item.id, descricao: item.descricao),
                    ),
                    itemSelecionado: controller.selectedCategoria == null
                        ? null
                        : Model(
                            controller.selectedCategoria.id,
                            controller.selectedCategoria.descricao,
                          ),
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
                if (controller.updatedProduto != null)
                  return CustomComboboxWidget(
                    items: controller.updatedProduto.tipoProduto
                        .map(
                          (data) => Model(data.id, data.descricao),
                        )
                        .toList(),
                    onChange: (item) => controller.setSelectedTipo(
                      TipoECategoriaDto(id: item.id, descricao: item.descricao),
                    ),
                    itemSelecionado: controller.selectedTipo == null
                        ? null
                        : Model(
                            controller.selectedTipo.id,
                            controller.selectedTipo.descricao,
                          ),
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
            LabelWidget(title: "Preço:"),
            TextField(
              onChanged: controller.setValor,
              controller: controller.valorController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
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
                  var result = await controller.update();
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
