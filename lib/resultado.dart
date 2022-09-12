import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() reiniciarQuestionario;

  const Resultado(this.pontuacao, this.reiniciarQuestionario, {Key? key})
      : super(key: key);

  String get fraseResultado {
    if (pontuacao < 8) {
      return 'Parabéns';
    } else if (pontuacao < 12 && pontuacao >= 8) {
      return 'Você é bom';
    } else if (pontuacao < 16 && pontuacao >= 12) {
      return 'Impressionante';
    } else {
      return 'O melhor de todos';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(fraseResultado, style: TextStyle(fontSize: 30)),
        ),
        Text("Score: $pontuacao",
            style: const TextStyle(fontSize: 24)),
        TextButton(
            onPressed: reiniciarQuestionario,
            child: const Text(
              'Reiniciar',
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
