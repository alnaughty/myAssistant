import 'package:flutter/material.dart';
import 'package:myassistant1/variables/global.dart';

class RecurrentBudgets extends StatefulWidget {
  @override
  _recurrency createState() => new _recurrency();
}

class _recurrency extends State<RecurrentBudgets> {
  @override
  void initState() {
    super.initState();
    if (budgetCurrId == '1') {
      setState(() {
        currenC = "€";
      });
    } else {
      setState(() {
        currenC = "\$";
      });
    }
  }
  var currenC = '';
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
            height: fd.size.height / 14,
            child: Text(
              "RECURRENT INCOME",
              style: TextStyle(
                  color: Colors.grey.shade700, fontSize: fd.size.width / 18),
            ),
          ),
          Container(
            width: fd.size.width,
            height: fd.size.height / 15,
            child: Row(
              children: <Widget>[
                Container(
                    width: fd.size.width - fd.size.width / 5,
                    height: fd.size.height / 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("0.00$currenC".toUpperCase(),style: TextStyle(
                            fontSize: fd.size.width/20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700
                          ),),
                        ),
                        Text("ON THIS PERIOD",style: TextStyle(
                            fontSize: fd.size.width/25,
                            color: Colors.grey.shade700
                          ),)
                      ],
                    ),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: IconButton(
                      onPressed: () {
                        print("ASD");
                      },
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.add_circle,
                        color: Color.fromRGBO(155, 121, 255, 1),
                        size: fd.size.width / 10,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: fd.size.height/15,
          ),
          Container(
            width: fd.size.width,
            height: fd.size.height / 14,
            child: Text(
              "RECURRENT EXPENSE",
              style: TextStyle(
                  color: Colors.grey.shade700, fontSize: fd.size.width / 18),
            ),
          ),
          Container(
            width: fd.size.width,
            height: fd.size.height / 15,
            child: Row(
              children: <Widget>[
                Container(
                    width: fd.size.width - fd.size.width / 5,
                    height: fd.size.height / 15,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Text("0.00$currenC".toUpperCase(),style: TextStyle(
                            fontSize: fd.size.width/20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade700
                          ),),
                        ),
                        Text("ON THIS PERIOD",style: TextStyle(
                            fontSize: fd.size.width/25,
                            color: Colors.grey.shade700
                          ),)
                      ],
                    ),
                ),
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: IconButton(
                      onPressed: () {
                        print("ASD");
                      },
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        Icons.add_circle,
                        color: Color.fromRGBO(155, 121, 255, 1),
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
    );
  }
}
