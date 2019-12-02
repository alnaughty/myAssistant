import 'package:myassistant1/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> readData(context) async {
  final prefs = await SharedPreferences.getInstance();
  var respass = prefs.getString('acc_pass');
  var resmail = prefs.getString("acc_mail");
  List<String> myList = (prefs.getStringList('mylist') ?? List<String>());
  List<String> myOriginaList = myList.map((i) => i.toString()).toList();
  if (resmail != '' || resmail != null) {
    pass = respass;
    uemail = resmail;
    savedPin = myList;
  } else {
    pass = '';
    resmail = '';
    savedPin = [];
  }
  print(pass.toString());
  print(uemail.toString());
  print(savedPin.toString());
  return "SUCCESS!";
}

Future<String> removeData() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove("acc_pass");
  prefs.remove("acc_mail");
  prefs.remove("myList");
  return "SUCCESS!";
}
