import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordSettingsPage extends StatefulWidget {
  @override
  _passState createState() => new _passState();
}

class _passState extends State<PasswordSettingsPage> {
  List mycurrpass = new List(4);
  List newPass = new List(4);
  List newPassConf = new List(4);
  List emptyPass = [];

  FocusNode currFirst = new FocusNode();
  FocusNode currSec = new FocusNode();
  FocusNode currThird = new FocusNode();
  FocusNode currFourth = new FocusNode();

  FocusNode newFirst = new FocusNode();
  FocusNode newSec = new FocusNode();
  FocusNode newThird = new FocusNode();
  FocusNode newFourth = new FocusNode();

  FocusNode newPassFirst = new FocusNode();
  FocusNode newPassSec = new FocusNode();
  FocusNode newPassThird = new FocusNode();
  FocusNode newPassFourth = new FocusNode();

  _savePin() async {
    List<String> myListOfStrings = newPass.map((i) => i.toString()).toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('mylist', myListOfStrings);
    Fluttertoast.showToast(msg: "PIN Updated");
  }

  _saveUnpin() async {
    List<String> myListOfStrings = emptyPass.map((i) => i.toString()).toList();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('mylist', myListOfStrings);
    Fluttertoast.showToast(msg: "PIN Removed");
  }

  void initState() {
    super.initState();
    if (savedPin.length != 0) {
      setState(() {
        withPass = true;
      });
    } else {
      setState(() {
        withPass = false;
      });
    }
  }

  bool withPass = true;
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Container(
      width: fd.size.width,
      height: fd.size.height,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          Container(
            width: fd.size.width,
            height: fd.size.height / 10,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Text("PROTECT APP WITH PASSWORD"),
                  ),
                ),
                Container(
                    width: fd.size.width / 4,
                    height: fd.size.height / 10,
                    padding: EdgeInsets.all(10),
                    alignment: AlignmentDirectional.center,
                    child: withPass
                        ? GestureDetector(
                            onTap: () {
                              setState(() {
                                withPass = true;
                              });
                            },
                            child: Container(
                              width: fd.size.width / 4,
                              height: fd.size.height / 30,
                              alignment: AlignmentDirectional.centerEnd,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(
                                      fd.size.width / 100)),
                              child: Container(
                                width: fd.size.width / 10,
                                height: fd.size.height / 30,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(155, 121, 255, 1),
                                    borderRadius: BorderRadius.circular(
                                        fd.size.width / 100)),
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              setState(() {
                                withPass = false;
                              });
                              _saveUnpin();
                            },
                            child: Container(
                              width: fd.size.width / 4,
                              height: fd.size.height / 30,
                              alignment: AlignmentDirectional.centerStart,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(
                                      fd.size.width / 100)),
                              child: Container(
                                width: fd.size.width / 10,
                                height: fd.size.height / 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade800,
                                    borderRadius: BorderRadius.circular(
                                        fd.size.width / 100)),
                              ),
                            ),
                          ))
              ],
            ),
          ),
          Container(
            width: fd.size.width,
            height: fd.size.height / 2 + fd.size.height / 5,
            child: Column(
              children: <Widget>[
                Container(
                  width: fd.size.width,
                  height: fd.size.height / 30,
                  child: Text("UPDATE PASSWORD"),
                  alignment: AlignmentDirectional.centerStart,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                        width: fd.size.width,
                        height: fd.size.height / 2 + fd.size.height / 6,
                        alignment: AlignmentDirectional.center,
                        child: ListView(
                          padding: EdgeInsets.all(0),
                          children: <Widget>[
                            Container(
                              width: fd.size.width,
                              height: fd.size.height / 6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    width: fd.size.width,
                                    height: fd.size.height / 20,
                                    alignment:
                                        AlignmentDirectional.bottomCenter,
                                    child: Text(
                                      "CURRENT PASSWORD",
                                      style: TextStyle(
                                          color: Colors.grey.shade700),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Container(
                                            width: fd.size.width / 6,
                                            height: fd.size.width / 6,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                      blurRadius: 5,
                                                      color:
                                                          Colors.grey.shade400)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        fd.size.width / 40)),
                                            child: TextField(
                                              obscureText: true,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    1)
                                              ],
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical.bottom,
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontFamily: "Mont",
                                                  color: Color.fromRGBO(
                                                      155, 121, 255, 1)),
                                              scrollPadding: EdgeInsets.all(0),
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (text) {
                                                if (text.length > 0) {
                                                  setState(() {
                                                    mycurrpass[0] = text;
                                                  });
                                                  FocusScope.of(context)
                                                      .requestFocus(currSec);
                                                } else {
                                                  mycurrpass[0] = null;
                                                }
                                              },
                                              focusNode: currFirst,
                                              decoration:
                                                  InputDecoration.collapsed(
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
                                                      blurRadius: 5,
                                                      color:
                                                          Colors.grey.shade400)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        fd.size.width / 40)),
                                            child: TextField(
                                              obscureText: true,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    1)
                                              ],
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical.bottom,
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontFamily: "Mont",
                                                  color: Color.fromRGBO(
                                                      155, 121, 255, 1)),
                                              scrollPadding: EdgeInsets.all(0),
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (text) {
                                                if (text.length > 0) {
                                                  setState(() {
                                                    mycurrpass[1] = text;
                                                  });
                                                  FocusScope.of(context)
                                                      .requestFocus(currThird);
                                                } else {
                                                  FocusScope.of(context)
                                                      .requestFocus(currFirst);
                                                  mycurrpass[1] = null;
                                                }
                                              },
                                              focusNode: currSec,
                                              decoration:
                                                  InputDecoration.collapsed(
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
                                                      blurRadius: 5,
                                                      color:
                                                          Colors.grey.shade400)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        fd.size.width / 40)),
                                            child: TextField(
                                              obscureText: true,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    1)
                                              ],
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical.bottom,
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontFamily: "Mont",
                                                  color: Color.fromRGBO(
                                                      155, 121, 255, 1)),
                                              scrollPadding: EdgeInsets.all(0),
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (text) {
                                                if (text.length > 0) {
                                                  setState(() {
                                                    mycurrpass[2] = text;
                                                  });
                                                  FocusScope.of(context)
                                                      .requestFocus(currFourth);
                                                } else {
                                                  FocusScope.of(context)
                                                      .requestFocus(currSec);
                                                  mycurrpass[2] = null;
                                                }
                                              },
                                              focusNode: currThird,
                                              decoration:
                                                  InputDecoration.collapsed(
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
                                                      blurRadius: 5,
                                                      color:
                                                          Colors.grey.shade400)
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        fd.size.width / 40)),
                                            child: TextField(
                                              obscureText: true,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    1)
                                              ],
                                              textAlign: TextAlign.center,
                                              textAlignVertical:
                                                  TextAlignVertical.bottom,
                                              style: TextStyle(
                                                  fontSize: 45,
                                                  fontFamily: "Mont",
                                                  color: Color.fromRGBO(
                                                      155, 121, 255, 1)),
                                              scrollPadding: EdgeInsets.all(0),
                                              keyboardType:
                                                  TextInputType.number,
                                              onChanged: (text) {
                                                if (text.length < 1) {
                                                  setState(() {
                                                    mycurrpass[3] = null;
                                                  });
                                                  FocusScope.of(context)
                                                      .requestFocus(currThird);
                                                } else {
                                                  setState(() {
                                                    mycurrpass[3] = text;
                                                  });
                                                }
                                              },
                                              focusNode: currFourth,
                                              decoration:
                                                  InputDecoration.collapsed(
                                                hintText: "",
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: fd.size.width,
                              height: fd.size.height / 2.5,
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: fd.size.width,
                                    height: (fd.size.height / 2.5) / 2 - 10,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: fd.size.width,
                                          height: fd.size.height / 20,
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          child: Text(
                                            "NEW PASSWORD",
                                            style: TextStyle(
                                                color: Colors.grey.shade700),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(
                                                  width: fd.size.width / 6,
                                                  height: fd.size.width / 6,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length > 0) {
                                                        setState(() {
                                                          newPass[0] = text;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newPassSec);
                                                      } else {
                                                        newPass[0] = null;
                                                      }
                                                    },
                                                    focusNode: newPassFirst,
                                                    decoration: InputDecoration
                                                        .collapsed(
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
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length > 0) {
                                                        setState(() {
                                                          newPass[1] = text;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newPassThird);
                                                      } else {
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newPassFirst);
                                                        newPass[1] = null;
                                                      }
                                                    },
                                                    focusNode: newPassSec,
                                                    decoration: InputDecoration
                                                        .collapsed(
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
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length > 0) {
                                                        setState(() {
                                                          newPass[2] = text;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newPassFourth);
                                                      } else {
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newPassSec);
                                                        newPass[2] = null;
                                                      }
                                                    },
                                                    focusNode: newPassThird,
                                                    decoration: InputDecoration
                                                        .collapsed(
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
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length < 1) {
                                                        setState(() {
                                                          newPass[3] = null;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newPassThird);
                                                      } else {
                                                        setState(() {
                                                          newPass[3] = text;
                                                        });
                                                      }
                                                    },
                                                    focusNode: newPassFourth,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      hintText: "",
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: fd.size.width,
                                    height: (fd.size.height / 2.5) / 2 - 10,
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          width: fd.size.width,
                                          height: fd.size.height / 20,
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          child: Text(
                                            "CONFIRM PASSWORD",
                                            style: TextStyle(
                                                color: Colors.grey.shade700),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Container(
                                                  width: fd.size.width / 6,
                                                  height: fd.size.width / 6,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      boxShadow: [
                                                        BoxShadow(
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length > 0) {
                                                        setState(() {
                                                          newPassConf[0] = text;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newSec);
                                                      } else {
                                                        newPassConf[0] = null;
                                                      }
                                                    },
                                                    focusNode: newFirst,
                                                    decoration: InputDecoration
                                                        .collapsed(
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
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length > 0) {
                                                        setState(() {
                                                          newPassConf[1] = text;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newThird);
                                                      } else {
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newFirst);
                                                        newPassConf[1] = null;
                                                      }
                                                    },
                                                    focusNode: newSec,
                                                    decoration: InputDecoration
                                                        .collapsed(
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
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length > 0) {
                                                        setState(() {
                                                          newPassConf[2] = text;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newFourth);
                                                      } else {
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newSec);
                                                        newPassConf[2] = null;
                                                      }
                                                    },
                                                    focusNode: newThird,
                                                    decoration: InputDecoration
                                                        .collapsed(
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
                                                            blurRadius: 5,
                                                            color: Colors
                                                                .grey.shade400)
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              fd.size.width /
                                                                  40)),
                                                  child: TextField(
                                                    obscureText: true,
                                                    inputFormatters: [
                                                      LengthLimitingTextInputFormatter(
                                                          1)
                                                    ],
                                                    textAlign: TextAlign.center,
                                                    textAlignVertical:
                                                        TextAlignVertical
                                                            .bottom,
                                                    style: TextStyle(
                                                        fontSize: 45,
                                                        fontFamily: "Mont",
                                                        color: Color.fromRGBO(
                                                            155, 121, 255, 1)),
                                                    scrollPadding:
                                                        EdgeInsets.all(0),
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (text) {
                                                      if (text.length < 1) {
                                                        setState(() {
                                                          newPassConf[3] = null;
                                                        });
                                                        FocusScope.of(context)
                                                            .requestFocus(
                                                                newThird);
                                                      } else {
                                                        setState(() {
                                                          newPassConf[3] = text;
                                                        });
                                                      }
                                                    },
                                                    focusNode: newFourth,
                                                    decoration: InputDecoration
                                                        .collapsed(
                                                      hintText: "",
                                                    ),
                                                  ),
                                                )
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
                            GestureDetector(
                              onTap: () {
                                if (savedPin.toString() ==
                                        mycurrpass.toString() ||
                                    savedPin.length == 0) {
                                  if (savedPin.toString() ==
                                      newPass.toString()) {
                                    Fluttertoast.showToast(
                                        msg: "YOU HAVE ENTERED THE SAME VALUE");
                                  } else {
                                    if (newPass.toString() ==
                                        newPassConf.toString()) {
                                      _savePin();
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: "CONFIRMATION INCORRECT");
                                    }
                                  }
                                } else {
                                  print("DIRI SULOD");
                                }
                              },
                              child: Container(
                                  width: fd.size.width,
                                  height: fd.size.height / 11,
                                  child: Text(
                                    "UPDATE",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fd.size.width / 20),
                                  ),
                                  alignment: AlignmentDirectional.center,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(155, 121, 255, 1),
                                      borderRadius: BorderRadius.circular(
                                          fd.size.width / 30))),
                            )
                          ],
                        )),
                    withPass
                        ? Container()
                        : Container(
                            width: fd.size.width,
                            height: fd.size.height / 2 + fd.size.height / 6,
                            color: Colors.grey.shade300.withOpacity(0.5),
                          )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
