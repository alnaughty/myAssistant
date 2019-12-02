import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/pages/CreateFirstBudget.dart';
import 'package:myassistant1/pages/NewUserPage.dart';
import 'package:http/http.dart' as http;
import 'package:myassistant1/variables/global.dart';
import 'package:page_transition/page_transition.dart';

class AddExpensePage extends StatefulWidget {
  @override
  _addincome createState() => new _addincome();
}

List expenseCat = [
  {"income_type": "Renting", "icon": "assets/images/renting.png"},
  {"income_type": "clothes", "icon": "assets/images/clothing.png"},
  {"income_type": "restaurant", "icon": "assets/images/food.png"},
  {"income_type": "insurance", "icon": "assets/images/insurance.png"}
];

class _addincome extends State<AddExpensePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          alignment: AlignmentDirectional.center,
          child: Text(
            'EXPENSE CATEGORIES',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: expenseCat.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 4),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.all(7),
                          width: 40,
                          height: 40,
                          child: Image(
                            image: AssetImage(expenseCat[index]['icon']),
                            fit: BoxFit.fitWidth,
                            color: Color.fromRGBO(155, 121, 255, 1),
                          ),
                        ),
                        Container(
                          child: Text(expenseCat[index]['income_type']
                              .toString()
                              .toUpperCase()),
                        )
                      ],
                    ),
                  ),
                );
              },
            )),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 115,
          alignment: AlignmentDirectional.center,
          child: GestureDetector(
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white),
              child: Icon(
                Icons.add,
                size: 60,
                color: Color.fromRGBO(155, 121, 255, 1),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              for (var i = 0; i < expenseCat.length; i++) {
                eiToAdd.add({
                  "name": expenseCat[i]['income_type'],
                  "icon": expenseCat[i]['icon'],
                  "amount": 0.00,
                  "type": 2
                });
              }
            });
            print(eiToAdd);
            Navigator.push(
                context,
                new PageTransition(
                    child: CreateInitBudgetPage(),
                    type: PageTransitionType.fade));
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
            Navigator.push(
                context,
                new PageTransition(
                    child: CreateInitBudgetPage(),
                    type: PageTransitionType.fade));
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
