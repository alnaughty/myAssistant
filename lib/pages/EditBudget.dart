import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:myassistant1/main.dart';
import 'package:myassistant1/variables/global.dart';

class EditBudget extends StatefulWidget {
  List info = [];
  int index;
  EditBudget(this.info,this.index);
  @override
  _editbud createState() => new _editbud();
}

class _editbud extends State<EditBudget> {
  TextEditingController budgetName = new TextEditingController();
  TextEditingController iniBudget = new TextEditingController();
  var _date;
  void initState() {
    super.initState();
    _date = widget.info[0]['first_day_period'];
  }

  _updateBudget(id) async {
    final res = await http
        .put("http://myassistant.ohm-conception.com/api/budget/$id", body: {
      "name": budgetName.text,
      "initial_budget": iniBudget.text,
      "first_day_period": _date.toString(),
      "period_type": perId.toString(),
      "purpose": _selectedOption,
      "currency_id": currId.toString(),
    }, headers: {
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: "Bearer " + token,
      "Content-Type": "application/x-www-form-urlencoded"
    });
    if (res.statusCode == 200) {
      json.encode(res.body);
      Fluttertoast.showToast(msg: "Update Successful!");
      Navigator.of(context).pop(null);
    } else {
      Fluttertoast.showToast(msg: "Connection Error");
    }
  }

  List<String> _currency = ["Euro", "U.S. Dollar"];
  List<String> _period = [
    'Weekly',
    'Monthly',
    'One-off',
    'Trimester',
    'Semester'
  ];
  List<String> _purpose = [
    'Start new Period from previous',
    'Start new Period'
  ];
  int perId = 2;
  int currId = 1;

  String _selectedPeriod = "Monthly";
  String _selectedCurrency = 'Euro';
  String _selectedOption = "Start new Period";
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Container(
      width: fd.size.width,
      height: fd.size.height - fd.size.height / 2,
      color: Colors.grey.shade300,
      padding: EdgeInsets.symmetric(horizontal: fd.size.width / 20),
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            width: fd.size.width,
            height: fd.size.height / 12,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "MANAGE INFORMATIONS",
              style: TextStyle(
                  fontSize: fd.size.width / 20, color: Colors.grey.shade700),
            ),
          ),
          Container(
            width: fd.size.width,
            height: fd.size.height - fd.size.height / 7,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: Text(
                          'EXPENSE CATEGORIES',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.only(left: 20),
                        alignment: AlignmentDirectional.centerStart,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: TextField(
                          controller: budgetName,
                          style: TextStyle(color: Colors.grey.shade800),
                          decoration: InputDecoration.collapsed(
                              hintText: "${widget.info[widget.index]['name']}",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 15,
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Text(
                                'INITIAL BUDGET',
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              padding: EdgeInsets.only(left: 20),
                              alignment: AlignmentDirectional.centerStart,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                controller: iniBudget,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    fontFamily: "Mont",
                                    color: Colors.grey.shade800),
                                decoration: InputDecoration.collapsed(
                                    hintText:
                                        "${widget.info[widget.index]['initial_budget']}",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2 - 55,
                        height: 100,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              child: Text(
                                'CURRENCY',
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  icon: Icon(
                                    Icons.expand_more,
                                    color: Colors.grey.shade700,
                                  ),
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 17),
                                  isExpanded: true,
                                  hint: Text("Choose your option"),
                                  value: _selectedCurrency,
                                  onChanged: (newCurr) {
                                    setState(() {
                                      _selectedCurrency = newCurr;
                                      if (newCurr == "Euro") {
                                        currId = 1;
                                      } else {
                                        currId = 2;
                                      }
                                    });
                                    print(currId.toString());
                                  },
                                  items: _currency.map((String currency) {
                                    return DropdownMenuItem<String>(
                                      child: Text(currency),
                                      value: currency,
                                    );
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: Text(
                          'FIRST DAY OF YOUR PERIOD',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          padding: EdgeInsets.only(left: 20),
                          alignment: AlignmentDirectional.centerStart,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 280,
                                height: 50,
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  _date,
                                  style: TextStyle(
                                      fontFamily: "Mont",
                                      color: Colors.grey.shade800),
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                alignment: AlignmentDirectional.center,
                                child: IconButton(
                                  onPressed: () {
                                    DatePicker.showDatePicker(context,
                                        showTitleActions: true,
                                        minTime: DateTime(2018, 1, 1),
                                        maxTime: DateTime.now(),
                                        onChanged: (date) {
                                      print("Change $date");
                                    }, onConfirm: (date) {
                                      setState(() {
                                        // _date = DateFormat("yyyy-MM-dd")
                                        //     .format(date);
                                        _date = (date.year.toString() +
                                            "-" +
                                            date.month.toString() +
                                            "-" +
                                            date.day.toString());
                                      });
                                      print(_date);
                                    });
                                  },
                                  padding: EdgeInsets.all(0),
                                  icon: Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey.shade700,
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 30,
                        child: Text(
                          "PERIOD TYPE",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Icon(
                              Icons.expand_more,
                              color: Colors.grey.shade800,
                            ),
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 17),
                            isExpanded: true,
                            value: _selectedPeriod,
                            hint: Text("Select an option"),
                            items: _period.map((String period) {
                              return DropdownMenuItem<String>(
                                child: Text(period),
                                value: period,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedPeriod = val;
                                if (val == 'Weekly') {
                                  perId = 1;
                                } else if (val == 'Monthly') {
                                  perId = 2;
                                } else if (val == 'One-off') {
                                  perId = 3;
                                } else if (val == 'Trimester') {
                                  perId = 4;
                                } else {
                                  perId = 5;
                                }
                              });
                              print(perId.toString());
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Text(
                          "What will you do with the money at the end of the period?",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            icon: Icon(
                              Icons.expand_more,
                              color: Colors.grey.shade700,
                            ),
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 17),
                            isExpanded: true,
                            value: _selectedOption,
                            hint: Text("Select an option"),
                            items: _purpose.map((String val) {
                              return DropdownMenuItem<String>(
                                child: Text(
                                  val,
                                  style: TextStyle(color: Colors.grey.shade700),
                                ),
                                value: val,
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _selectedOption = val;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (iniBudget.text.length == 0) {
                      setState(() {
                        iniBudget.text = widget.info[0]["initial_budget"];
                      });
                    }
                    if (budgetName.text.length == 0) {
                      setState(() {
                        budgetName.text = widget.info[0]['name'];
                      });
                    }
                    _updateBudget(widget.info[0]['id']);
                  },
                  child: Container(
                    width: fd.size.width,
                    alignment: AlignmentDirectional.center,
                    height: fd.size.height / 12,
                    child: Text(
                      "UPDATE",
                      style: TextStyle(
                          color: Colors.white, fontSize: fd.size.width / 20),
                    ),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(155, 121, 255, 1),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
