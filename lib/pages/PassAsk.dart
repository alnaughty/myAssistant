import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'NewUserPage.dart';

class PassAskPage extends StatefulWidget {
  @override
  _passAsk createState() => new _passAsk();
}

List passToSave;

class _passAsk extends State<PassAskPage> {
  List pass = new List(4);
  List confPass = new List(4);
  FocusNode firstinitPass = new FocusNode();
  FocusNode secinitPass = new FocusNode();
  FocusNode thirdinitPass = new FocusNode();
  FocusNode fourthinitPass = new FocusNode();
  FocusNode firstConfPass = new FocusNode();
  FocusNode secConfPass = new FocusNode();
  FocusNode thirdConfPass = new FocusNode();
  FocusNode fourthConfPass = new FocusNode();
  @override
  _savePin() async {
    List<String> myListOfStrings = savedPin.map((i) => i.toString()).toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("passOn", true);
    await prefs.setStringList('mylist', myListOfStrings);
  }

  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          alignment: AlignmentDirectional.topCenter,
          child: Text(
            'Do you want this app protected by a password?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          alignment: AlignmentDirectional.center,
          child: Text(
            'Enter password'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            padding: EdgeInsets.all(10),
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    focusNode: firstinitPass,
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
                          pass[0] = text;
                        });
                        FocusScope.of(context).requestFocus(secinitPass);
                      } else {
                        setState(() {
                          pass[0] = null;
                        });
                      }
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                          pass[1] = text;
                        });
                        FocusScope.of(context).requestFocus(thirdinitPass);
                      } else {
                        setState(() {
                          pass[1] = null;
                        });
                        FocusScope.of(context).requestFocus(firstinitPass);
                      }
                    },
                    focusNode: secinitPass,
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                          pass[2] = text;
                        });
                        FocusScope.of(context).requestFocus(fourthinitPass);
                      } else {
                        setState(() {
                          pass[2] = null;
                        });
                        FocusScope.of(context).requestFocus(secinitPass);
                      }
                    },
                    focusNode: thirdinitPass,
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                    focusNode: fourthinitPass,
                    onChanged: (text) {
                      if (text.length < 1) {
                        setState(() {
                          pass[3] = null;
                        });
                        FocusScope.of(context).requestFocus(thirdinitPass);
                      } else {
                        setState(() {
                          pass[3] = text;
                        });
                      }
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                )
              ],
            )),
        Container(
          margin: EdgeInsets.only(top: 30),
          width: MediaQuery.of(context).size.width,
          alignment: AlignmentDirectional.center,
          child: Text(
            'Enter password again'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            padding: EdgeInsets.all(10),
            alignment: AlignmentDirectional.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                    focusNode: firstConfPass,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      if (text.length > 0) {
                        setState(() {
                          confPass[0] = text;
                        });
                        FocusScope.of(context).requestFocus(secConfPass);
                      } else {
                        setState(() {
                          confPass[0] = null;
                        });
                      }
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
                    focusNode: secConfPass,
                    onChanged: (text) {
                      if (text.length > 0) {
                        setState(() {
                          confPass[1] = text;
                        });
                        FocusScope.of(context).requestFocus(thirdConfPass);
                      } else {
                        setState(() {
                          confPass[1] = null;
                        });
                        FocusScope.of(context).requestFocus(firstConfPass);
                      }
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                    focusNode: thirdConfPass,
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      if (text.length > 0) {
                        setState(() {
                          confPass[2] = text;
                        });
                        FocusScope.of(context).requestFocus(fourthConfPass);
                      } else {
                        setState(() {
                          confPass[2] = null;
                        });
                        FocusScope.of(context).requestFocus(secConfPass);
                      }
                    },
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    obscureText: true,
                    inputFormatters: [LengthLimitingTextInputFormatter(1)],
                    textAlign: TextAlign.center,
                    focusNode: fourthConfPass,
                    onChanged: (text) {
                      if (text.length < 1) {
                        setState(() {
                          confPass[3] = null;
                        });
                        FocusScope.of(context).requestFocus(thirdConfPass);
                      } else {
                        setState(() {
                          confPass[3] = text;
                        });
                      }
                    },
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                        fontSize: 45,
                        fontFamily: "Mont",
                        color: Color.fromRGBO(155, 121, 255, 1)),
                    scrollPadding: EdgeInsets.all(0),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration.collapsed(
                      hintText: "",
                    ),
                  ),
                ),
              ],
            )),
        GestureDetector(
          onTap: () {
            int counter = 0;
            print(pass);
            if (!pass.contains(null) && !confPass.contains(null)) {
              for (var i = 0; i < pass.length; i++) {
                if (pass[i] != confPass[i]) {
                  counter += 1;
                }
              }
              if (counter == 0) {
                setState(() {
                  passToSave = pass;
                  savedPin = pass;
                });
                _savePin();
                pageController.nextPage(
                    duration: kTabScrollDuration, curve: Curves.ease);
              } else {
                Fluttertoast.showToast(msg: "Password Mismatched");
              }
            } else {
              Fluttertoast.showToast(msg: "Complete fields first");
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 50),
            width: MediaQuery.of(context).size.width,
            height: 60,
            alignment: AlignmentDirectional.center,
            child: Text(
              'OK',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(155, 121, 255, 1),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        GestureDetector(
          onTap: () {
            pageController.nextPage(
                duration: kTabScrollDuration, curve: Curves.ease);
          },
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: MediaQuery.of(context).size.width,
            height: 60,
            alignment: AlignmentDirectional.center,
            child: Text(
              'NO, THANKS',
              style: TextStyle(
                  color: Color.fromRGBO(174, 100, 227, 1), fontSize: 20),
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
          ),
        ),
      ],
    );
  }
}
