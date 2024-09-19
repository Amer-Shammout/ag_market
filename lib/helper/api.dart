import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Api {
  final Dio dio;

  Api(this.dio);

  Future<dynamic> get({
    required String url,
    @required String? token,
  }) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
    }

    try {
      Response response = await dio.get(
        url,
        options: Options(
          headers: headers,
        ),
      );
      List<dynamic> jsonData = response.data;

      return jsonData;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      log(e.toString());
      throw Exception('there was an error , try later');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
    }
    try {
      Response response =
          await dio.post(url, data: body, options: Options(headers: headers));

      Map<String, dynamic> data = response.data;

      return data;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      log(e.toString());
      throw Exception('there was an error , try later');
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    // headers.addAll({"Content-Type": "application/x-www-form-urlencoded"});
    if (token != null) {
      headers.addAll(
        {
          "Authorization": "Bearer $token",
        },
      );
    }
    try {
      print("url = $url , body = $body , token = $token ");
      Response response =
          await dio.put(url, data: body, options: Options(headers: headers));

      Map<String, dynamic> data = response.data;
      print(data);

      return data;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      log(e.toString());
      throw Exception('there was an error , try later');
    }
  }
}
