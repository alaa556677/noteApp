import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:noteapp/constants.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: Constants.linkServerName,
          receiveDataWhenStatusError: true,
          headers: {
            // 'Authorization': "Bearer ${CacheHelper.getData(key: Constants.token.toString()) == null ? "" : CacheHelper.getData(key: Constants.token.toString())}",
            // 'Authorization': "Bearer ${CacheHelper.getData(key: Constants.token.toString())}",
          }),
    );
  }

  static Future<Response> postData({
    @required String? url,
    @required dynamic data,
    Map<String, dynamic>? query,
  }) async {
    return await dio!.post(
      url!,
      queryParameters: query,
      data: data,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
    );
  }
}
