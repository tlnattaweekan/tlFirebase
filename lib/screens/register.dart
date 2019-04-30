import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Widget passwordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(width: 1.0, color: Colors.grey)),
          labelText: 'Password',
          hintText: 'More 6 Charactor',
          icon: Icon(Icons.lock)),
    );
  }

  Widget emailTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(width: 1.0, color: Colors.grey)),
          labelText: 'Email',
          hintText: 'your@mail.com',
          icon: Icon(Icons.email)),
    );
  }

  Widget nameTextFormField() {
    return TextFormField(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
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
    );
  }
}
