import 'dart:io';
import 'dart:async';
import 'dart:convert' show utf8;
import 'package:mysql1/mysql1.dart';
import 'AccountModel.dart';

List<Map<String, dynamic>> convertToMapUser(Results result) {
  List<Map<String, dynamic>> users = new List();
  for (var row in result) {
    users.add(new AccountModel(row[0], row[1].toString()).toJson());
  }
  return users;
}

Future main() async {
  var server = await HttpServer.bind(InternetAddress.loopbackIPv6, 4042);
  print('Listening on localhost:${server.port}');

  await for (HttpRequest req in server) {
    if (req.method == 'POST' &&
        req.headers.contentType.toString() == 'application/json') {
      var content = await req.transform(utf8.decoder).toList();
      var val = content;
      var y = "Có dữ liệu";
      if (val == null || val.isEmpty) {
        y = "Ko nhan dc json"; //this is empty value
      }
      var x = await req.transform(utf8.decoder);
      print(y);
      req.response
        ..write(y)
        ..write(val)
        ..write(val.length)
        ..close();
    }
  }
}
