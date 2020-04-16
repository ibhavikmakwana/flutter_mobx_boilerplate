import 'dart:convert';
import 'dart:io';

import 'package:fluttermobxboilerplate/network/custom_exception.dart';
import 'package:http/http.dart' as http;

class HttpClient<T> {
  Future get(
    url, {
    Map<String, String> headers,
    Map<String, dynamic> queryParameters,
  }) async {
    final uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: queryParameters);
    try {
      final response = await http.get(
        finalUri,
        headers: headers,
      );
      return response.body;
    } on SocketException {
      throw CustomException('No Internet connection');
    } on HttpException {
      throw CustomException("Couldn't able to reach the url");
    } on FormatException {
      throw CustomException("Bad response");
    }
  }

  Future post(
    String url, {
    Map<String, String> headers,
    dynamic body,
    Encoding encoding,
  }) async {
    try {
      final response = await http.post(
        url,
        headers: headers,
        body: body,
        encoding: encoding,
      );
      return response.body;
    } on SocketException {
      throw CustomException('No Internet connection');
    } on HttpException {
      throw CustomException("Couldn't able to reach the url");
    } on FormatException {
      throw CustomException("Bad response");
    }
  }
}
