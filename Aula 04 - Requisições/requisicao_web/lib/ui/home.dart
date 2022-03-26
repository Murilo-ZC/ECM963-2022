import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textController = TextEditingController();
  late String _meusDados;

  //Criado para apenas inicializar a string com as informações
  @override
  void initState() {
    _meusDados = dotenv.get('TEXTO_PADRAO_HOME');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          dotenv.get('IMAGE_APP_BAR_HOME'),
          fit: BoxFit.fitWidth,
          width: 100,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextField(
                      controller: _textController,
                      onSubmitted: (parameter) async{
                        await requisitaCep(_textController.text);
                        setState(() {});
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await requisitaCep(_textController.text);
                    setState(() {});
                  },
                  icon: Image.asset(dotenv.get('IMAGE_BOTAO_BUSCA'),),
                  iconSize: 48,
                ),
              ],
            ),
            Expanded(child: SelectableText(_meusDados)),
          ],
        ),
      ),
    );
  }

  Future<void> requisitaCep(String cep) async {
    var response = await http.get(
      Uri.parse(
        'https://viacep.com.br/ws/${cep}/json/',
      ),
    );
    var dicionario = jsonDecode(response.body);
    _meusDados = """Logradouro: ${dicionario["logradouro"]},
    Bairro: ${dicionario['bairro']},
    Localidade": ${dicionario['localidade']},
    Estado: ${dicionario['uf']},
    DDD: ${dicionario['ddd']}""";
  }
}
