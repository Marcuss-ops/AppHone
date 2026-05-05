import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';
import '../../brand_config.dart';

class ApiClient {
  final String channelSlug = BrandConfig.channelSlug;

  Future<String?> _getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('sb-token');
  }

  Future<Map<String, String>> _headers() async {
    final token = await _getToken();
    return {
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }

  Future<dynamic> get(String path, {Map<String, String>? params}) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}$path')
        .replace(queryParameters: params);
    final res = await http.get(uri, headers: await _headers());
    _checkStatus(res);
    return jsonDecode(res.body);
  }

  Future<dynamic> post(String path, {required Map<String, dynamic> body}) async {
    final uri = Uri.parse('${ApiConstants.baseUrl}$path');
    final res = await http.post(uri,
        headers: await _headers(), body: jsonEncode(body));
    _checkStatus(res);
    return jsonDecode(res.body);
  }

  void _checkStatus(http.Response res) {
    if (res.statusCode >= 400) {
      throw ApiException(res.statusCode, jsonDecode(res.body));
    }
  }
}

class ApiException implements Exception {
  final int statusCode;
  final dynamic body;
  ApiException(this.statusCode, this.body);

  bool get isPaywall => statusCode == 403 && body['code'] == 'PAYWALL';

  @override
  String toString() => 'ApiException($statusCode): $body';
}

final apiClientProvider = Provider<ApiClient>((ref) => ApiClient());
