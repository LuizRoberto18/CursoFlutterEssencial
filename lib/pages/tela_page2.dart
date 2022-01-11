import 'package:flutter/material.dart';
import 'package:primeiro_projeto/widgets/true_buttom.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(child: BlueBottom("Voltar", onPressed: () => _onCLickVoltar(context)));
  }

  void _onCLickVoltar(context) {
    Navigator.pop(context, 'tela 2');
  }
}
