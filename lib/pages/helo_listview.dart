import 'package:flutter/material.dart';
import 'package:primeiro_projeto/pages/dog_page.dart';
import 'package:primeiro_projeto/utls/nav.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  State<HelloListView> createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("Lista");
              setState(() {
                _gridView = false;
              });

            },
            icon: Icon(Icons.list),
          ),
          IconButton(
            onPressed: () {
              print("Grid");
              setState(() {
                _gridView = true;
              });
            },
            icon: Icon(Icons.grid_on),
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
    ];
    if (_gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: () {
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: [
          _img(dog.foto),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                dog.nome,
                style: TextStyle(fontSize: 26, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _pageView() {
    return PageView(
      children: [
        _img('assets/images/dog1.png'),
        _img('assets/images/dog2.png'),
        _img('assets/images/dog3.png'),
        _img('assets/images/dog4.png'),
        _img('assets/images/dog5.png'),
      ],
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }
}
