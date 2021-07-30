import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/ScreenAdapter.dart';
import 'ProductContent/ProductContentFirst.dart';
import 'ProductContent/ProductContentSecond.dart';
import 'ProductContent/ProductContentThird.dart';

import '../widget/JdButton.dart';

import '../config/Config.dart';
import 'package:dio/dio.dart';
import '../model/ProductContentModel.dart';

import '../widget/LoadingWidget.dart';

import 'package:provider/provider.dart';
import '../provider/Cart.dart';
import '../services/CartServices.dart';

import 'package:fluttertoast/fluttertoast.dart';

//广播
import '../services/EventBus.dart';

class ProductContentPage extends StatefulWidget {
  final Map arguments;
  ProductContentPage({Key key, this.arguments}) : super(key: key);

  _ProductContentPageState createState() => _ProductContentPageState();
}

class _ProductContentPageState extends State<ProductContentPage> {
  List _productContentList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(this._productContentData.sId);

    this._getContentData();
  }

  _getContentData() async {
    if (widget.arguments['id'] == "59f6a2d27ac40b223cfdcf81") {
      var api = '${Config.domain2}api/content1';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });
    } else if (widget.arguments['id'] == "5a042682010e71123466143b") {
      var api = '${Config.domain2}api/content2';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });

    } else if (widget.arguments['id'] == "5a042702010e71123466143c") {
      var api = '${Config.domain2}api/content3';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });

    } else if (widget.arguments['id'] == "5a042aa3010e71123466143d") {
      var api = '${Config.domain2}api/content4';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });

    } else if (widget.arguments['id'] == "5a042d30010e711234661441") {
      var api = '${Config.domain2}api/content5';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });

    } else if  (widget.arguments['id'] == "5a042eff010e711234661445") {
      var api = '${Config.domain2}api/content6';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });

    } else if (widget.arguments['id'] == "5a07eeeaad8b300e28e2feb5") {
      var api = '${Config.domain2}api/content7';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });

    } else if (widget.arguments['id'] == "5a07ef41ad8b300e28e2feb7") {
      var api = '${Config.domain2}api/content8';
      print(api);
      var result = await Dio().get(api);
      var productContent = new ProductContentModel.fromJson(result.data);

      setState(() {
        this._productContentList.add(productContent.result);
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<Cart>(context);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: ScreenAdapter.width(400),
                child: TabBar(
                  indicatorColor: Colors.red,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: <Widget>[
                    Tab(
                      child: Text('Details'),
                    ),
                    Tab(
                      child: Text('3D'),
                    ),
                    Tab(
                      child: Text('Comments'),
                    )
                  ],
                ),
              )
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                        ScreenAdapter.width(600), 76, 10, 0),
                    items: [
                      PopupMenuItem(
                        child: Row(
                          children: <Widget>[Icon(Icons.home), Text("HomePage")],
                        ),
                      ),
                      PopupMenuItem(
                        child: Row(
                          children: <Widget>[Icon(Icons.search), Text("Search")],
                        ),
                      )
                    ]);
              },
            )
          ],
        ),
        body: this._productContentList.length > 0
            ? Stack(
                children: <Widget>[
                  TabBarView(
                    physics: NeverScrollableScrollPhysics(), //禁止TabBarView滑动
                    children: <Widget>[
                      ProductContentFirst(this._productContentList),
                      ProductContentSecond(this._productContentList),
                      ProductContentThird()
                    ],
                  ),
                  Positioned(
                    width: ScreenAdapter.width(750),
                    height: ScreenAdapter.width(88),
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Colors.black26, width: 1)),
                          color: Colors.white),
                      child: Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: ScreenAdapter.height(4)),
                              width: ScreenAdapter.size(120),
                              height: ScreenAdapter.height(84),
                              child: Column(
                                children: <Widget>[
                                  Icon(Icons.shopping_cart,size: ScreenAdapter.size(36)),
                                  Text("Cart",style: TextStyle(
                                    fontSize:ScreenAdapter.size(22)
                                  ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: JdButton(
                              color: Color.fromRGBO(253, 1, 0, 0.9),
                              text: "Add to ShoppingCart",
                              cb: () async {
                                if (this._productContentList[0].attr.length >
                                    0) {
                                  //广播 弹出筛选
                                  eventBus
                                      .fire(new ProductContentEvent('Add to ShoppingCart'));
                                } else {
                                  await CartServices.addCart(
                                      this._productContentList[0]);
                                  //调用Provider 更新数据
                                  cartProvider.updateCartList();
                                  Fluttertoast.showToast(
                                      msg: 'Added to ShoppingCart',
                                      toastLength: Toast.LENGTH_SHORT,gravity: ToastGravity.CENTER,);
                                }
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: JdButton(
                              color: Color.fromRGBO(255, 165, 0, 0.9),
                              text: "Buy it now",
                              cb: () {
                                if (this._productContentList[0].attr.length >
                                    0) {
                                  //广播 弹出筛选
                                  eventBus
                                      .fire(new ProductContentEvent('Buy it now'));
                                } else {
                                  print("Buy it now");
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            : LoadingWidget(),
      ),
    );
  }
}
