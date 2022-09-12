import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main(List<String> args) {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> perguntas = const [
    {
      'pergunta': 'Qual é sua cor favorita?',
      'respostas': ['Preto', 'Vermelho', 'Verde', 'Branco']
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'respostas': ['Coelho', 'Cachorro', 'Gato', 'Rato']
    },
    {
      'pergunta': 'Qual sua comida favorita?',
      'respostas': ['Pizza', 'Sushi', 'Pastel', 'Hamburguer']
    },
  ];

  void responder() {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
      });
    }
  }

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Perguntas'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: temPerguntaSelecionada
              ? Questionario(
                  perguntas: perguntas,
                  perguntaSelecionada: perguntaSelecionada,
                  responder: responder,
                )
              : const Resultado(),
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});

  @override
  State<PerguntaApp> createState() {
    return PerguntaAppState();
  }
}
