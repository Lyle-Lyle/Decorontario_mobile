import 'package:flutter/material.dart';
import 'package:flutter_jdshop/services/ScreenAdapter.dart';

import '../../widget/JdText.dart';

import '../../widget/JdButton.dart';

import 'package:city_pickers/city_pickers.dart';

import '../../services/UserServices.dart';
import '../../services/SignServices.dart';

import '../../config/Config.dart';
import 'package:dio/dio.dart';

import '../../services/EventBus.dart';

class AddressEditPage extends StatefulWidget {
  Map arguments;
  AddressEditPage({Key key,this.arguments}) : super(key: key);

  _AddressEditPageState createState() => _AddressEditPageState();
}

class _AddressEditPageState extends State<AddressEditPage> {

  String area='';
  TextEditingController nameController=new TextEditingController();
  TextEditingController phoneController=new TextEditingController();
  TextEditingController addressController=new TextEditingController(); 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // print(widget.arguments);

    nameController.text=widget.arguments['name'];
    phoneController.text=widget.arguments['phone'];
    addressController.text=widget.arguments['address'];
  }
   //监听页面销毁的事件
  dispose(){
    super.dispose();
    eventBus.fire(new AddressEvent('Successfully Added...'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Address"),
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20),
              JdText(
                controller: nameController,
                text: "Name",
                onChanged: (value){
                  nameController.text=value;
                },
              ),
              SizedBox(height: 10),
              JdText(
                controller: phoneController,
                text: "Phone Number",
                onChanged: (value){
                  phoneController.text=value;
                },
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 5),
                height: ScreenAdapter.height(68),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
                child: InkWell(
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.add_location),
                      this.area.length>0?Text('${this.area}', style: TextStyle(color: Colors.black54)):Text('省/市/区', style: TextStyle(color: Colors.black54))
                    ],
                  ),
                  onTap: () async{
                    Result result = await CityPickers.showCityPicker(
                        context: context,
                        locationCode: "130102",
                        cancelWidget:
                            Text("Cancel", style: TextStyle(color: Colors.blue)),
                        confirmWidget:
                            Text("OK", style: TextStyle(color: Colors.blue))
                    );

                    // print(result);
                    setState(() {
                     this.area= "${result.provinceName}/${result.cityName}/${result.areaName}";
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              JdText(
                controller: addressController,
                text: "Detail",
                maxLines: 4,
                height: 200,
                onChanged: (value){
                  addressController.text=value;
                },
              ),
              SizedBox(height: 10),
              SizedBox(height: 40),
              JdButton(text: "Modify", color: Colors.red,cb: () async{

                  List userinfo=await UserServices.getUserInfo();


                  var tempJson={
                    "uid":userinfo[0]["_id"],
                    "id":widget.arguments["id"],
                    "name": nameController.text,
                    "phone":phoneController.text,
                    "address":addressController.text,
                    "salt":userinfo[0]["salt"]
                  };

                  var sign=SignServices.getSign(tempJson);
                  // print(sign);

                  var api = '${Config.domain1}api/editAddress';
                  var response = await Dio().post(api,data:{
                       "uid":userinfo[0]["_id"],
                       "id":widget.arguments["id"],
                        "name": nameController.text,
                        "phone":phoneController.text,
                        "address":addressController.text,                  
                        "sign":sign
                  });    

                  print(response);               
                  Navigator.pop(context);


              })
            ],
          ),
        )
    );
  }
}