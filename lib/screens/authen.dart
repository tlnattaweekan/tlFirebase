import 'package:flutter/material.dart';
import 'package:tlfirebase/screens/register.dart';
import '../screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './my_service.dart';

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

  //Explicit
  String emailString, passwordString;

  //for firebase
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //For SnackBar
  final snackBarKey = GlobalKey<ScaffoldState>();

  //Initial Method
  @override
  void initState() {
    super.initState();
    print('initState Work');
    checkStatus(context);
  }

  Future checkStatus(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      goToService(context);
    }
  }

  void goToService(BuildContext context) {
    var serviceRoute =
        MaterialPageRoute(builder: (BuildContext context) => MyService());
    Navigator.of(context)
        .pushAndRemoveUntil(serviceRoute, (Route<dynamic> route) => false);
  }

  //Aboute Widget Method
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

  Widget signInButton(BuildContext context) {
    return RaisedButton.icon(
      label: Text('Sign In'),
      icon: Icon(Icons.palette),
      color: Colors.blueGrey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      onPressed: () {
        print('You click sign in');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'email ===============>>>> $emailString  , password =============>>>> $passwordString');
          checkAuthen(context);
        }
      },
    );
  }

  void checkAuthen(BuildContext context) async {
    FirebaseUser firebaseUser = await firebaseAuth
        .signInWithEmailAndPassword(
            email: emailString, password: passwordString)
        .then((objValue) {
      print('Success Login ===> ${objValue.toString()}');

      //Router With Arrow Back
      var MyServiceRoute =
          MaterialPageRoute(builder: (BuildContext context) => MyService());
      Navigator.of(context)
          .pushAndRemoveUntil(MyServiceRoute, (Route<dynamic> route) => false);
    }).catchError((objValue) {
      String error = objValue.message;
      print('Error ======>>>> $error');
      showSnackBar(error);
    });
  }

  void showSnackBar(String messageString) {
    SnackBar snackBar = SnackBar(
      duration: Duration(seconds: 10),
      backgroundColor: Colors.red[300],
      content: Text(messageString),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    snackBarKey.currentState.showSnackBar(snackBar);
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
      onSaved: (String value) {
        passwordString = value;
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
      onSaved: (String value) {
        emailString = value;
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
        key: snackBarKey,
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
                          child: signInButton(context),
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
