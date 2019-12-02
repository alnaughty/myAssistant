import 'dart:ui';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

void showWait(context) {
  showDialog(
      context: context,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: SpinKitThreeBounce(
                      color: Color.fromRGBO(155, 121, 255, 1),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "LOADING...",
                      style: TextStyle(color: Color.fromRGBO(155, 121, 255, 1)),
                    ),
                  )
                ],
              ),
            ),
          )));
}

void showConnectionError(context) {
  showDialog(
    context: context,
    child: AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/30)
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(Icons.error,color: Colors.red,size: MediaQuery.of(context).size.height/10,),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: Text("Connection Error, Please try again later",textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 25
              ),),
            )
          ],
        ),
      ),
      ),
    )
  );
}

void showInvalidLogin(context) {
  showDialog(
    context: context,
    child: AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/30)
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(Icons.error,color: Colors.red,size: MediaQuery.of(context).size.height/10,),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: Text("No Account Found!",textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 25
              ),),
            )
          ],
        ),
      ),
      ),
    )
  );
}
void showMaintenance(context) {
  showDialog(
    context: context,
    child: AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4.0,sigmaY: 4.0),
        child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/4,
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.5),
          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width/30)
        ),
        child: Row(
          children: <Widget>[
            Container(
              child: Icon(Icons.info,color: Colors.yellow,size: MediaQuery.of(context).size.height/10,),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              child: Text("Server Maintenance",textAlign: TextAlign.center, style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.width / 25
              ),),
            )
          ],
        ),
      ),
      ),
    )
  );
}