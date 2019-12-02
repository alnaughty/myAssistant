import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:myassistant1/main.dart';
import 'package:http/http.dart' as http;
import 'package:myassistant1/screen/popups.dart';
import 'package:myassistant1/variables/global.dart';

class HistoryShowPage extends StatefulWidget {
  @override
  _histoShow createState() => new _histoShow();
}

var _date = DateTime.now().year.toString() +
    "-" +
    DateTime.now().month.toString() +
    "-" +
    DateTime.now().day.toString() +
    " 00:00:00.000";
DateFormat df = DateFormat('yyyy-MM-dd');
DateFormat tf = DateFormat('HH:mm');
DateFormat tot = DateFormat('yyyy-MM-dd kk:mm:ss');
var currenC = '';

class _histoShow extends State<HistoryShowPage> {
  void initState() {
    super.initState();
    print(_date);
    print(df.parse(ei_cat[0]['created_at']));
    print(tot.parse(ei_cat[0]['created_at']));
    print(tf.format(tot.parse(ei_cat[0]['created_at'])));
    if (budgetCurrId == '1') {
      setState(() {
        currenC = "€";
      });
    } else {
      setState(() {
        currenC = "\$";
      });
    }
    _getEIHistory();
    Fluttertoast.showToast(msg: "Press screen to refresh");
  }

  Future _getEIHistory() async {
    showWait(context);
    final response = await http.post(
      "http://myassistant.ohm-conception.com/api/login",
      body: {
        "email": uemail,
        "password": pass,
      },
    );
    if (response.statusCode == 200) {
      Navigator.of(context).pop(null);
      var data = json.decode(response.body);
      setState(() {
        ei_cat = data['success']['details']['incomeexpense_categories'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Container(
      width: fd.size.width,
      height: fd.size.height,
      padding: EdgeInsets.only(bottom: 50, right: 20, left: 20),
      child: GestureDetector(
        onTap: () {
          _getEIHistory();
        },
        child: Container(
          width: fd.size.width,
          height: fd.size.height,
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              Container(
                width: fd.size.width,
                height: fd.size.height / 30,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "TODAY",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                    ),
                    Container(
                      width: fd.size.width / 4.5,
                      height: fd.size.height / 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: fd.size.width / 25,
                            height: fd.size.height / 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(155, 121, 255, 1),
                                borderRadius:
                                    BorderRadius.circular(fd.size.width / 200)),
                          ),
                          Text(
                            "Expense",
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: fd.size.width / 4,
                      height: fd.size.height / 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            width: fd.size.width / 25,
                            height: fd.size.height / 50,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(4, 118, 176, 1),
                                borderRadius:
                                    BorderRadius.circular(fd.size.width / 200)),
                          ),
                          Text(
                            "Income",
                            style: TextStyle(color: Colors.grey.shade700),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    for (var x = 0; x < ei_cat.length; x++)
                      _date == df.parse(ei_cat[x]['created_at']).toString() &&
                              budgetId == ei_cat[x]['budget_id'].toString()
                          ? Container(
                              width: fd.size.width,
                              height: fd.size.height / 12,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(fd.size.width / 50),
                                  color: ei_cat[x]['type'] == 2
                                      ? Color.fromRGBO(4, 118, 176, 1)
                                      : Color.fromRGBO(155, 121, 255, 1)),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: fd.size.width / 6,
                                    height: fd.size.height / 12,
                                    padding: EdgeInsets.all(fd.size.width / 25),
                                    child: Image.asset(
                                      "${ei_cat[x]['icon']}",
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "$currenC ${ei_cat[x]['amount']}"
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: fd.size.width / 23),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: fd.size.width / 20),
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        '${tf.format(tot.parse(ei_cat[x]['created_at']))}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: fd.size.width / 23),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container()
                  ],
                ),
              ),
              Container(
                width: fd.size.width,
                height: fd.size.height / 30,
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          "PAST",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: <Widget>[
                    for (var x = 0; x < ei_cat.length; x++)
                      _date != df.parse(ei_cat[x]['created_at']).toString() &&
                              budgetId.toString() ==
                                  ei_cat[x]['budget_id'].toString()
                          ? Container(
                              width: fd.size.width,
                              height: fd.size.height / 12,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(fd.size.width / 50),
                                  color: ei_cat[x]['type'] == 2
                                      ? Color.fromRGBO(4, 118, 176, 1)
                                      : Color.fromRGBO(155, 121, 255, 1)),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: fd.size.width / 6,
                                    height: fd.size.height / 12,
                                    padding: EdgeInsets.all(fd.size.width / 25),
                                    child: Image.asset(
                                      "${ei_cat[x]['icon']}",
                                      color: Colors.white,
                                    ),
                                  ),
                                  Container(
                                    width: fd.size.width/2,
                                    height: fd.size.height/10,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          child: Text(
                                    "$currenC ${ei_cat[x]['amount']}".toUpperCase(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                        ),
                                        Container(
                                          child: Text(
                                    "${df.parse(ei_cat[x]['created_at']).year.toString() +'-'+ df.parse(ei_cat[x]['created_at']).month.toString()+'-'+ df.parse(ei_cat[x]['created_at']).day.toString()}".toUpperCase(),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: fd.size.width / 20),
                                      alignment: AlignmentDirectional.centerEnd,
                                      child: Text(
                                        '${tf.format(tot.parse(ei_cat[x]['created_at']))}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: fd.size.width / 23),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          : Container()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
