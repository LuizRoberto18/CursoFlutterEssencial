import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello word!"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.amber,
      child: Row(
        children: [
          _button(),
          _button(),
          _button(),
          _button(),
        ],
      ),
    );
  }

  _text() {
    return Text(
      "Hello word",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
      ),
    );
  }

  _img() {
    return Image.asset(
      'assets/images/dog2.png',
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }

  _button() {
    return ElevatedButton(
      onPressed: () {}, child: Text("confirmar"),
    );
  }
}
