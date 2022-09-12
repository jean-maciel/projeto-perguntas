import 'package:flutter/cupertino.dart';

class Questao extends StatelessWidget {
  final String texto;

  const Questao(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
