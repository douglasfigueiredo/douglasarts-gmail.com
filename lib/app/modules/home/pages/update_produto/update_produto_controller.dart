import 'package:flutter/material.dart';
import 'package:hasura_graphql_postgress/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:hasura_graphql_postgress/app/modules/home/models/produto_tipo_categoria_produto_dto.dart';
import 'package:hasura_graphql_postgress/app/modules/home/repositories/update_produto_repository.dart';
import 'package:mobx/mobx.dart';

part 'update_produto_controller.g.dart';

class UpdateProdutoController = _UpdateProdutoControllerBase
    with _$UpdateProdutoController;

abstract class _UpdateProdutoControllerBase with Store {
  final UpdateProdutoRepository updateProdutoRepository;

  final String idProduto;

  _UpdateProdutoControllerBase(this.updateProdutoRepository, this.idProduto) {
    updateProdutoRepository
        .getProdutoTipoCategoriaProduto(idProduto)
        .then((data) {
      updatedProduto = data;
      valor = updatedProduto.produto.valor.toString();
      descricao = updatedProduto.produto.nome;
      selectedCategoria = updatedProduto.produto.categoriaProduto;
      selectedTipo = updatedProduto.produto.tipoProduto;
      descricaoController.text = descricao;
      valorController.text = valor;
    });
  }

  var descricaoController = TextEditingController();
  var valorController = TextEditingController();

  @observable
  ProdutoTipoCategoriaProdutoDto updatedProduto;

  @observable
  String descricao = "";
  @action
  setDescricao(String value) => descricao = value;

  @observable
  String valor = "";
  @action
  setValor(String value) => valor = value;

  @observable
  TipoECategoriaDto selectedTipo;
  @action
  setSelectedTipo(TipoECategoriaDto value) => selectedTipo = value;

  @observable
  TipoECategoriaDto selectedCategoria;
  @action
  setSelectedCategoria(TipoECategoriaDto value) => selectedCategoria = value;

  @action
  Future<bool> update() async {
    if (descricao != null &&
        valor != null &&
        selectedTipo?.id != null &&
        selectedCategoria?.id != null) {
      return await updateProdutoRepository.updateProduto(
        idProduto: idProduto,
        descricao: descricao,
        valor: valor,
        selectedTipo: selectedTipo.id,
        selectedCategoria: selectedCategoria.id,
      );
    }
    return false;
  }
}
