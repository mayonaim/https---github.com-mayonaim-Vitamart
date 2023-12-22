import 'package:vitamart/services/networking/ApiException.dart';
import 'package:vitamart/services/networking/BaseProvider.dart';
import 'package:vitamart/shared/typedef.dart';

class ApiService {
  final BaseProvider _baseProvider;

  ApiService(this._baseProvider);

  Future<JSON?> get<T>({
    required String endpoint,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      if (requiresAuthToken) 'Authorization': '',
      if (headers != null) ...headers,
    };

    final response =
        await _baseProvider.get(endpoint, headers: customHeaders, query: query);

    return _handleResponse(response);
  }

  Future<JSON?> post<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      if (requiresAuthToken) 'Authorization': '',
      if (headers != null) ...headers,
    };

    final response = await _baseProvider.post(endpoint, body,
        headers: customHeaders, query: query);

    return _handleResponse(response);
  }

  Future<JSON?> put<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      if (requiresAuthToken) 'Authorization': '',
      if (headers != null) ...headers,
    };

    final response = await _baseProvider.put(endpoint, body,
        headers: customHeaders, query: query);

    return _handleResponse(response);
  }

  Future<JSON?> delete<T>({
    required String endpoint,
    JSON? body,
    JSON? query,
    Map<String, String>? headers,
    bool requiresAuthToken = false,
  }) async {
    var customHeaders = {
      'Accept': 'application/json',
      if (requiresAuthToken) 'Authorization': '',
      if (headers != null) ...headers,
    };

    final response = await _baseProvider.delete(endpoint,
        headers: customHeaders, query: query);

    return _handleResponse(response);
  }

  JSON? _handleResponse(response) {
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw ApiException(
          response.statusCode, response.body['message'] ?? 'Unknown error');
    }
  }
}
