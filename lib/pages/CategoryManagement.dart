import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:http/http.dart' as http;

class CatManagement extends StatefulWidget {
  @override
  _catManagement createState() => new _catManagement();
}

class _catManagement extends State<CatManagement> {
  _deleteExpense(index) async {
    final res = await http.delete(
        "http://myassistant.ohm-conception.com/api/income_expense/$index",
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token
        });
    if (res.statusCode == 200) {
      json.encode(res.body);
      Fluttertoast.showToast(msg: "Expense Deleted Successfully");
    } else {
      Fluttertoast.showToast(
          msg: "Connection Error, Please Try Again ${res.statusCode}");
    }
    _getInformation();
  }

  _deleteIncome(index) async {
    final res = await http.delete(
        "http://myassistant.ohm-conception.com/api/income_expense/$index",
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token
        });
    if (res.statusCode == 200) {
      json.encode(res.body);
      Fluttertoast.showToast(msg: "Income Deleted Successfully");
    } else {
      Fluttertoast.showToast(
          msg: "Connection Error, Please Try Again ${res.statusCode}");
    }
    _getInformation();
  }

  _deletePayment(index) async {
    final res = await http.delete(
        "http://myassistant.ohm-conception.com/api/payment_method/$index",
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token
        });
    if (res.statusCode == 200) {
      json.encode(res.body);
      Fluttertoast.showToast(msg: "Payment Method Deleted Successfully");
    } else {
      Fluttertoast.showToast(
          msg: "Connection Error, Please Try Again ${res.statusCode}");
    }
    _getInformation();
  }

  Future _getInformation() async {
    final response = await http.post(
      "http://myassistant.ohm-conception.com/api/login",
      body: {
        "email": uemail,
        "password": pass,
      },
    );
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      setState(() {
        budget = data['success']['details']['budgets'];
        payment = data['success']['details']['payment_methods'];
        currency = data['success']['details']['currencies'];
        ei_cat = data['success']['details']['incomeexpense_categories'];
      });
    } else {
      Fluttertoast.showToast(msg: "Request Time out");
    }
  }

  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Container(
        width: fd.size.width,
        height: fd.size.height,
        padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
        child: Container(
          width: fd.size.width,
          height: fd.size.height / 2,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Container(
                width: fd.size.width,
                height: fd.size.height / 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("PAYMENT METHOD INFORMATIONS"),
                      ),
                    ),
                    Container(
                      width: fd.size.height / 12,
                      height: fd.size.height / 12,
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        child: Container(
                          width: fd.size.height / 20,
                          height: fd.size.height / 20,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 121, 255, 1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    for (var x = 0; x < payment.length; x++)
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        width: fd.size.width,
                        height: fd.size.height / 15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Row(
                          children: <Widget>[
                            payment[x]['icon'] == null
                                ? Container(
                                    width: 20,
                                  )
                                : Container(
                                    padding: EdgeInsets.all(10),
                                    width: fd.size.width / 7,
                                    height: fd.size.height / 15,
                                    child: Image.asset("${payment[x]['icon']}",color:Color.fromRGBO(155, 121, 255, 1)),
                                  ),
                            Expanded(
                              child: Container(
                                child:
                                    Text("${payment[x]['name']}".toUpperCase()),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                _deletePayment(payment[x]['id'].toString());
                              },
                              child: Container(
                                width: fd.size.width / 9,
                                height: fd.size.height / 15,
                                child: Icon(
                                  Icons.remove_circle,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
              Container(
                width: fd.size.width,
                height: fd.size.height / 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("MANAGE INCOME CATEGORIES"),
                      ),
                    ),
                    Container(
                      width: fd.size.height / 12,
                      height: fd.size.height / 12,
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        child: Container(
                          width: fd.size.height / 20,
                          height: fd.size.height / 20,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 121, 255, 1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    for (var x = 0; x < ei_cat.length; x++)
                      ei_cat[x]['type'] == 2
                          ? Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: fd.size.width,
                              height: fd.size.height / 15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: <Widget>[
                                  ei_cat[x]['icon'] == null
                                      ? Container(
                                          width: 20,
                                        )
                                      : Container(
                                          width: fd.size.width / 7,
                                          padding: EdgeInsets.all(10),
                                          height: fd.size.height / 15,
                                          child: Image.asset("${ei_cat[x]['icon']}",color:Color.fromRGBO(155, 121, 255, 1)),
                                        ),
                                  Expanded(
                                    child: Container(
                                      child: Text("${ei_cat[x]['name']}"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _deleteIncome(
                                          ei_cat[x]['id'].toString());
                                    },
                                    child: Container(
                                      width: fd.size.width / 9,
                                      height: fd.size.height / 15,
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container()
                  ],
                ),
              ),
              Container(
                width: fd.size.width,
                height: fd.size.height / 12,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text("MANAGE EXPENSE CATEGORIES"),
                      ),
                    ),
                    Container(
                      width: fd.size.height / 12,
                      height: fd.size.height / 12,
                      alignment: AlignmentDirectional.centerEnd,
                      child: GestureDetector(
                        child: Container(
                          width: fd.size.height / 20,
                          height: fd.size.height / 20,
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 121, 255, 1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    for (var x = 0; x < ei_cat.length; x++)
                      ei_cat[x]['type'] == 1
                          ? Container(
                              margin: EdgeInsets.only(bottom: 10),
                              width: fd.size.width,
                              height: fd.size.height / 15,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: <Widget>[
                                  ei_cat[x]['icon'] == null
                                      ? Container(
                                          width: 20,
                                        )
                                      : Container(
                                          width: fd.size.width / 7,
                                          height: fd.size.height / 15,
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset("${ei_cat[x]['icon']}",color:Color.fromRGBO(155, 121, 255, 1)),
                                        ),
                                  Expanded(
                                    child: Container(
                                      child: Text("${ei_cat[x]['name']}"),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      _deleteExpense(ei_cat[x]['id']);
                                    },
                                    child: Container(
                                      width: fd.size.width / 9,
                                      height: fd.size.height / 15,
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : Container(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
