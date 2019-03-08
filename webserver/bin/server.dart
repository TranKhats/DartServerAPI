import 'dart:io';
import 'dart:async';
import 'dart:convert';

Map jsonData = {
  'name': 'Han Solo',
  'job': 'reluctant hero',
  'BFF': 'Chewbacca',
  'ship': 'Millennium Falcon',
  'weakness': 'smuggling debts'
};

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (HttpRequest request in server) {
    if(request.method=='POST')
    {
      request.response
        ..write(jsonEncode((jsonData)))
        ..close();

    }
  }
}
