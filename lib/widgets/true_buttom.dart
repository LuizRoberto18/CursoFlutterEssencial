import 'package:flutter/material.dart';

class BlueBottom extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  const BlueBottom(this.text, {required this.onPressed, this.color = Colors.blue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        //novo metodo para mudar a cor padrão do botão
        backgroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}
