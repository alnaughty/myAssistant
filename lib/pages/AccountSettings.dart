import 'package:flutter/material.dart';
import 'package:myassistant1/pages/CategoryManagement.dart';
import 'package:myassistant1/pages/PasswordSettings.dart';
import 'package:myassistant1/variables/global.dart';
import 'package:page_indicator/page_indicator.dart';

class AccountSettingsPage extends StatefulWidget {
  @override
  _accountSettings createState() => new _accountSettings();
}

class _accountSettings extends State<AccountSettingsPage> {
  PageController _pageController = new PageController();
  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Scaffold(
        body: Container(
      width: fd.size.width,
      height: fd.size.height,
      color: Colors.grey.shade300,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            Container(
              width: fd.size.width,
              height: fd.size.height / 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: fd.size.width / 5,
                    height: fd.size.height / 10,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey.shade700,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(null);
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        "APP SETTINGS".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: fd.size.width / 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700),
                      ),
                    ),
                  ),
                  Container(
                    width: fd.size.width / 5,
                    height: fd.size.height / 10,
                  )
                ],
              ),
            ),
            Container(
              width: fd.size.width,
              height: fd.size.height - (fd.size.height / 7),
              color: Colors.transparent,
              child: PageIndicatorContainer(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  children: <Widget>[
                    PasswordSettingsPage(),
                    CatManagement()
                  ],
                ),
                align: IndicatorAlign.bottom,
                length: 2,
                indicatorSpace: 20,
                indicatorColor: Colors.white,
                indicatorSelectorColor: Color.fromRGBO(155, 121, 255, 1),
                shape: IndicatorShape.circle(size: 25),
                padding: EdgeInsets.all(10),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
