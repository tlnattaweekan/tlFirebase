import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passWordString;

  //for Firebase
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //For SnackBar
  final snackBarKey = GlobalKey<ScaffoldState>();

  Widget passwordTextFormField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(width: 1.0, color: Colors.grey)),
          labelText: 'Password',
          hintText: 'More 6 Charactor',
          icon: Icon(Icons.lock)),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type Password more 6 Charactor';
        }
        ;
      },
      onSaved: (String value) {
        passWordString = value;
      },
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      // obscureText: true,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(width: 1.0, color: Colors.grey)),
          labelText: 'Email',
          hintText: 'your@mail.com',
          icon: Icon(Icons.email)),
      validator: (String value) {
        if (value.length == 0) {
          return 'กรุณากรอกอีเมล์';
        } else if (!((value.contains('@')) && (value.contains('.')))) {
          //ถ้าคำนั้นมี @ อยู่จะเป็น true
          return 'กรุณากรอกอีเมล์ให้สมบูรณ์';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget nameTextFormField() {
    return TextFormField(
      // obscureText: true,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(width: 1.0, color: Colors.grey)),
          labelText: 'Name',
          hintText: 'Type Your Name',
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          )),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Fill Name in the Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload To Firebase',
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'name =$nameString,email =$emailString,password =$passWordString');
          uploadValueToFirebase();
        }
      },
    );
  }

  void uploadValueToFirebase() async {
    FirebaseUser firebaseUser = await firebaseAuth
        .createUserWithEmailAndPassword(
            email: emailString, password: passWordString)
        .then((user) {
      print('Register Success With ==>>> $user');
    }).catchError((error) {
      String errorString = error.message;
      print('HAVE ERROR With ==>>> $errorString');
      showSnackBar(errorString);
    });
  }

  void showSnackBar(String messageString) {
    SnackBar snackBarr = SnackBar(
      duration: Duration(seconds: 10),
      backgroundColor: Colors.red,
      content: Text(messageString),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {},
      ),
    );
    snackBarKey.currentState.showSnackBar(snackBarr);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: snackBarKey, //snackBarKey ดูแล Scaffoldนี้
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: Text('Register'),
          actions: <Widget>[uploadButton()],
        ),
        body: Form(
          key: formKey,
          child: Container(
            decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.white, Colors.blue],
                    radius: 1.5,
                    center: Alignment(-1, -1))),
            padding: EdgeInsets.all(50.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: nameTextFormField(),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: emailTextFormField()),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    child: passwordTextFormField())
              ],
            ),
          ),
        ));
  }
}
