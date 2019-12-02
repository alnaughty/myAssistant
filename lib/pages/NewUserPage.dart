import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myassistant1/pages/AddBankInfoPage.dart';
import 'package:myassistant1/pages/AddExpense.dart';
import 'package:myassistant1/pages/AddIncome.dart';
import 'package:myassistant1/pages/PassAsk.dart';
import 'package:myassistant1/process/PersistData.dart';
import 'package:page_indicator/page_indicator.dart';

PageController pageController = new PageController();

class _newState extends State<NewUserPage> {
  void initState() {
    super.initState();
    readData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async => false,
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(155, 121, 255, 1),
              Color.fromRGBO(155, 121, 255, 0.9),
              Color.fromRGBO(155, 121, 255, 0.5)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
            child: PageIndicatorContainer(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                controller: pageController,
                children: <Widget>[
                  PassAskPage(),
                  AddIncomePage(),
                  AddExpensePage()
                ],
              ),
              align: IndicatorAlign.bottom,
              length: 4,
              indicatorSpace: 20,
              indicatorColor: Colors.deepPurple,
              indicatorSelectorColor: Colors.white,
              shape: IndicatorShape.circle(size: 25),
              padding: EdgeInsets.all(10),
            ),
          ),
        ],
      ),
    ));
  }
}

class NewUserPage extends StatefulWidget {
  @override
  _newState createState() => new _newState();
}
