import 'package:flutter/material.dart';

import 'Cart.dart';
import 'Category.dart';
import 'User.dart';
import 'Home.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabState createState() => _TabState();
}

class _TabState extends  State<Tabs> {

  int _currentIndex = 0;

  List _pageList = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    UserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Decorontario"),
      ),
      body: _pageList[this._currentIndex],
      //底部导航栏
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: this._currentIndex,
        onTap: (index) {
          setState(() {
            this._currentIndex = index;
          });
        },
        //为了能显示多个导航菜单
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.lightBlue,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: "Category"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "ShoppingCart"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: "Profile"
          ),

        ],
      ),
    );
  }
}