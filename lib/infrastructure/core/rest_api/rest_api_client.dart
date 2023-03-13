import 'package:dio/dio.dart';
import 'package:flutter_products_store/infrastructure/core/constants.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

typedef _DoRequestAction<T> = Future<Response>? Function();

abstract class RestApiClient extends GetxService {
  late Dio _dio;

  @override
  void onInit() {
    final options = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(options);
    super.onInit();
  }

  // ignore: unused_element
  Future<Options> _getOptions({ResponseType? responseType});

  Future<T?> load<T>({
    required String resource,
    Map<String, dynamic>? queryParameters,
    Function(int, int)? onReceiveProgress,
  }) async =>
      _doRequest<T>(() async => _dio.get<T>(
            '${_dio.options.baseUrl}/$resource',
            options: await _getOptions(),
            queryParameters: queryParameters,
            onReceiveProgress: onReceiveProgress,
          ));

  Future<T?> _doRequest<T>(_DoRequestAction request) async {
    final response = await request();
    final statusCode = response!.statusCode ?? 0;
    if (statusCode >= 200 && statusCode < 300) {
      // Success response
      return response.data as T?;
    } else {
      return null;
    }
  }
}

class PublicAccessRestApiClient extends RestApiClient {
  @override
  Future<Options> _getOptions({ResponseType? responseType}) async {
    return Options(
      contentType: "application/json; charset=UTF-8",
      responseType: responseType,
    );
  }
}
