import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../core/utils/log.dart';
import '../../../core/values/api_constants.dart';

class HttpClient {
  static Dio dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));

  Future<Response<T>> get<T>(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      Log.i("GET | ${ApiConstants.baseUrl}$path");
      await EasyLoading.show(
        status: 'loading...',
        maskType: EasyLoadingMaskType.black,
      );
      Response<T> response = await dio.get(
        path, 
        queryParameters: queryParameters, 
        options: options, 
        cancelToken: 
        cancelToken, 
        onReceiveProgress: onReceiveProgress
      );
      Log.e("Response : $response");
      await EasyLoading.dismiss();
      return response;
    } on DioException catch (e) {
      Log.e(e.message.toString());
      EasyLoading.showError(e.message.toString());
      rethrow;
    }
  }
}