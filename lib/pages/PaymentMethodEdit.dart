import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:myassistant1/main.dart';
import 'package:myassistant1/variables/global.dart';

class PaymentSetting extends StatefulWidget {
  @override
  _paymentMethodState createState() => new _paymentMethodState();
}

class _paymentMethodState extends State<PaymentSetting> {
  TextEditingController paymentMethodName = new TextEditingController();
  var iconUrl = '';
  _addPaymentMethod() async {
    print(iconUrl);
    final respo = await http.post(
        "http://myassistant.ohm-conception.com/api/payment_method",
        body: {
          "name": paymentMethodName.text,
          "icon": iconUrl.toString()
        },
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token
        });
    if (respo.statusCode == 200 || respo.statusCode == 201) {
      json.encode(respo.body);
      Navigator.of(context).pop(null);
      Fluttertoast.showToast(msg: "Added Succesful");
    } else {
      Fluttertoast.showToast(
          msg: "Connection Error, Please Try Again Later ${respo.statusCode}");
    }
    paymentMethodName.clear();
    _getPaymentMethods();
  }

  void showAddPayment() {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                  backgroundColor: Colors.transparent,
                  contentPadding: EdgeInsets.all(0),
                  content: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                    child: Container(
                      height: fd.size.height / 2,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 121, 255, 0.8),
                          borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 10),
                            alignment: AlignmentDirectional.centerStart,
                            width: fd.size.width,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: fd.size.height / 14,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextField(
                              controller: paymentMethodName,
                              decoration: InputDecoration.collapsed(
                                  hintText: "Payment Method Name",
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromRGBO(155, 121, 255, 0.5))),
                            ),
                          ),
                          Container(
                            width: fd.size.width,
                            height: fd.size.height / 6,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: fd.size.width,
                                  height: fd.size.height / 23,
                                  child: Text(
                                    "Choose Icon:",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(0),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: icons.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              iconUrl = icons[index]['icon'];
                                              print(iconUrl);
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(20),
                                            margin: EdgeInsets.all(5),
                                            width: fd.size.width / 4.5,
                                            height: fd.size.width / 4,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Image.asset("${icons[index]['icon']}",color:Color.fromRGBO(155, 121, 255, 1))
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      _addPaymentMethod();
                                      _getPaymentMethods();
                                    },
                                    child: Container(
                                      width: fd.size.width,
                                      height: fd.size.height / 15,
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        "SUBMIT",
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                155, 121, 255, 1),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pop(null);
                                    },
                                    child: Container(
                                      alignment: AlignmentDirectional.center,
                                      child: Text(
                                        "CANCEL",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      width: fd.size.width,
                                      height: fd.size.height / 15,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.white,
                                              width: fd.size.height / 200),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {});
  }

  _deletePayment(index) async {
    final res = await http.delete(
        "http://myassistant.ohm-conception.com/api/payment_method/$index",
        headers: {
          "Accept": "application/json",
          HttpHeaders.authorizationHeader: "Bearer " + token
        });
    if (res.statusCode == 200) {
      json.encode(res.body);
      Fluttertoast.showToast(msg: "Payment Method Deleted Successfully");
    } else {
      Fluttertoast.showToast(
          msg: "Connection Error, Please Try Again ${res.statusCode}");
    }
    _getPaymentMethods();
  }

  Future _getPaymentMethods() async {
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
        payment = data['success']['details']['payment_methods'];
      });
    } else {
      Fluttertoast.showToast(msg: "Refreshing, Please Wait");
    }
  }

  @override
  Widget build(BuildContext context) {
    fd = MediaQuery.of(context);
    return Container(
      width: fd.size.width,
      height: fd.size.height,
      padding: EdgeInsets.symmetric(horizontal: 20),
      color: Colors.grey.shade300,
      child: Column(
        children: <Widget>[
          Container(
            width: fd.size.width,
            height: fd.size.height / 12,
            alignment: AlignmentDirectional.centerStart,
            child: Text(
              "PAYMENT INFORMATIONS",
              style: TextStyle(
                  fontSize: fd.size.width / 20, color: Colors.grey.shade700),
            ),
          ),
          FutureBuilder(
            future: _getPaymentMethods(),
            builder: (context, result) {
              return Column(
                children: <Widget>[
                  for (var x = 0; x < payment.length; x++)
                  id == ei_cat[x]['user_id'].toString() ?
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: fd.size.width,
                      height: fd.size.height / 15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: <Widget>[
                          payment[x]['icon'] == null
                              ? Container(
                                  width: 20,
                                )
                              : Container(
                                  width: fd.size.width / 7,
                                  height: fd.size.height / 15,
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset("${payment[x]['icon']}",color:Color.fromRGBO(155, 121, 255, 1))
                                ),
                          Expanded(
                            child: Container(
                              child:
                                  Text("${payment[x]['name']}".toUpperCase()),
                            ),
                          ),
                          Container(
                            width: fd.size.width / 9,
                            height: fd.size.height / 15,
                            child: IconButton(
                              padding: EdgeInsets.all(0),
                              icon: Icon(
                                Icons.edit,
                                color: Color.fromRGBO(155, 121, 255, 1),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print(payment[x]['id'].toString());
                              _deletePayment(payment[x]['id'].toString());
                            },
                            child: Container(
                              width: fd.size.width / 9,
                              height: fd.size.height / 15,
                              child: Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ) : Container(),
                  Container(
                    width: fd.size.width,
                    height: fd.size.height / 7,
                    alignment: AlignmentDirectional.center,
                    child: Container(
                      width: fd.size.width / 4,
                      height: fd.size.width / 4,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 121, 255, 1),
                          borderRadius: BorderRadius.circular(100)),
                      child: IconButton(
                        onPressed: () {
                          showAddPayment();
                          _getPaymentMethods();
                        },
                        icon: Icon(
                          Icons.add,
                          size: fd.size.width / 6,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
