import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TerceiraTela extends StatefulWidget {
  final String textoEnviado;
  const TerceiraTela({Key? key, this.textoEnviado = "Nada"}) : super(key: key);

  @override
  State<TerceiraTela> createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  var _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ola ${widget.textoEnviado}!"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
        child: TextField(
          controller: _textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print(_textController.text);
          Navigator.of(context).pop(_textController.text);
        },
        child: Icon(Icons.send),
      ),
    );
  }
}
