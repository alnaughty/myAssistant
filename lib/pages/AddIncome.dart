import 'package:flutter/material.dart';
import 'package:myassistant1/pages/NewUserPage.dart';
import 'package:myassistant1/variables/global.dart';

class AddIncomePage extends StatefulWidget {
  @override
  _addincome createState() => new _addincome();
}

List incomeCat = [
  {"income_type": "Salary", "icon": "assets/images/cash.png"},
  {"income_type": "Sales", "icon": "assets/images/sales.png"},
  {"income_type": "Family", "icon": "assets/images/family.png"},
];

class _addincome extends State<AddIncomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          alignment: AlignmentDirectional.center,
          child: Text(
            'INCOME CATEGORIES',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: incomeCat.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 4),
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10, left: 10),
                          padding: EdgeInsets.all(7),
                          width: 40,
                          height: 40,
                          child: Image(
                            image: AssetImage(incomeCat[index]['icon']),
                            fit: BoxFit.fitWidth,
                            color: Color.fromRGBO(155, 121, 255, 1),
                          ),
                        ),
                        Container(
                          child: Text(incomeCat[index]['income_type'].toString().toUpperCase()),
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
                    color: Colors.white
                  ),
                  child: Icon(Icons.add, size: 60,color: Color.fromRGBO(155, 121, 255, 1),),
                ),
              ),
            ),
            GestureDetector(
          onTap: () {
            setState(() {
              for (var i = 0; i < incomeCat.length; i++) {
                eiToAdd.add({
                  "name": incomeCat[i]['income_type'],
                  "icon": incomeCat[i]['icon'],
                  "amount": 0.00,
                  "type": 1
                });
              }
            });
            print(eiToAdd);
            pageController.nextPage(
                    duration: kTabScrollDuration, curve: Curves.ease);
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
            pageController.nextPage(
                duration: kTabScrollDuration, curve: Curves.ease);
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
