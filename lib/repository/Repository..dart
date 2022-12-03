import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../main.dart';

class API {
  static Map<String, String>? headers = {
    'Accept': 'application/json',
  };
  static Map<String, String>? postheaders = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  static Future<Response> get({
    required String url,
    bool? logs,
    Map<String, String>? headers1,
  }) async {
    try {
      logs ?? false ? log('url: $url') : null;
      var response =
          await http.get(Uri.parse(url), headers: headers1 ?? headers);
      logs ?? false ? log('respose: ${response.statusCode}') : null;
      logs ?? false ? log('respose: ${response.body}') : null;
      if (response.statusCode == 401) {}
      return response;
    } finally {
      //TODO : Dialog box
    }
  }

  static Future<Response> post({
    required String url,
    required Object body,
    required BuildContext context,
    Map<String, String>? headers,
    bool? logs,
  }) async {
    try {
      logs ?? false ? log('url: $url ') : null;
      logs ?? false ? log('body: $body') : null;
      var response = await http.post(Uri.parse(url),
          body: body, headers: headers ?? postheaders);
      logs ?? false ? log('respose: ${response.statusCode}') : null;
      logs ?? false ? log('respose: ${response.body}') : null;
      if (response.statusCode == 401) {}
      return response;
    } finally {
      //TODO : Dialog box
    }
  }

  static Future<Response> patch(
      {required String url,
      required Object body,
      required BuildContext context,
      Map<String, String>? headers,
      bool? logs}) async {
    try {
      logs ?? false ? log('url: $url ') : null;
      logs ?? false ? log('body: $body') : null;
      var response = await http.patch(Uri.parse(url),
          body: body, headers: headers ?? postheaders);
      logs ?? false ? log('respose: ${response.statusCode}') : null;
      logs ?? false ? log('respose: ${response.body}') : null;
      if (response.statusCode == 401) {}
      return response;
    } finally {
      //TODO : Dialog box
    }
  }
}
