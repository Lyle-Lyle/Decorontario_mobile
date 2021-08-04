
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'type.dart';
import 'search_bar.dart';
import 'woocommerce_api.dart';

import 'ItemInfoDetail.dart';

class SearchIndex extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IndexWidget();
  }
}

class IndexWidget extends State<SearchIndex>{
  //List<RstData> _listData;//设置列表数据
  GlobalKey<ScaffoldState> _globalKeyState=GlobalKey();

  Future _getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "https://uwindsor-project.tech/",
        consumerKey: "ck_f88c91548f1507adfdbfc6fd669d0df5dd5b279c",
        consumerSecret: "cs_060903ee6d465a114b6142c652ec0f3a501b87a4");

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");
    return products;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("SearchPage"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.search
            ),
            onPressed: (){
              showSearch(context: context, delegate: searchBarDelegate());
            },
          )
        ],
      ),

        body: _listInfos(),

    );
  }

  Widget _listInfos(){
    return FutureBuilder(
        future: _getProducts(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (cx)=>ItemInfoDetail(snapshot: snapshot,index: index,)));
                  },
                  child: _listItem(snapshot, index),
                );

            },
          );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }

  Widget _listItem(AsyncSnapshot snapshot, int index){

        //list列表的item

        return Container(
          height: 160,//设置item的高度
          margin: EdgeInsets.only(left: 5,right: 5,top: 5),//设置item的边距
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black54,width: 1),//设置边框的宽度 以及 颜色
            borderRadius: BorderRadius.all(Radius.circular(5)),//设置圆角
          ),
          child: Row(
            children: <Widget>[
              Container(
                height: 150,
                margin: EdgeInsets.all(5),//设置图片的边距
                child: Image.asset(search_image[index]),
              ),//涉及到widget的大小或者边框的时候，使用container包裹
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  child: Column(
                    children: <Widget>[
                      Text(snapshot.data[index]["name"],textAlign: TextAlign.left,style: TextStyle(fontSize: 20)),
                      Text("\nLight luxury products, make your home more warm.\n" + "Type:" +snapshot.data[index]["type"],textAlign: TextAlign.left,style: TextStyle(fontSize: 17)),
                      Expanded( //此处使用expanded 填充，然后设置container 的对其方式确保 在底部显示
                        child:  Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.bottomLeft,//设置container的对其方式
                              child: Text("Price:\$"+snapshot.data[index]["price"],style: TextStyle(color: Colors.red[500],fontSize: 17),),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.bottomRight,//设置container的对其方式
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,//设置ROW的对其显示方式
                                  children: <Widget>[
                                    //Text("${rstdata.pubtime}-",style: TextStyle(color: Colors.green[500],fontSize: 10),),
                                    Text("Regular Price:\$"+snapshot.data[index]["regular_price"],style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.green[500],fontSize: 17),),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),//expanded类似于Android View的layout_weight属性按照比例填充，flex: 为1 时可以不填写此属性
                    ],
                  ),
                ),
              ),
            ],
          ),
        );

  }

}


