import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/pages/HomePage.dart';
import 'package:myassistant1/pages/NewUserPage.dart';
import 'package:myassistant1/pages/RegisterPage.dart';
import 'package:myassistant1/process/PersistData.dart';
import 'package:myassistant1/screen/popups.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Loginpage extends StatefulWidget {
  @override
  _loginState createState() => new _loginState();
}

class _loginState extends State<Loginpage> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  void initState() {
    super.initState();
    readData(context);
  }

  _saveData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('acc_pass', password.text);
    prefs.setString('acc_mail', email.text);
  }

  Future _login() async {
    final response = await http.post(
      "http://myassistant.ohm-conception.com/api/login",
      body: {
        "email": email.text,
        "password": password.text,
      },
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      Navigator.of(context).pop(null);
      setState(() {
        token = data['success']['token'];
        budget = data['success']['details']['budgets'];
        payment = data['success']['details']['payment_methods'];
        currency = data['success']['details']['currencies'];
        ei_cat = data['success']['details']['incomeexpense_categories'];
        // bei_cat = data['success']['details']['budgets']['bei_categories'].toString();
        pass = password.text;
        uemail = email.text;
        uname = data['success']['details']['name'];
        id = data['success']['details']['id'].toString();
      });
      _saveData();
      print(token);
      print(bei_cat.length);
      if (budget.length == 0) {
        Navigator.push(
            context,
            PageTransition(
                child: NewUserPage(),
                type: PageTransitionType.leftToRightWithFade));
      } else {
        Navigator.push(
            context,
            PageTransition(
                child: HomePage(),
                type: PageTransitionType.leftToRightWithFade));
      }
    } else if (response.statusCode == 401) {
      Navigator.of(context).pop(null);
      Fluttertoast.showToast(msg: "No Account Found");
    } else if (response.statusCode == 503) {
      Navigator.of(context).pop(null);
      showMaintenance(context);
    } else {
      Navigator.of(context).pop(null);
      showConnectionError(context);
    }
  }

  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            width: fd.size.width,
            height: fd.size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color.fromRGBO(155, 121, 255, 1), Colors.white],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: fd.size.width,
                  height: fd.size.height - fd.size.height / 5,
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
                                          color: Color.fromRGBO(
                                              155, 121, 255, 0.5)))),
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
                                          color: Color.fromRGBO(
                                              155, 121, 255, 0.5)))),
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
                              child: obscureText
                                  ? IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscureText = false;
                                        });
                                      },
                                      icon: Icon(Icons.visibility,
                                          color: Color.fromRGBO(
                                              155, 121, 255, 0.9)),
                                    )
                                  : IconButton(
                                      onPressed: () {
                                        setState(() {
                                          obscureText = true;
                                        });
                                      },
                                      icon: Icon(Icons.visibility_off,
                                          color: Color.fromRGBO(
                                              155, 121, 255, 0.9)),
                                    ),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (email.text.length != 0 &&
                              password.text.length != 0) {
                            if (email.text.contains('@')) {
                              showWait(context);
                              _login();
                              readData(context);
                            } else {
                              Fluttertoast.showToast(msg: "Invalid Email");
                            }
                          } else {
                            Fluttertoast.showToast(msg: "Fill all fields");
                          }
                        },
                        child: Container(
                          width: fd.size.width,
                          height: fd.size.height / 10,
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: fd.size.height / 35),
                          ),
                          margin: EdgeInsets.only(top: fd.size.height / 10),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 121, 255, 1),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          readData(context);
                          Navigator.push(
                              context,
                              new PageTransition(
                                  child: RegisterPage(),
                                  type:
                                      PageTransitionType.rightToLeftWithFade));
                        },
                        child: Container(
                          width: fd.size.width,
                          height: fd.size.height / 10,
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "REGISTER",
                            style: TextStyle(
                                color: Color.fromRGBO(155, 121, 255, 1),
                                fontSize: fd.size.height / 35),
                          ),
                          margin: EdgeInsets.only(top: fd.size.height / 30),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromRGBO(155, 121, 255, 1),
                                  width: fd.size.width / 100),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: fd.size.width,
                  height: fd.size.height / 10,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: fd.size.width / 3,
                        height: fd.size.height / 10,
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "Contact Us:",
                          style: TextStyle(
                            color: Color.fromRGBO(155, 121, 255, 1),
                            fontSize: fd.size.width / 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  launch("https://www.facebook.com/qonvex/");
                                },
                                child: Container(
                                  width: fd.size.height / 15,
                                  height: fd.size.height / 15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          fd.size.width / 50),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://image.flaticon.com/icons/png/512/124/124010.png"))),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launch("https://www.instagram.com");
                                },
                                child: Container(
                                  width: fd.size.height / 15,
                                  height: fd.size.height / 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          fd.size.width / 50),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://icon-library.net/images/instagram-icon-new/instagram-icon-new-8.jpg"))),
                                ),
                              ),
                              Tooltip(
                                message: "qonvextechnology@gmail.com",
                                child: Container(
                                  width: fd.size.height / 15,
                                  height: fd.size.height / 15,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          fd.size.width / 50),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.stickpng.com/assets/images/5847fafdcef1014c0b5e48ce.png"))),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
