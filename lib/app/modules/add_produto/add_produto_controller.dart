import 'package:hasura_graphql_postgress/app/modules/add_produto/models/tipo_categoria_produto_dto.dart';
import 'package:hasura_graphql_postgress/app/modules/add_produto/repositories/add_produto_repository.dart';
import 'package:mobx/mobx.dart';

part 'add_produto_controller.g.dart';

class AddProdutoController = _AddProdutoControllerBase
    with _$AddProdutoController;

abstract class _AddProdutoControllerBase with Store {
  final AddProdutoRepository addProdutoRepository;

  _AddProdutoControllerBase(this.addProdutoRepository) {
    addProdutoRepository.getTipoCategoriaProduto().then((data) {
      tipoProduto = data;
    });
  }

  @observable
  TipoCategoriaProdutoDto tipoProduto;

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
  Future<bool> salvar() async {
    if (descricao != null &&
        valor != null &&
        selectedTipo?.id != null &&
        selectedCategoria?.id != null) {
      return await addProdutoRepository.addProduto(
          descricao, valor, selectedTipo.id, selectedCategoria.id);
    }
    return false;
  }
}
