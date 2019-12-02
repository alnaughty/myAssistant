import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/screen/popups.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _registerState createState() => new _registerState();
}

class _registerState extends State<RegisterPage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController c_pass = new TextEditingController();
  TextEditingController name = new TextEditingController();
  bool obscureText = true;

  Future _registerNew() async {
    final respo = await http
        .post("http://myassistant.ohm-conception.com/api/register", body: {
      "name": name.text,
      "email": email.text,
      "password": password.text,
    });
    if (respo.statusCode == 200) {
      var data = json.decode(respo.body);
      json.encode(respo.body);
      Navigator.of(context).pop(null);
      Fluttertoast.showToast(msg: "Registration Successful!");
      print(data);
    } else {
      Navigator.of(context).pop(null);
      Fluttertoast.showToast(msg: "${respo.statusCode}");
      showConnectionError(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.all(0),
      children: <Widget>[
        Container(
          width: fd.size.width,
          height: fd.size.height,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(155, 121, 255, 1), Colors.white],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: fd.size.width,
                height: fd.size.height / 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: fd.size.height / 10,
                      height: fd.size.height / 10,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromRGBO(155, 121, 255, 0.5)))),
                      child: Icon(
                        Icons.person,
                        size: fd.size.height / 20,
                        color: Color.fromRGBO(155, 121, 255, 0.5),
                      ),
                    ),
                    Container(
                      width: fd.size.width - fd.size.width / 2.5,
                      height: fd.size.height / 10,
                      padding: EdgeInsets.only(left: 10),
                      alignment: AlignmentDirectional.center,
                      child: TextField(
                        style: TextStyle(
                            fontSize: fd.size.height / 40,
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        controller: name,
                        decoration: InputDecoration.collapsed(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(155, 121, 255, 0.5),
                            )),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          name.clear();
                        },
                        icon: Icon(Icons.cancel,
                            color: Color.fromRGBO(155, 121, 255, 0.9)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: fd.size.width,
                height: fd.size.height / 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: fd.size.height / 10,
                      height: fd.size.height / 10,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromRGBO(155, 121, 255, 0.5)))),
                      child: Icon(
                        Icons.person,
                        size: fd.size.height / 20,
                        color: Color.fromRGBO(155, 121, 255, 0.5),
                      ),
                    ),
                    Container(
                      width: fd.size.width - fd.size.width / 2.5,
                      height: fd.size.height / 10,
                      padding: EdgeInsets.only(left: 10),
                      alignment: AlignmentDirectional.center,
                      child: TextField(
                        style: TextStyle(
                            fontSize: fd.size.height / 40,
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        controller: email,
                        decoration: InputDecoration.collapsed(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(155, 121, 255, 0.5),
                            )),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          email.clear();
                        },
                        icon: Icon(Icons.cancel,
                            color: Color.fromRGBO(155, 121, 255, 0.9)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: fd.size.width,
                height: fd.size.height / 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: fd.size.height / 10,
                      height: fd.size.height / 10,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromRGBO(155, 121, 255, 0.5)))),
                      child: Icon(
                        Icons.vpn_key,
                        size: fd.size.height / 20,
                        color: Color.fromRGBO(155, 121, 255, 0.5),
                      ),
                    ),
                    Container(
                      width: fd.size.width - fd.size.width / 2.5,
                      height: fd.size.height / 10,
                      padding: EdgeInsets.only(left: 10),
                      alignment: AlignmentDirectional.center,
                      child: TextField(
                        obscureText: obscureText,
                        style: TextStyle(
                            fontSize: fd.size.height / 40,
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        controller: password,
                        decoration: InputDecoration.collapsed(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(155, 121, 255, 0.5),
                            )),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          password.clear();
                        },
                        icon: Icon(Icons.cancel,
                            color: Color.fromRGBO(155, 121, 255, 0.9)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: fd.size.width,
                height: fd.size.height / 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: fd.size.height / 10,
                      height: fd.size.height / 10,
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromRGBO(155, 121, 255, 0.5)))),
                      child: Icon(
                        Icons.vpn_key,
                        size: fd.size.height / 20,
                        color: Color.fromRGBO(155, 121, 255, 0.5),
                      ),
                    ),
                    Container(
                      width: fd.size.width - fd.size.width / 2.5,
                      height: fd.size.height / 10,
                      padding: EdgeInsets.only(left: 10),
                      alignment: AlignmentDirectional.center,
                      child: TextField(
                        obscureText: obscureText,
                        style: TextStyle(
                            fontSize: fd.size.height / 40,
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        controller: c_pass,
                        decoration: InputDecoration.collapsed(
                            hintText: "Confirm Password",
                            hintStyle: TextStyle(
                              color: Color.fromRGBO(155, 121, 255, 0.5),
                            )),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          c_pass.clear();
                        },
                        icon: Icon(Icons.cancel,
                            color: Color.fromRGBO(155, 121, 255, 0.9)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: fd.size.width,
                height: fd.size.height / 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: fd.size.height / 20,
                      height: fd.size.height / 20,
                      child: obscureText
                          ? IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  obscureText = false;
                                });
                              },
                              icon: Icon(
                                Icons.check_box_outline_blank,
                                size: fd.size.width / 10,
                                color: Color.fromRGBO(155, 121, 255, 0.9),
                              ),
                            )
                          : IconButton(
                              padding: EdgeInsets.all(0),
                              onPressed: () {
                                setState(() {
                                  obscureText = true;
                                });
                              },
                              icon: Icon(Icons.check_box,
                                  size: fd.size.width / 10,
                                  color: Color.fromRGBO(155, 121, 255, 0.9)),
                            ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: fd.size.width / 50),
                      child: Text(
                        "Show Password",
                        style: TextStyle(
                            fontSize: fd.size.width / 21,
                            color: Color.fromRGBO(155, 121, 255, 0.9)),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  showWait(context);
                  if (name.text.length != 0 &&
                      email.text.length != 0 &&
                      password.text.length != 0 &&
                      c_pass.text.length != 0) {
                    if (password.text == c_pass.text) {
                      if (email.text.contains('@')) {
                        _registerNew();
                      } else {
                        Fluttertoast.showToast(msg: "Invalid Email");
                        Navigator.of(context).pop(null);
                      }
                    } else {
                      Navigator.of(context).pop(null);
                      Fluttertoast.showToast(msg: "Password Mismatch");
                    }
                  } else {
                    Navigator.of(context).pop(null);
                    Fluttertoast.showToast(msg: "Fill all fields");
                  }
                },
                child: Container(
                  width: fd.size.width,
                  height: fd.size.height / 10,
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "REGISTER",
                    style: TextStyle(
                        color: Colors.white, fontSize: fd.size.height / 35),
                  ),
                  margin: EdgeInsets.only(top: fd.size.height / 15),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(155, 121, 255, 1),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
