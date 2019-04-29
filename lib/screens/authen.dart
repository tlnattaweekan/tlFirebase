import 'package:flutter/material.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  Widget signUpButton() {
    return RaisedButton(
      color: Colors.blueGrey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Text('Sign Up'),
      onPressed: () {},
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.blueGrey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Text('Sign In'),
      onPressed: () {},
    );
  }

  Widget passwordTextFromField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password : ', hintText: 'your password'),
    );
  }

  Widget mailTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'email : ', hintText: 'your@mail.com'),
    );
  }

  Widget showAppName() {
    return Text('Master Cats',
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
        resizeToAvoidBottomPadding: false,
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
                  margin: EdgeInsets.only(top: 0.0), child: showAppName()),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: mailTextFormField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: passwordTextFromField(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 15.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: signInButton(),
                    ),
                    Expanded(
                      child: signUpButton(),
                    )
                  ],
                ),
              ),
            ],
          ), //call showAppName
        ));
  }
}
