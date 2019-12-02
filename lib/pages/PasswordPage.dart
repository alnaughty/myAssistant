import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/pages/HomePage.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:page_transition/page_transition.dart';

class PasswordPage extends StatefulWidget {
  @override
  _passState createState() => new _passState();
}

class _passState extends State<PasswordPage> {
  List mycurrpass = new List(4);
  FocusNode currFirst = new FocusNode();
  FocusNode currSec = new FocusNode();
  FocusNode currThird = new FocusNode();
  FocusNode currFourth = new FocusNode();
  _checkPassword() {
    if (savedPin.toString() == mycurrpass.toString()) {
      Navigator.push(context, PageTransition(child: HomePage(),type: PageTransitionType.fade));
    } else {
      Fluttertoast.showToast(msg: "INCORRECT PASSWORD");
    }
  }

  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Scaffold(
      body: Container(
        width: fd.size.width,
        height: fd.size.height,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                width: fd.size.width,
                height: fd.size.height / 10,
                alignment: AlignmentDirectional.center,
                child: Text(
                  "ENTER PASSWORD",
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: fd.size.width / 25,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: fd.size.width / 6,
                      height: fd.size.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5, color: Colors.grey.shade400)
                          ],
                          borderRadius:
                              BorderRadius.circular(fd.size.width / 40)),
                      child: TextField(
                        autofocus: true,
                        obscureText: true,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(
                            fontSize: 45,
                            fontFamily: "Mont",
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        scrollPadding: EdgeInsets.all(0),
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          if (text.length > 0) {
                            setState(() {
                              mycurrpass[0] = text;
                            });
                            FocusScope.of(context).requestFocus(currSec);
                          } else {
                            mycurrpass[0] = null;
                          }
                        },
                        focusNode: currFirst,
                        decoration: InputDecoration.collapsed(
                          hintText: "",
                        ),
                      ),
                    ),
                    Container(
                      width: fd.size.width / 6,
                      height: fd.size.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5, color: Colors.grey.shade400)
                          ],
                          borderRadius:
                              BorderRadius.circular(fd.size.width / 40)),
                      child: TextField(
                        obscureText: true,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(
                            fontSize: 45,
                            fontFamily: "Mont",
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        scrollPadding: EdgeInsets.all(0),
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          if (text.length > 0) {
                            setState(() {
                              mycurrpass[1] = text;
                            });
                            FocusScope.of(context).requestFocus(currThird);
                          } else {
                            FocusScope.of(context).requestFocus(currFirst);
                            mycurrpass[1] = null;
                          }
                        },
                        focusNode: currSec,
                        decoration: InputDecoration.collapsed(
                          hintText: "",
                        ),
                      ),
                    ),
                    Container(
                      width: fd.size.width / 6,
                      height: fd.size.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5, color: Colors.grey.shade400)
                          ],
                          borderRadius:
                              BorderRadius.circular(fd.size.width / 40)),
                      child: TextField(
                        obscureText: true,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(
                            fontSize: 45,
                            fontFamily: "Mont",
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        scrollPadding: EdgeInsets.all(0),
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          if (text.length > 0) {
                            setState(() {
                              mycurrpass[2] = text;
                            });
                            FocusScope.of(context).requestFocus(currFourth);
                          } else {
                            FocusScope.of(context).requestFocus(currSec);
                            mycurrpass[2] = null;
                          }
                        },
                        focusNode: currThird,
                        decoration: InputDecoration.collapsed(
                          hintText: "",
                        ),
                      ),
                    ),
                    Container(
                      width: fd.size.width / 6,
                      height: fd.size.width / 6,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 5, color: Colors.grey.shade400)
                          ],
                          borderRadius:
                              BorderRadius.circular(fd.size.width / 40)),
                      child: TextField(
                        obscureText: true,
                        inputFormatters: [LengthLimitingTextInputFormatter(1)],
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.bottom,
                        style: TextStyle(
                            fontSize: 45,
                            fontFamily: "Mont",
                            color: Color.fromRGBO(155, 121, 255, 1)),
                        scrollPadding: EdgeInsets.all(0),
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          if (text.length < 1) {
                            setState(() {
                              mycurrpass[3] = null;
                            });
                            FocusScope.of(context).requestFocus(currThird);
                          } else {
                            setState(() {
                              mycurrpass[3] = text;
                              _checkPassword();
                            });
                          }
                        },
                        focusNode: currFourth,
                        decoration: InputDecoration.collapsed(
                          hintText: "",
                        ),
                      ),
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
