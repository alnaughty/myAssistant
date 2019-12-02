import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:myassistant1/variables/global.dart' as prefix0;

class BudgetEIAdd extends StatefulWidget {
  @override
  _budgetEIstate createState() => new _budgetEIstate();
}

class _budgetEIstate extends State<BudgetEIAdd> {
  _addEI() async {
    final res = await http.post(
        "http://myassistant.ohm-conception.com/api/income_expense",
        body: {
          "name": eiName,
          "icon": eiIcon,
          "budget_id": budgetId,
          "amount": pricee,
          "type": ei_diff.toString()
        },
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token,
          "Content-Type": "application/x-www-form-urlencoded"
        });
    if (res.statusCode == 200 || res.statusCode == 201) {
      Fluttertoast.showToast(msg: "Add Successful");
    }
    setState(() {
      ei_diff = 0;
    });
  }

  void showConfirmation() {
    showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.all(0),
          content: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width / 30)),
              child: Column(
                children: <Widget>[
                  Container(
                    width: fd.size.width,
                    height: (fd.size.height / 2) / 7.5,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      "CONFIRM WITH:",
                      style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.bold,
                          fontSize: fd.size.width / 20),
                    ),
                  ),
                  Container(
                    width: fd.size.width,
                    height: fd.size.height / 2 - ((fd.size.height / 2) / 3.5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ei_diff = 1;
                            });
                            _addEI();
                          },
                          child: Container(
                            width: fd.size.width,
                            height: fd.size.height / 12,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(155, 121, 255, 1),
                                borderRadius:
                                    BorderRadius.circular(fd.size.width / 50)),
                            child: Text(
                              "Expense",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fd.size.width / 20),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              ei_diff = 2;
                            });
                            _addEI();
                            Navigator.of(context).pop(null);
                          },
                          child: Container(
                            width: fd.size.width,
                            height: fd.size.height / 12,
                            alignment: AlignmentDirectional.center,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(155, 121, 255, 1),
                                borderRadius:
                                    BorderRadius.circular(fd.size.width / 50)),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: fd.size.width / 20),
                            ),
                          ),
                        ),
                        Container(
                          width: fd.size.width,
                          height: fd.size.height / 12,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 121, 255, 1),
                              borderRadius:
                                  BorderRadius.circular(fd.size.width / 50)),
                          child: Text(
                            "Expense w/ details",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: fd.size.width / 25),
                            overflow: TextOverflow.clip,
                          ),
                        ),
                        Container(
                          width: fd.size.width,
                          height: fd.size.height / 12,
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 121, 255, 1),
                              borderRadius:
                                  BorderRadius.circular(fd.size.width / 50)),
                          child: Text(
                            "Income w/ details",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: fd.size.width / 25),
                            overflow: TextOverflow.clip,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  void initState() {
    super.initState();
    if (budgetCurrId == '1') {
      setState(() {
        currenC = "€";
      });
    } else {
      setState(() {
        currenC = "\$";
      });
    }
  }

  var eiName = '';
  var eiIcon = '';
  var currenC = '';
  var selected = '';
  var pricee = '0.00';
  var temp = '';
  bool firstDig = true;
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Container(
      width: fd.size.width,
      height: fd.size.height,
      padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
      child: Container(
        width: fd.size.width,
        height: fd.size.height,
        child: ListView(
          children: <Widget>[
            Container(
              width: fd.size.width,
              height: fd.size.height / 4.5,
              child: Column(
                children: <Widget>[
                  Container(
                    width: fd.size.width,
                    height: fd.size.height / 4.5 - (fd.size.height / 10),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: fd.size.width,
                          height: fd.size.height / 15,
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Text(
                            "0.00 $currenC",
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: "Mont",
                                fontWeight: FontWeight.bold,
                                fontSize: fd.size.width / 10),
                          ),
                        ),
                        Container(
                          child: Text(
                            "FOR 14 DAYS",
                            style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: fd.size.width / 27),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: fd.size.width / 2 - 20,
                            height: fd.size.height / 10,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(color: Colors.grey))),
                            alignment: AlignmentDirectional.centerStart,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: fd.size.width / 3,
                                  height: fd.size.height / 25,
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Text(
                                    "0.00 $currenC",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Mont",
                                        fontSize: fd.size.width / 20),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "TODAY'S BUDGET",
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: fd.size.width / 27),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: fd.size.width / 2 - 20,
                            height: fd.size.height / 10,
                            alignment: AlignmentDirectional.centerEnd,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: fd.size.width / 3,
                                  height: fd.size.height / 25,
                                  alignment: AlignmentDirectional.bottomCenter,
                                  child: Text(
                                    "0.00 $currenC",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Mont",
                                        fontSize: fd.size.width / 20),
                                  ),
                                ),
                                Container(
                                  child: Text(
                                    "WEEK'S BUDGET",
                                    style: TextStyle(
                                        color: Colors.grey.shade700,
                                        fontSize: fd.size.width / 27),
                                  ),
                                )
                              ],
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
              height: fd.size.height / 11,
              alignment: AlignmentDirectional.center,
              child: Container(
                width: fd.size.width / 2,
                height: fd.size.height / 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(fd.size.width / 40)),
                alignment: AlignmentDirectional.center,
                child: Text(
                  "${pricee} $currenC",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Mont",
                      fontSize: fd.size.width / 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Container(
              width: fd.size.width,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  for (var x = 0; x < ei_cat_icons.length; x++)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = x.toString();
                          eiIcon = ei_cat_icons[x]['icon'];
                          eiName = ei_cat_icons[x]['name'];
                        });
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                        padding: EdgeInsets.all(2),
                        width: fd.size.width / 6,
                        height: fd.size.width / 6,
                        decoration: BoxDecoration(
                            color: selected == x.toString()
                                ? Color.fromRGBO(155, 121, 255, 1)
                                : Colors.grey.shade400.withOpacity(0.3),
                            borderRadius:
                                BorderRadius.circular(fd.size.width / 50)),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(10),
                                child: Image.asset("${ei_cat_icons[x]['icon']}",
                                    color: selected != x.toString()
                                        ? Color.fromRGBO(155, 121, 255, 1)
                                        : Colors.white),
                              ),
                            ),
                            Container(
                              alignment: AlignmentDirectional.center,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: fd.size.width / 6,
                              child: Text(
                                "${ei_cat_icons[x]['name']}",
                                style: TextStyle(
                                  fontSize: fd.size.width / 40,
                                  color: selected != x.toString()
                                      ? Color.fromRGBO(155, 121, 255, 1)
                                      : Colors.white,
                                ),
                                overflow: TextOverflow.ellipsis,
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
              margin: EdgeInsets.only(top: 10),
              width: fd.size.width,
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: <Widget>[
                  for (var x = 0; x < 9; x++)
                    GestureDetector(
                      onTap: () {
                        if (firstDig) {
                          setState(() {
                            pricee = (x + 1).toString();
                            firstDig = false;
                          });
                        } else {
                          setState(() {
                            pricee = (pricee.toString() + (x + 1).toString());
                          });
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 1),
                        width: fd.size.width / 4 + (fd.size.width / 20),
                        height: fd.size.height / 9,
                        alignment: AlignmentDirectional.center,
                        color: Colors.white,
                        child: Text(
                          "${x + 1}",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Mont",
                              fontWeight: FontWeight.bold,
                              fontSize: fd.size.width / 15),
                        ),
                      ),
                    ),
                  Container(
                    width: fd.size.width,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: fd.size.width / 4 - (fd.size.width / 37),
                          height: fd.size.height / 9,
                          color: Colors.white,
                          alignment: AlignmentDirectional.center,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                pricee = '0.00';
                                firstDig = true;
                              });
                            },
                            icon: Icon(
                              Icons.refresh,
                              color: Colors.grey,
                              size: 30,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (pricee.contains(".")) {
                              Fluttertoast.showToast(
                                  msg: "Unable to add \".\"");
                            } else {
                              setState(() {
                                pricee = (pricee.toString() + ".").toString();
                              });
                            }
                          },
                          child: Container(
                            width: fd.size.width / 4 - (fd.size.width / 37),
                            height: fd.size.height / 9,
                            color: Colors.white,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              ".",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Mont",
                                  fontWeight: FontWeight.bold,
                                  fontSize: fd.size.width / 15),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              pricee = (pricee.toString() + "0").toString();
                            });
                          },
                          child: Container(
                            width: fd.size.width / 4 - (fd.size.width / 37),
                            height: fd.size.height / 9,
                            color: Colors.white,
                            alignment: AlignmentDirectional.center,
                            child: Text(
                              "0",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: "Mont",
                                  fontWeight: FontWeight.bold,
                                  fontSize: fd.size.width / 15),
                            ),
                          ),
                        ),
                        Container(
                          width: fd.size.width / 4 - (fd.size.width / 37),
                          height: fd.size.height / 9,
                          color: Colors.white,
                          alignment: AlignmentDirectional.center,
                          child: IconButton(
                            onPressed: () {
                              if (ei_diff == 1) {
                                _addEI();
                              } else if (ei_diff == 2) {
                                _addEI();
                              } else {
                                showConfirmation();
                              }
                            },
                            padding: EdgeInsets.all(0),
                            icon: Icon(
                              Icons.check_circle,
                              size: 30,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
