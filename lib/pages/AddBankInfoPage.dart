import 'package:flutter/material.dart';
import 'package:myassistant1/variables/global.dart';
import 'NewUserPage.dart';

class AddBankInfoPage extends StatefulWidget {
  @override
  _binfoState createState() => new _binfoState();
}
List _bankInfo = [{
  "bank-name":"PNB BANK",
  "icon":"assets/images/bank.png"
},
{
  "bank-name":"PAYPAL",
  "icon":"assets/images/paypal.png"
},
{
  "bank-name":"CASH",
  "icon":"assets/images/cash.png"
},
];
class _binfoState extends State<AddBankInfoPage> {
  Future _getBankInfo() async {
    print(_bankInfo);
  }

  void initState() {
    super.initState();
    _getBankInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 140,
          alignment: AlignmentDirectional.center,
          child: Text(
            'ADD INFORMATIONS',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
        Container(
            width: MediaQuery.of(context).size.width,
            height: 250,
            child: FutureBuilder(
              future: _getBankInfo(),
              builder: (context, result) {
                return ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: _bankInfo.length,
                  itemBuilder: (context, index) {
                    return Container(
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
                            width: 40,
                            height: 40,
                            padding: EdgeInsets.all(7),
                            child: Image(
                              image: AssetImage(_bankInfo[index]['icon']),
                              fit: BoxFit.fitWidth,
                              color: Color.fromRGBO(155, 121, 255, 1),
                            ),
                          ),
                          Container(
                            child: Text(_bankInfo[index]['bank-name']),
                          )
                        ],
                      ),
                    );
                  },
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
