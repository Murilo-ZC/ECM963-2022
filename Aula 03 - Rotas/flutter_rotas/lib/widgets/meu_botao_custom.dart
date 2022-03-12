import 'package:flutter/material.dart';

class MeuBotaoCustom extends StatelessWidget {
  final String textoBotao;

  var comportamento;

  MeuBotaoCustom({this.textoBotao = "Não veio texto", this.comportamento});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: comportamento,
      child: Text(textoBotao),
      style: ElevatedButton.styleFrom(
        primary: Colors.orange[800],
        elevation: 4.0,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }
}
