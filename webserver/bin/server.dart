import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:mysql1/mysql1.dart';
import 'AccountModel.dart';

List<Map<String,dynamic>> convertToMapUser(Results result){
  List<Map<String,dynamic>> users=new List();
  for (var row in result) {
    users.add(new AccountModel(row[0], row[1].toString()).toJson());
  }
  return users;
}

Future main() async {
  var settings = new ConnectionSettings(
      host: '207.148.71.41',
      port: 3306,
      user: 'root',
      password: 'Khoikhats123',
      db: 'coffemangement');
  var conn = await MySqlConnection.connect(settings);

  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    8989
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest req in server) {
    if (req.method == 'POST' &&
        req.headers.contentType.toString() == 'application/json') {
      String content = await req.transform(utf8.decoder).join();
      var data = jsonDecode(content) as Map; /*3*/
      String sql =
          "select * from user where username='${data['username']}' and password='${data['password']}'";
      var result = await conn.query(sql);
      req.response
        ..write(jsonEncode(convertToMapUser(result)))
        ..close();
    }
  }
}
