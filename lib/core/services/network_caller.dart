import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../models/network_response.dart';



class NetworkCaller {
  final String _defaultErrorMessage = "Something went wrong";
  final String _unAuthorizeMessage = "Session expired. Please login again.";

  final VoidCallback onUnAuthorize;
  final String accessToken;
  final Logger _logger = Logger();

  NetworkCaller({required this.onUnAuthorize,required this.accessToken});

  Future<NetworkResponse> getRequest({required String url}) async {

    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'token': accessToken ?? "",
        'Content-type': 'application/json',
      };
      _logRequest(url, null, headers);

      Response response = await get(uri, headers: headers);
      _logResponse(url, response);

      return _handleResponse(response);
    } catch (e) {
      debugPrint("Network Error: $e");
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: _defaultErrorMessage,
      );
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'Content-type': 'application/json',
        'token': accessToken ?? '',
      };
      _logRequest(url, body, headers);

      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      return _handleResponse(response, isFromLogin: isFromLogin);
    } catch (e) {
      debugPrint("Network Error: $e");
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: _defaultErrorMessage,
      );
    }
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    Map<String, dynamic>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'Content-type': 'application/json',
        'token': accessToken ?? '',
      };
      _logRequest(url, body, headers);

      Response response = await patch(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      return _handleResponse(response, isFromLogin: isFromLogin);
    } catch (e) {
      debugPrint("Network Error: $e");
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: _defaultErrorMessage,
      );
    }
  }
  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'Content-type': 'application/json',
        'token': accessToken ?? '',
      };
      _logRequest(url, body, headers);

      Response response = await put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      return _handleResponse(response, isFromLogin: isFromLogin);
    } catch (e) {
      debugPrint("Network Error: $e");
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: _defaultErrorMessage,
      );
    }
  }
  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? body,
    bool isFromLogin = false,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final Map<String, String> headers = {
        'Content-type': 'application/json',
        'token': accessToken ?? '',
      };
      _logRequest(url, body, headers);

      Response response = await delete(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );
      _logResponse(url, response);

      return _handleResponse(response, isFromLogin: isFromLogin);
    } catch (e) {
      debugPrint("Network Error: $e");
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: _defaultErrorMessage,
      );
    }
  }

  NetworkResponse _handleResponse(Response response, {bool isFromLogin = false}) {
    try {
      final decodedJson = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          body: decodedJson,
        );
      } else if (response.statusCode == 401) {
        if (!isFromLogin) {
          onUnAuthorize();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: _unAuthorizeMessage,
        );
      } else {
        String errorMessage = decodedJson['message'] ??
            decodedJson['error'] ??
            decodedJson['data'] ??
            _defaultErrorMessage;
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: errorMessage,
        );
      }
    } catch (e) {
      debugPrint("Response parsing error: $e");
      return NetworkResponse(
        statusCode: response.statusCode,
        isSuccess: false,
        errorMessage: _defaultErrorMessage,
      );
    }
  }

  void _logRequest(String url, dynamic body, Map<String, String>? headers) {
    _logger.i("============REQUEST================\n"
        "URL : $url\n"
        "HEADERS : $headers\n"
        "Body : $body\n"
        "====================================");
  }

  void _logResponse(String url, Response response) {
    _logger.i("============RESPONSE================\n"
        "URL : $url\n"
        "Status Code: ${response.statusCode}\n"
        "Body : ${response.body}\n"
        "====================================");
  }

}