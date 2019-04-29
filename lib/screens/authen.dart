import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget showAppName() {
    return Text('Master Flutter',
        style: TextStyle(
          fontFamily: 'AmaticSC',
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ));
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey[300], Colors.grey[300]],
              begin: Alignment(-1, -1))),
      padding: EdgeInsets.only(top: 100.0),
      alignment: Alignment(0, -1),
      child: Column(
        children: <Widget>[
          Container(
            width: 200.0,
            height: 200.0,
            child: showLogo(),
          ),
          Container(
            margin: EdgeInsets.only(top: 0.0),
            child: showAppName(),
          )
        ],
      ), //call showAppName
    ));
  }
}
