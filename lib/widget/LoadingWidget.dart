import 'package:flutter/material.dart';
class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[      
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),Text(
              'Loading...',
              style: TextStyle(fontSize: 16.0),
            )
          ],
        ),
      ),
    );;
  }
}