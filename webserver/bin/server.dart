import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:mysql1/mysql1.dart';

// $servername = "localhost";
// $username = "root";
// $password = "";

Future main() async {
 var settings = new ConnectionSettings(
  host: '207.148.71.41', 
  port: 3306,
  user: 'root',
  password: 'Khoikhats123',
  db: 'test'
);
var conn = await MySqlConnection.connect(settings);
  var result = await conn.query('select * from SinhVien');
  // for (var i = 0; i < result.toList().length; i++) {
    
  // }
  
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    8081,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    if (request.method == 'GET') {
      request.response
        ..write(jsonEncode(result.toList()))
        ..close();
    }
  }
}
