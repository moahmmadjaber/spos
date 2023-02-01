

import 'package:dio/dio.dart';

Dio dio(){

  var dio=Dio(
    BaseOptions(
      baseUrl: "http://localhost:1990/api/f2",
      responseType: ResponseType.plain,
      headers: {
        'accept':'application/json',
        'content-type':'application/json'

      }
    )
  );

  return dio;
}