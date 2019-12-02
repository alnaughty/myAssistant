import 'package:flutter/material.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/pages/AccountSettings.dart';
import 'package:myassistant1/pages/BudgetStatus.dart';
import 'package:myassistant1/pages/LoginPage.dart';
import 'package:myassistant1/process/PersistData.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:page_transition/page_transition.dart';

class BudgetHistory extends StatefulWidget {
  final String name;
  BudgetHistory(this.name);
  @override
  _budgetHisto createState() => new _budgetHisto();
}

class _budgetHisto extends State<BudgetHistory> {
  GlobalKey<ScaffoldState> _scaffolKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Scaffold(
        key: _scaffolKey,
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
                          print("NAVIGATING");
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
        body: Container(
          width: fd.size.width,
          height: fd.size.height,
          color: Colors.grey.shade300,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: fd.size.width,
                  height: fd.size.height / 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: fd.size.height / 10,
                        height: fd.size.height / 10,
                        child: IconButton(
                          onPressed: () {
                            _scaffolKey.currentState.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 30,
                            color: Color.fromRGBO(155, 121, 255, 1),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            "${widget.name}".toUpperCase(),
                            style: TextStyle(
                                fontSize: fd.size.width / 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey.shade700),
                          ),
                        ),
                      ),
                      Container(
                        width: fd.size.height / 10,
                        height: fd.size.height / 10,
                        
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
