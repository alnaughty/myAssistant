import 'package:flutter/material.dart';
import 'package:myassistant1/pages/HomePage.dart';
import 'package:myassistant1/pages/LoginPage.dart';
import 'package:myassistant1/pages/PasswordPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());
var id = '';
var uname = '';
var uemail = '';
var pass = '';
var token = '';
List budget = [];
List payment = [];
List currency = [];
List bei_cat = [];
List ei_cat = [];
List savedPin = [];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Raleway",
        primarySwatch: Colors.blue,
      ),
      home: PivotState(),
    );
  }
}

class PivotState extends StatefulWidget {
  _pivot createState() => new _pivot();
}

class _pivot extends State<PivotState> {
  Future<String> readData(context) async {
    final prefs = await SharedPreferences.getInstance();
    var respass = prefs.getString('acc_pass');
    var resmail = prefs.getString('acc_mail');
    List<String> myList = (prefs.getStringList('mylist') ?? List<String>());
    List<String> myOriginaList = myList.map((i) => i.toString()).toList();
    if (resmail != '' || resmail != null) {
      setState(() {
        pass = respass;
        uemail = resmail;
        savedPin = myOriginaList;
      });
    } else {
      setState(() {
        pass = '';
        resmail = '';
        savedPin = [];
      });
    }
    print(pass.toString());
    print(uemail.toString());
    print(savedPin.toString());
    return "SUCCESS!";
  }

  @override
  void initState() {
    super.initState();
    readData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: uemail == '' || uemail == null
          ? Loginpage()
          : savedPin.length != 0 ? PasswordPage() : HomePage(),
    );
  }
}
