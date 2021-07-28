import 'package:decorontario_mobile2/services/ScreenAdapter.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  int _selectIndex = 0;

  @override
  Widget build(BuildContext context) {

    ScreenAdapter.init(context);
    //计算宽高比
    var leftWidth = ScreenAdapter.getScreenWidth()/4;

    var rightItemWidth = (ScreenAdapter.getScreenWidth() - leftWidth - 20-20) / 3;

    rightItemWidth = ScreenAdapter.width(rightItemWidth);
    var rightItemHeight = rightItemWidth + ScreenAdapter.height(28);

    return Row(
      children: <Widget>[
        Container(
          width: leftWidth,
          height: double.infinity,
          //color: Colors.red,
          child: ListView.builder(
            itemCount: 8,
            itemBuilder: (context,index){
              return Column(
                children: <Widget>[
                  //可点击组件
                  InkWell(
                    //点击事件
                    onTap: (){
                      setState(() {
                        _selectIndex = index;
                      });
              },
                    child: Container(
                      child: Text("${index}",textAlign: TextAlign.center,),
                      width: double.infinity,
                      height: ScreenAdapter.height(84),
                      color: _selectIndex == index ? Color.fromRGBO(240, 245, 245, 0.9) : Colors.white,
                    ),
                  ),
                  Divider(height: 1,)
                ],
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(10),
            height: double.infinity,
            color: Color.fromRGBO(240,244,244,0.8),
            child: GridView.builder(
             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
               crossAxisCount: 3,
               //适配不同终端
               childAspectRatio: rightItemWidth/rightItemHeight,
               crossAxisSpacing: 10,
               mainAxisSpacing: 10
             ),
              itemCount: 18,
              itemBuilder: (context,index){
               return Container(

                 child: Column(
                   children: <Widget>[
                     AspectRatio(
                       aspectRatio: 1/1,
                       child: Image.network("https://cdn.nlark.com/yuque/0/2021/jpeg/615808/1627398123537-5b490c9a-8b20-40fb-b1aa-04b97570a147.jpeg",
                       fit: BoxFit.cover,
                       ),
                     ),
                     Container(
                       height: ScreenAdapter.height(28),
                       child: Text('outfit'),
                     ),
                   ],
                 ),
               );
              },
            ),
          ),
        )
      ],
    );
  }
}