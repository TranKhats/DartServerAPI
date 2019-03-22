import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:mysql1/mysql1.dart';
import 'AccountModel.dart';

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
    5555
  );
  print('Listening on localhost:${server.port}');


}
