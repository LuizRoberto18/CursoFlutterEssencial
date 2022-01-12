import 'package:flutter/material.dart';
import 'package:primeiro_projeto/pages/helo_listview.dart';

class DogPage extends StatelessWidget {
  final Dog _dog;

  DogPage(this._dog);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_dog.nome),
      ),
      body: Image.asset(_dog.foto),
    );
  }
}
