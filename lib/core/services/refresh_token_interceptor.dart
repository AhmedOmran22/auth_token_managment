// ignore_for_file: unused_import

import 'package:auth_token_managment/core/constants/constants.dart';
import 'package:auth_token_managment/core/constants/end_points.dart';
import 'package:auth_token_managment/core/functions/save_user_data.dart';
import 'package:auth_token_managment/core/services/prefs.dart';
import 'package:dio/dio.dart';

import '../errors/failure.dart';

class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  final Dio dio;

  RefreshTokenInterceptor({required this.dio});

  // ── Inject the stored Bearer token into every outgoing request ──────────
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   final String? token = Prefs.getString(kToken);
  //   if (token != null && token.isNotEmpty) {
  //     options.headers['Authorization'] = 'Bearer $token';
  //   }
  //   handler.next(options);
  // }

  // ── On 401: attempt a token refresh then retry original request ──────────
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      final String? token = Prefs.getString(kToken);
      final String? refreshToken = Prefs.getString(kRefreshToken);

      // Guard: nothing to refresh with
      if (token == null || refreshToken == null) {
        handler.next(err);
        return;
      }

      try {
        // Use a fresh Dio to avoid an interceptor loop
        final freshDio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
        final response = await freshDio.post(
          EndPoints.refreshToken,
          data: {'token': token, 'refreshToken': refreshToken},
        );

        final Map<String, dynamic> result = response.data as Map<String, dynamic>;

        // Persist new credentials
        final String newToken = result['token'];
        final String newRefreshToken = result['refreshToken'];
        await Prefs.setString(kToken, newToken);
        await Prefs.setString(kRefreshToken, newRefreshToken);
        saveUserData(result);

        // Retry the original request with the new token
        final retryOptions = err.requestOptions;
        retryOptions.headers['Authorization'] = 'Bearer $newToken';

        final retryResponse = await dio.fetch(retryOptions);
        handler.resolve(retryResponse);
      } on DioException catch (_) {
        // ServerFailure.fromDioExcepiton(e);
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }
}
