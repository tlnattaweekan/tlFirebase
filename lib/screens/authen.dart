import 'package:flutter/material.dart';
import 'package:tlfirebase/screens/register.dart';
import '../screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  //for from
  final formKey = GlobalKey<FormState>();

  //Constant
  String titleHaveSpace = 'กรุณากรอกให้ครบ';
  String titleEmailFalse = 'กรุณากรอก รูปแบบ Email';
  String titlePasswordFale = 'รหัสต้องมี มากกว่า 6 ตัวอักษร';

  Widget signUpButton(BuildContext context) {
    return RaisedButton.icon(
      icon: Icon(Icons.pets),
      label: Text('Sign Up'),
      color: Colors.blueGrey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      onPressed: () {
        print('Your Click Sign Up');
        var registerRouter =
            MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRouter);
      },
    );
  }

  Widget signInButton() {
    return RaisedButton.icon(
      label: Text('Sign In'),
      icon: Icon(Icons.palette),
      color: Colors.blueGrey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      onPressed: () {
        print('You click sign in');
        if (formKey.currentState.validate()) {}
      },
    );
  }

  Widget passwordTextFromField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(labelText: 'Password : ', hintText: 'your password'),
      validator: (String value) {
        if (value.length <= 5) {
          return titlePasswordFale;
        }
      },
    );
  }

  Widget mailTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'email : ', hintText: 'your@mail.com'),
      validator: (String value) {
        if (value.length == 0) {
          return titleHaveSpace;
        } else if (!((value.contains('@')) && (value.contains('.')))) {
          return titleEmailFalse;
        }
      },
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
        body: Form(
          key: formKey,
          child: Container(
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
                        child: Container(
                          child: signInButton(),
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: signUpButton(context),
                          margin: EdgeInsets.only(left: 10.0, right: 10.0),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ), //call showAppName
          ),
        ));
  }
}
