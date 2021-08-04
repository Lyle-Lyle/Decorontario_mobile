import 'package:flutter/material.dart';


//保存购物车的数据，checkout的时候就能获取到了

class CheckOut with ChangeNotifier {
  List _checkOutListData = []; //购物车数据
  List get checkOutListData => this._checkOutListData;

  changeCheckOutListData(data){
    this._checkOutListData=data;
    notifyListeners();
  }

}
