import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Luiz Roberto"),
              accountEmail: Text("passageiro1829@gmai.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dog1.png"),
              ),
            ),
            _listTile(Icons.star, Icons.arrow_forward, "Favoritos",
                "Mais informações", () {
              Navigator.pop(context);
              print("favoritos");
            }),
            _listTile(
                Icons.help, Icons.arrow_forward, "Ajuda", "Mais informações..",
                () {
              print("item 2");
              Navigator.pop(context);
            }),
            _listTile(Icons.exit_to_app, Icons.arrow_forward, "Logout",
                "Mais informações", () {
              print("item 3");
              Navigator.pop(context);
            }),
            _listTile(Icons.construction, Icons.arrow_forward, "config",
                "ifo ", () {
              print("config");
              Navigator.pop(context);
            })
          ],
        ),
      ),
    );
  }

  _listTile(IconData leading, IconData trailling, String title, String subtitle,
      Function onTap) {
    return ListTile(
      leading: Icon(leading),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Icon(trailling),
      onTap: () => onTap(),
    );
  }
}
