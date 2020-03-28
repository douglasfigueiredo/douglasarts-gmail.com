import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardProdutoWidget extends StatelessWidget {
  final String nomeProduto;
  final String categoriaProduto;
  final String tipoProduto;
  final String valor;
  final String idProduto;

  const CardProdutoWidget(
      {Key key,
      @required this.nomeProduto,
      @required this.categoriaProduto,
      @required this.tipoProduto,
      @required this.valor,
      @required this.idProduto})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to.pushNamed("/home/updateProduto/$idProduto");
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                nomeProduto,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                categoriaProduto,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      tipoProduto,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Text(
                    "R\$ ${double.parse(valor).toStringAsFixed(2).replaceAll(".", ",")}",
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
