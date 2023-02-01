import 'dart:convert';
import 'dart:io';

import 'package:spos/constants/enum_constant.dart';
import 'package:spos/constants/strings.dart';
import 'package:spos/utilis/shared_pref.dart';
class Api {
  Future<String> callApi(Map<String, dynamic>? body, String router,
      {sendToken = true, timeout = 10}) async {
    try {
      HttpClient client = HttpClient();
      client.connectionTimeout = Duration(seconds: timeout);
      client.badCertificateCallback =
      ((X509Certificate cert, String host, int port) => true);
      HttpClientRequest request;
      if (body == null) {
        request = await client.getUrl(Uri.parse(baseUrl + router));
      } else {
        request = await client.postUrl(Uri.parse(baseUrl + router));
      }
      request.headers.set('Content-Type', 'application/json; charset=utf-8');
      if (sendToken) {
        request.headers.set('Authorization',
            'Bearer ${await SharedPref.getUser(UserEnum.token)}');
      }
      if (body != null) {
        request.add(utf8.encode(jsonEncode(body)));
      }
      HttpClientResponse result = await request.close();
      if (result.statusCode == 200) {
        return await result.transform(utf8.decoder).join();
      } else {
        throw await result.transform(utf8.decoder).join();
      }
    } catch (ex) {
      rethrow;
    }
  }
}