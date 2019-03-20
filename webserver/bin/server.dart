import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:mysql1/mysql1.dart';

Future main() async {
  var settings = new ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: 'Khoikhats123',
      db: 'coffemangement');
  var conn = await MySqlConnection.connect(settings);

  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    5050,
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
      //var map = Map<String, dynamic>.from();
     
      req.response
        ..write(jsonEncode(result.toList()))
        ..close();
    }
  }
}
