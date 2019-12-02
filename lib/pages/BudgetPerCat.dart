import 'package:flutter/material.dart';
import 'package:myassistant1/variables/global.dart';

class BudgetPerCat extends StatefulWidget {
  @override
  _budgetpercat createState() => new _budgetpercat();
}

class _budgetpercat extends State<BudgetPerCat> {
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Container(
      width: fd.size.width,
      height: fd.size.height,
      padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
      child: ListView(
        children: <Widget>[
          Container(
            width: fd.size.width,
            height: fd.size.height / 7,
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "EXPENSE & INCOME PER CATEGORY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: fd.size.width / 14,
                        color: Colors.grey.shade700),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: fd.size.width / 20),
                          width: fd.size.width / 2 - (fd.size.width / 10),
                          height: fd.size.height / 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin:
                                    EdgeInsets.only(right: fd.size.width / 60),
                                width: fd.size.width / 22,
                                height: fd.size.width / 22,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        fd.size.width / 100),
                                    color: Color.fromRGBO(155, 121, 255, 1)),
                              ),
                              Text(
                                "Expense",
                                style: TextStyle(color: Colors.grey.shade700),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: fd.size.width / 2 - (fd.size.width / 10),
                          height: fd.size.height / 10,
                          padding: EdgeInsets.only(left: fd.size.width / 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin:
                                    EdgeInsets.only(right: fd.size.width / 60),
                                width: fd.size.width / 22,
                                height: fd.size.width / 22,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      fd.size.width / 100),
                                  color: Color.fromRGBO(4, 118, 176, 1),
                                ),
                              ),
                              Text(
                                "Income",
                                style: TextStyle(color: Colors.grey.shade700),
                              )
                            ],
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
    );
  }
}
