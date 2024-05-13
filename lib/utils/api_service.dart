import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import '../default_imports.dart';
import '../exceptions/api_exceptions.dart';
import '../models/common_data.dart';

class ApiBaseHelper {
  static const _baseUrl = "${appUrl}api/";
  final Dio dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    connectTimeout: const Duration(seconds: 300),
    // receiveTimeout: 3000,
  ));

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.data;
        return responseJson;
      case 400:
        throw BadRequestException(response.data.toString());
      case 401:
      case 403:
        // SharedPreferenceHelper.clear();
        throw UnAuthorisedException(response.data.toString());

      case 500:
      default:
        throw FetchDataException(
            'Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Map<String, String> getMainHeaders() {
    String? token = "";
    // String? token = SharedPreferenceHelper.getAuthToken();
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    if (token != "") {
      headers['Authorization'] = 'Bearer $token';
    }

    return headers;
  }

  Future<dynamic> get(String url) async {
    var headers = getMainHeaders();
    String finalUrl = "$_baseUrl$url";
    Helper().printMessage(finalUrl);
    dynamic responseJson;
    try {
      final response =
          await dio.get(finalUrl, options: Options(headers: headers));
      responseJson = _returnResponse(response);
    } catch (e) {
      throw FetchDataException(e.toString());
    }

    return responseJson;
  }

  Future<dynamic> post(String url, [dynamic body]) async {
    var headers = getMainHeaders();
    String finalUrl = "$_baseUrl$url";
    dynamic responseJson;
    Helper().printMessage(finalUrl);
    try {
      final response = await dio.post(finalUrl,
          data: jsonEncode(body), options: Options(headers: headers));
      responseJson = _returnResponse(response);
    } catch (e) {
      throw FetchDataException(e.toString());
    }

    return responseJson;
  }

  Future<dynamic> put(String url, [dynamic body]) async {
    var headers = getMainHeaders();
    dynamic responseJson;
    try {
      final response = await dio.put(url,
          data: jsonEncode(body), options: Options(headers: headers));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }

    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var headers = getMainHeaders();
    dynamic apiResponse;
    try {
      final response =
          await dio.delete(url, options: Options(headers: headers));
      apiResponse = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return apiResponse;
  }
}

class ApiService {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<CommonData> getAppData() async {
    final response = await _helper.post("app_data");
    return commonDataFromJson(response);
  }
}
