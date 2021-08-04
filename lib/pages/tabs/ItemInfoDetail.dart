import 'dart:async';
//import 'package:mall/services/ScreenAdapter.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_screen_adapter/flutter_screen_adapter.dart';

import 'type.dart';

//import 'front_page.dart';


class ItemInfoDetail extends StatelessWidget {

  AsyncSnapshot snapshot;
  int index;

  ItemInfoDetail({this.snapshot, this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //ScreenAdapter.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(snapshot.data[index]["name"]+"Product Details page"),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),


      body: _listItem(snapshot, index),

    );
  }

  //list列表的item
  Widget _listItem(AsyncSnapshot snapshot, int index) {
    //计算宽高比
   /* var leftWidth = ScreenAdapter.getScreenWidth()/2;

    var rightItemWidth = (ScreenAdapter.getScreenWidth() - leftWidth - 20-20) / 2;

    rightItemWidth = ScreenAdapter.width(rightItemWidth);
    var rightItemHeight = rightItemWidth + ScreenAdapter.height(28);*/
    return Container(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[

            AspectRatio(
                aspectRatio: 1/1,
                child: Image.asset(
                  search_image[index],
                  fit: BoxFit.cover,)
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  snapshot.data[index]["name"],
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 28,//ScreenAdapter.value(36)
                  )),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                  "ID：" + snapshot.data[index]["id"].toString(),
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,//ScreenAdapter.value(28)
                  )),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: <Widget>[

                  Text(
                      "Current price:"+snapshot.data[index]["price"],
                      style:TextStyle(
                        color: Colors.pinkAccent,
                        fontSize: 15,//ScreenUtil().setSp(40),
                      )
                  ),
                  Text(
                    "Original price:"+snapshot.data[index]["regular_price"],
                    style: TextStyle(
                        color: Colors.black26,
                        decoration: TextDecoration.lineThrough
                    ),
                  )
                ],
              ),
            ),
            //筛选：
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,//ScreenAdapter.value(80),
              child: Row(
                children: <Widget>[
                  Text('Selected', style: TextStyle(
                      fontWeight: FontWeight.bold
                  )),
                  Text('115,Black')
                ],
              ),
            ),
            Divider(),
            Container(
              height: 40,//ScreenAdapter.value(80),
              child: Row(
                children: <Widget>[
                  Text('Freight:', style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold
                  )),
                  Text('free shipping')
                ],
              ),
            ),
            Divider(),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 40,//ScreenAdapter.value(80),
              child: Row(
                children: <Widget>[
                  Text('Other product:', style: TextStyle(
                      fontWeight: FontWeight.bold
                  )),

                ],
              ),
            ),
            Container(
              height: 160,
              child: _listItem2(),
            ),
          ],
        )
    );

  }

  Widget _listItem2(){

    //list列表的item

    return Container(
      height: 160,//设置item的高度
      margin: EdgeInsets.only(left: 5,right: 5,top: 5),//设置item的边距
      decoration: BoxDecoration(
        //border: Border.all(color: Colors.black54,width: 1),//设置边框的宽度 以及 颜色
        borderRadius: BorderRadius.all(Radius.circular(5)),//设置圆角
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: 150,
            margin: EdgeInsets.all(5),//设置图片的边距
            child: Image.asset(search_image[1]),
          ),//涉及到widget的大小或者边框的时候，使用container包裹
          Expanded(
            child: Container(
              height: 150,
              margin: EdgeInsets.all(5),//设置图片的边距
              child: Image.asset(search_image[2]),
            ),//涉及到widget的大小或者边框的时候，使用container包裹
          ),
        ],
      ),
    );

  }

}
