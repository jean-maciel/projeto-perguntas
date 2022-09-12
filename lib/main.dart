import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import 'package:projeto_perguntas/resultado.dart';

void main(List<String> args) {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var pontuacaoTotal = 0;
  var perguntaSelecionada = 0;
  final List<Map<String, Object>> perguntas = const [
    {
      'pergunta': 'Qual é sua cor favorita?',
      'respostas': [
        {'texto': 'Preto', 'pontuacao': 10},
        {'texto': 'Vermelho', 'pontuacao': 5},
        {'texto': 'Verde', 'pontuacao': 3},
        {'texto': 'Branco', 'pontuacao': 1},
      ]
    },
    {
      'pergunta': 'Qual seu animal favorito?',
      'respostas': [
        {'texto': 'Coelho', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 5},
        {'texto': 'Gato', 'pontuacao': 3},
        {'texto': 'Rato', 'pontuacao': 1},
      ]
    },
    {
      'pergunta': 'Qual sua comida favorita?',
      'respostas': [
        {'texto': 'Pizza', 'pontuacao': 10},
        {'texto': 'Sushi', 'pontuacao': 5},
        {'texto': 'Pastel', 'pontuacao': 3},
        {'texto': 'Hamburguer', 'pontuacao': 1},
      ]
    },
  ];

  void responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        perguntaSelecionada++;
        pontuacaoTotal+= pontuacao;
      });
    }
  }

  void reiniciarQuestionario() {
    setState(() {
      perguntaSelecionada = 0;
      pontuacaoTotal = 0;
    });
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
              : Resultado(pontuacaoTotal, reiniciarQuestionario),
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
