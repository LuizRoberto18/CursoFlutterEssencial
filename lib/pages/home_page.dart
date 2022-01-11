import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:primeiro_projeto/pages/helo_listview.dart';
import 'package:primeiro_projeto/pages/tela_page1.dart';
import 'package:primeiro_projeto/pages/tela_page2.dart';
import 'package:primeiro_projeto/pages/tela_page3.dart';
import 'package:primeiro_projeto/utls/nav.dart';
import 'package:primeiro_projeto/widgets/true_buttom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello word!"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _text(),
            _pageView(),
            _buttons(context),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 20),
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

  _buttons(context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlueBottom('ListView',
                  onPressed: () => _onCLickNavigator(context, HelloListView())),
              BlueBottom('Page 2',
                  onPressed: () => _onCLickNavigator(context, HelloPage2())),
              BlueBottom('Page 3',
                  onPressed: () => _onCLickNavigator(context, HelloPage3())),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 7.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlueBottom("Snack", onPressed: _onClickSnack),
              BlueBottom('Dialog', onPressed: _onClickDialog),
              BlueBottom('Toast', onPressed: _onClickToast),
            ],
          ),
        ),
      ],
    );
  }

  void _onCLickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }
}

_onClickSnack() {}

_onClickDialog() {}

_onClickToast() {}

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
