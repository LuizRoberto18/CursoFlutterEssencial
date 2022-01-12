import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:primeiro_projeto/pages/drawer_list.dart';
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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello word!"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: "tab 1",
              ),
              Tab(
                text: "tab 2",
              ),
              Tab(
                text: "tab 3",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(
              color: Colors.purple,
            ),
            Container(
              color: Colors.amber,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _onCLickFab();
          },
          child: Icon(Icons.favorite),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body(context) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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

  _buttons() {
    return Builder(
      builder: (context) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlueBottom('ListView',
                      onPressed: () =>
                          _onCLickNavigator(context, HelloListView())),
                  BlueBottom('Page 2',
                      onPressed: () =>
                          _onCLickNavigator(context, HelloPage2())),
                  BlueBottom('Page 3',
                      onPressed: () =>
                          _onCLickNavigator(context, HelloPage3())),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 7.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BlueBottom("Snack", onPressed: () => _onClickSnack(context)),
                  BlueBottom('Dialog',
                      onPressed: () => _onClickDialog(context)),
                  BlueBottom('Toast', onPressed: _onClickToast),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  void _onCLickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(">> $s");
  }

  void _onCLickFab() {
    print("add");
  }
}

_onClickSnack(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text("Ola flutter"),
    action: SnackBarAction(
      textColor: Colors.amber,
      label: "OK",
      onPressed: () {
        print("Ok");
      },
    ),
  ));
}

_onClickDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text("Flutter é muito legal"),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Cancelar"),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                  print("OK!!!");
                },
                child: Text("OK"),
              )
            ],
          ),
        );
      });
}

_onClickToast() {
  Fluttertoast.showToast(
      msg: "Flutter é muito legal",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
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
