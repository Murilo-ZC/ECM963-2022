import 'package:flutter/material.dart';
import 'package:flutter_rotas/ui/segunda_tela.dart';
import 'package:flutter_rotas/ui/terceira_tela.dart';
import 'package:flutter_rotas/widgets/meu_botao_custom.dart';

class PrimeiraTela extends StatelessWidget {
  const PrimeiraTela({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MeuBotaoCustom(
              textoBotao: "Alabasta",
              comportamento: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SegundaTela();
                }));
              },
            ),
            MeuBotaoCustom(
              comportamento: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return TerceiraTela(
                    textoEnviado: "Final",
                  );
                })).then((value) => print(value));
              },
            ),
          ],
        ),
      ),
    );
  }
}
