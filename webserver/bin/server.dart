import 'dart:io';
import 'dart:async';
import 'dart:convert';
//import 'package:mysql1/mysql1.dart';

// $servername = "localhost";
// $username = "root";
// $password = "";

Future main() async {
//  var settings = new ConnectionSettings(
//   host: '207.148.71.41', 
//   port: 8089,
//   user: 'debian-sys-maint',
//   password: 'bcVstnrLBTO2l3RO',
//   db: 'demodb'
// );
// var conn = await MySqlConnection.connect(settings);
  //var result = await conn.query('select * from SinhVien');
  // for (var i = 0; i < result.toList().length; i++) {
    
  // }
  
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    5051,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    if (request.method == 'GET') {
      request.response
        //..write(jsonEncode(result.toList()))
        ..write("kha dai ca 123")
        ..close();
    }
  }
}
