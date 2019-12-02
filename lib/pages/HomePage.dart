import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/pages/AccountSettings.dart';
import 'package:myassistant1/pages/BudgetSettings.dart';
import 'package:myassistant1/pages/BudgetStatus.dart';
import 'package:myassistant1/pages/CreateFirstBudget.dart';
import 'package:myassistant1/pages/LoginPage.dart';
import 'package:myassistant1/process/PersistData.dart';
import 'package:myassistant1/screen/popups.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:http/http.dart' as http;
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _homeState createState() => new _homeState();
}

class _homeState extends State<HomePage> {
  void initState() {
    super.initState();
    _getBudgets();
    Fluttertoast.showToast(msg: "Tap screen to refresh");
  }

  Future _getBudgets() async {
    showWait(context);
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
        token = data['success']['token'];
        budget = data['success']['details']['budgets'];
        payment = data['success']['details']['payment_methods'];
        currency = data['success']['details']['currencies'];
        ei_cat = data['success']['details']['incomeexpense_categories'];
        uname = data['success']['details']['name'];
        id = data['success']['details']['id'].toString();
      });
      Navigator.of(context).pop(null);
    }
  }

  _deleteBudget(index) async {
    final res = await http.delete(
        'http://myassistant.ohm-conception.com/api/budget/$index',
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token
        });
    if (res.statusCode == 200 || res.statusCode == 201) {
      json.encode(res.body);
      Fluttertoast.showToast(msg: "DELETE SUCCESSFUL");
    } else {
      Fluttertoast.showToast(msg: "REQUEST TIME OUT ${res.statusCode}");
    }
    _getBudgets();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Scaffold(
        key: _scaffoldKey,
        drawer: SafeArea(
          child: Container(
            padding: EdgeInsets.all(30),
            width: fd.size.width - (fd.size.width / 4),
            height: fd.size.height,
            decoration: BoxDecoration(
                color: Color.fromRGBO(155, 121, 255, 1),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            child: Column(
              children: <Widget>[
                Container(
                  width: fd.size.width - (fd.size.width / 4),
                  child: Text(
                    "MY ASSISTANT",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 35),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: fd.size.width - (fd.size.width / 4),
                  height: fd.size.height - (fd.size.height / 3),
                  child: ListView(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(null);
                        },
                        child: Container(
                          width: fd.size.width - (fd.size.width / 4),
                          height: fd.size.height / 13,
                          child: Row(
                            children: <Widget>[
                              Container(
                                alignment: AlignmentDirectional.bottomStart,
                                width: fd.size.height / 13,
                                height: fd.size.height / 13,
                                child: Icon(
                                  Icons.home,
                                  size: fd.size.height / 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.bottomStart,
                                width: fd.size.width -
                                    (fd.size.width - (fd.size.width / 2.6)),
                                height: fd.size.height / 13,
                                child: Text(
                                  'HOME',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      for (var x = 0; x < budget.length; x++)
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              budgetId = budget[x]['id'].toString();
                              budgetName = budget[x]['name'];
                              ei_diff = 0;
                              budgetCurrId =
                                  budget[x]['currency_id'].toString();
                            });
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: BudgetStatus(budget[x]['name']),
                                    type: PageTransitionType.leftToRight));
                          },
                          child: Container(
                            width: fd.size.width - (fd.size.width / 4),
                            height: fd.size.height / 13,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  alignment: AlignmentDirectional.bottomStart,
                                  width: fd.size.height / 13,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: fd.size.width / 50),
                                  height: fd.size.height / 13,
                                  child: Image.asset(
                                    "assets/images/budget.png",
                                    color: Colors.white,
                                    fit: BoxFit.fitWidth,
                                    width: fd.size.width / 2,
                                  ),
                                ),
                                Container(
                                  alignment: AlignmentDirectional.bottomStart,
                                  width: fd.size.width -
                                      (fd.size.width - (fd.size.width / 2.6)),
                                  height: fd.size.height / 13,
                                  child: Text(
                                    '${budget[x]['name']}'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(null);
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: AccountSettingsPage(),
                                  type: PageTransitionType.scale,
                                  alignment: Alignment.center));
                        },
                        child: Container(
                          width: fd.size.width - (fd.size.width / 4),
                          height: fd.size.height / 13,
                          child: Row(
                            children: <Widget>[
                              Container(
                                alignment: AlignmentDirectional.bottomStart,
                                width: fd.size.height / 13,
                                height: fd.size.height / 13,
                                child: Icon(
                                  Icons.settings,
                                  size: fd.size.height / 20,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.bottomStart,
                                width: fd.size.width -
                                    (fd.size.width - (fd.size.width / 2.6)),
                                height: fd.size.height / 13,
                                child: Text(
                                  'SETTINGS',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(null);
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: Loginpage(),
                                  type: PageTransitionType.scale,
                                  alignment: Alignment.center));
                          removeData();
                        },
                        child: Container(
                          width: fd.size.width - (fd.size.width / 4),
                          height: fd.size.height / 13,
                          child: Row(
                            children: <Widget>[
                              Container(
                                alignment: AlignmentDirectional.bottomStart,
                                width: fd.size.height / 13,
                                height: fd.size.height / 13,
                                child: Icon(
                                  Icons.exit_to_app,
                                  size: fd.size.height / 20,
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.bottomStart,
                                width: fd.size.width -
                                    (fd.size.width - (fd.size.width / 2.6)),
                                height: fd.size.height / 13,
                                child: Text(
                                  'LOGOUT',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700),
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
        ),
        body: WillPopScope(
          onWillPop: () async => false,
          child: GestureDetector(
            onTap: () {
              print("asdas");
              _getBudgets();
            },
            child: Container(
              width: fd.size.width,
              height: fd.size.height,
              child: ListView(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.height - fd.size.height / 7,
                    color: Colors.grey.shade300,
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: fd.size.width,
                            height: fd.size.height / 10,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: fd.size.height / 10,
                                  height: fd.size.height / 10,
                                  child: IconButton(
                                    onPressed: () {
                                      _scaffoldKey.currentState.openDrawer();
                                    },
                                    icon: Icon(
                                      Icons.menu,
                                      size: 30,
                                      color: Color.fromRGBO(155, 121, 255, 1),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: fd.size.width - (fd.size.width / 2.5),
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    "MY BUDGETS",
                                    style: TextStyle(
                                        color: Colors.grey.shade600,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: <Widget>[
                                for (var x = 0; x < budget.length; x++)
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        budgetId = budget[x]['id'].toString();
                                        budgetName = budget[x]['name'];
                                        ei_diff = 0;
                                        budgetCurrId =
                                            budget[x]['currency_id'].toString();
                                      });
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: BudgetStatus(
                                                  budget[x]['name']),
                                              type: PageTransitionType
                                                  .leftToRight));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      width: fd.size.width,
                                      height: fd.size.height / 8,
                                      color: Color.fromRGBO(155, 121, 255, 1),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: fd.size.width / 2 +
                                                fd.size.width / 5,
                                            height: fd.size.height / 8,
                                            padding: EdgeInsets.only(left: 40),
                                            alignment: AlignmentDirectional
                                                .centerStart,
                                            child: Text(
                                              "${budget[x]['name']}"
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: true,
                                            ),
                                          ),
                                          Container(
                                            height: fd.size.height / 8,
                                            width: fd.size.width / 4 -
                                                fd.size.width / 10,
                                            alignment:
                                                AlignmentDirectional.center,
                                            child: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  budgetId = budget[x]['id']
                                                      .toString();
                                                  budgetName =
                                                      budget[x]['name'];
                                                  budgetCurrId = budget[x]
                                                          ['currency_id']
                                                      .toString();
                                                });
                                                Navigator.push(
                                                    context,
                                                    PageTransition(
                                                        child:
                                                            BudgetSettingsPage(
                                                                budget, x),
                                                        type: PageTransitionType
                                                            .fade));
                                              },
                                              icon: Icon(
                                                Icons.settings,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: fd.size.height / 8,
                                            width: fd.size.width / 4 -
                                                fd.size.width / 10,
                                            child: IconButton(
                                              onPressed: () {
                                                print("DE");
                                                _deleteBudget(
                                                    budget[x]['id'].toString());
                                              },
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                Container(
                                  width: fd.size.width,
                                  height: fd.size.height / 7,
                                  alignment: AlignmentDirectional.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      _getBudgets();
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: CreateInitBudgetPage(),
                                              type: PageTransitionType
                                                  .leftToRightWithFade));
                                    },
                                    child: Container(
                                      width: fd.size.height / 8,
                                      height: fd.size.height / 8,
                                      alignment: AlignmentDirectional.center,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(155, 121, 255, 1),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.grey.shade300,
                                        size: fd.size.width / 10,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: AccountSettingsPage(),
                              type: PageTransitionType.scale,
                              alignment: Alignment.center));
                      _getBudgets();
                    },
                    child: Container(
                      width: fd.size.width,
                      height: fd.size.height / 10,
                      color: Color.fromRGBO(155, 121, 255, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: fd.size.width / 6,
                            height: fd.size.height / 10,
                            child: Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: fd.size.width / 10,
                            ),
                          ),
                          Container(
                            width: fd.size.width / 3,
                            height: fd.size.height / 10,
                            alignment: AlignmentDirectional.centerStart,
                            child: Text(
                              "SETTINGS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: fd.size.width / 20),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
