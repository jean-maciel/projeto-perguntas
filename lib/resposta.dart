import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() whenPressed;

  const Resposta(this.texto, this.whenPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: ElevatedButton(
          style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Colors.deepPurpleAccent)),
          onPressed: whenPressed,
          child: Text(texto),
        ));
  }
}
