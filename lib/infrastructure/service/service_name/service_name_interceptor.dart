import 'dart:io';

import 'package:base_structure/infrastructure/resource/local_resources.dart';
import 'package:dio/dio.dart';

// TODO: change ServiceName to service name
class ServiceNameInterceptor extends InterceptorsWrapper {
  final Dio _dio;

  ServiceNameInterceptor(this._dio);

  @override
  Future onRequest(RequestOptions options) {
    options.contentType = Headers.jsonContentType;
    final token = LocalResources.token;
    options.headers.addAll({
      HttpHeaders.authorizationHeader: token,
    });
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    return super.onResponse(response);
  }

  @override
  Future onError(DioError error) async {
    if (error.response.statusCode == 401) {
      try {
        _lock();
        final response = await _refreshToken(error.request.baseUrl);
        _unlock();
        if (response?.statusCode == 204) {
          return await resendRequest(error);
        }

        return super.onError(error);
      } catch (e) {
        print(e);
      }
    }

    return super.onError(error);
  }

  void _lock() {
    _dio.interceptors.requestLock.lock();
    _dio.interceptors.responseLock.lock();
  }

  void _unlock() {
    _dio.interceptors.requestLock.unlock();
    _dio.interceptors.responseLock.unlock();
  }

  Future<Response> _refreshToken(String baseUrl) async {
    final dio = Dio();
    dio.options.contentType = Headers.jsonContentType;
    final token = LocalResources.refreshToken;
    dio.options.headers.addAll({
      HttpHeaders.authorizationHeader: token,
    });

    try {
      final result = await dio.request(
        //TODO: change endpoint
        '/auth/refresh_token',
        options: RequestOptions(
          method: 'POST',
          baseUrl: baseUrl,
        ),
      );

      final newToken = result.headers.map['authorization'].first;
      LocalResources.token = newToken;

      return result;
    } catch (e) {
      return null;
    }
  }

  Future<Response<T>> resendRequest<T>(DioError error) async {
    final path = error.request.path;
    final queryParameters = error.request.queryParameters;
    final options = error.request;
    final data = error.request.data;

    return await _dio.request(
      path,
      queryParameters: queryParameters,
      options: options,
      data: data,
    );
  }
}