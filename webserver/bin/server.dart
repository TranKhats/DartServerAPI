import 'dart:io';
import 'dart:async';
import 'dart:convert';
//import 'package:mysql1/mysql1.dart';

    // $servername = "localhost";
    // $username = "root";
    // $password = "";
    // $dbname = "servicereact";
Map jsonData = {
  'name': 'Tran kha',
  'job': 'reluctant hero',
  'BFF': 'Chewbacca',
  'ship': 'God ship',
  'weakness': 'smuggling debts'
};

// var settings=new ConnectionSettings(
//   host: 'localhost',
//   port: 8080,
//   user: 'Khoikhats123',
//   password: '',
//   db: 'test'
// );


Future main() async {
  //var  conn=await MySqlConnection.connect(settings);
  //var result=await conn.query('select * from SinhVien');
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    8081,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    if(request.method=='GET')
    {
      request.response
        ..write(jsonEncode((jsonData)))
        ..close();

    }
  }
}
