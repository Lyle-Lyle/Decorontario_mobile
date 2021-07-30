import 'package:flutter/material.dart';
import '../services/ScreenAdapter.dart';
import '../widget/JdText.dart';
import '../widget/JdButton.dart';

import '../config/Config.dart';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../services/Storage.dart';
import 'dart:convert';

import '../services/EventBus.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  //监听登录页面销毁的事件
  dispose(){
    super.dispose();
    eventBus.fire(new UserEvent('Success...'));
  }

  String username='';
  String password='';
  doLogin() async{
    RegExp reg = new RegExp(r"^1\d{10}$");
    if (!reg.hasMatch(this.username)) {
       Fluttertoast.showToast(
        msg: 'Wrong format',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    } else if(password.length<6){
      Fluttertoast.showToast(
        msg: 'Password is not correct',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }else{
      var api = '${Config.domain1}api/doLogin';
      var response = await Dio().post(api, data: {"username": this.username,"password":this.password});
      if (response.data["success"]) {
        print(response.data);
        //保存用户信息
        Storage.setString('userInfo', json.encode(response.data["userinfo"]));

        Navigator.pop(context);
        
      } else {
        Fluttertoast.showToast(
          msg: '${response.data["message"]}',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }

    }
   

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // title: Text("登录页面"),
        actions: <Widget>[
          FlatButton(
            child: Text("Chat"),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(ScreenAdapter.width(20)),
        child: ListView(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                height: ScreenAdapter.width(160),
                width: ScreenAdapter.width(160),
                child: Image.asset('images/logo.jpg',),
                // child: Image.network(
                //     'https://www.baidu.com',
                //     fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 30),
            JdText(
              text: "Username",
              onChanged: (value) {
                // print(value);
                this.username=value;
              },
            ),
            SizedBox(height: 10),
            JdText(
              text: "Password",
              password: true,
              onChanged: (value) {
                // print(value);
                this.password=value;
              },
            ),

            SizedBox(height: 10),

            Container(
              padding: EdgeInsets.all(ScreenAdapter.width(20)),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('forget password?'),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/registerFirst');
                      },
                      child: Text('Register here'),
                    ),
                  )
                ],
              ),
            ),

           SizedBox(height: 20),
            JdButton(
              text:"Login",
              color: Colors.red,
              height: 74,
              cb: doLogin,
            )
          ],
        ),
      ),
    );
  }
}
