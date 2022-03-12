import 'package:flutter/material.dart';
import 'package:flutter_rotas/ui/primeira_tela.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App de Diversas Telas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrimeiraTela(),
    );
  }
}
