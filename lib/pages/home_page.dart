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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _text(),
            _pageView(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.all(5.0),
      height: 300,
      child: PageView(
        children: [
          _img('assets/images/dog1.png'),
          _img('assets/images/dog2.png'),
          _img('assets/images/dog3.png'),
          _img('assets/images/dog4.png'),
          _img('assets/images/dog5.png'),
        ],
      ),
    );
  }

  _buttons() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button('ListView'),
              _button('Page 2'),
              _button('Page 3'),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _button("Snack"),
              _button('Dialog'),
              _button('Toast'),
            ],
          ),
        ),
      ],
    );
  }

  void _onCLick() {
    print("cliclou no botap");
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
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }

  _button(String text) {
    return ElevatedButton(
      onPressed: () {
        _onCLick();
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
