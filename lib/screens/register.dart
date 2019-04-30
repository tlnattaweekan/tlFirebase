import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Explicit
  final formKey = GlobalKey<FormState>();

  Widget passwordTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(width: 1.0, color: Colors.grey)),
          labelText: 'Password',
          hintText: 'More 6 Charactor',
          icon: Icon(Icons.lock)),
          validator: (String value) {if (value.length <= 5) {
              return 'Please Type Password more 6 Charactor';            
          };}
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
      validator: (String value) {
        if (value.length == 0) {
          return 'กรุณากรอกอีเมล์';
        } else if (!((value.contains('@')) && (value.contains('.')))) {
          //ถ้าคำนั้นมี @ อยู่จะเป็น true

        }
      },
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
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Fill Name in the Blank';
        }
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      tooltip: 'Upload To Firebase',
      onPressed: () {
        print('You Click Upload');
        if (formKey.currentState.validate()) {}
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
