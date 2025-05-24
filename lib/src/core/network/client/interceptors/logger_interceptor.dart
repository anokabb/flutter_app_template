import 'package:dio/dio.dart';
import 'package:flutter_app_template/src/core/services/logger/logger.dart';

class LoggerInterceptor extends Interceptor {
  final _logger = getLogger('LoggerInterceptor');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logger.i('➡️ [Request] ${options.method} ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logger.i('✅ [Response] ${response.statusCode} ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logger.e('❌ [Error] ${err.response?.statusCode} ${err.requestOptions.path}');
    super.onError(err, handler);
  }
}
