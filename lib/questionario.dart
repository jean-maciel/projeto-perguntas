import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';
import 'package:projeto_perguntas/resposta.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function() responder;

  const Questionario(
      {required this.perguntas,
      required this.perguntaSelecionada,
      required this.responder,
      Key? key})
      : super(key: key);

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    final List<String> respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada].cast()['respostas']
        : [];
    Iterable<Widget> widgets =
    respostas.map((t) => Resposta(t, responder)).cast<Widget>();

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['pergunta'].toString()),
        ...widgets,
      ],
    );
  }
}
