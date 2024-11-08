import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:test_mge_ahmadabuhasan/core/values/api_constants.dart';

import '../models/photo.model.dart';
import '../providers/api.provider.dart';

class PhotoService {
  HttpClient httpClient = HttpClient();

  Future<List<PhotoModel>> getAll() async {
    try {
      Response response = await httpClient.get(ApiConstants.photo);
      List jsonResponse = response.data;
      return jsonResponse.map<PhotoModel>((map) => PhotoModel.fromJson(map)).toList();
    } on DioException catch(_) {
      EasyLoading.showError('Get Data Failed');
      throw Exception(_.message);
    }
  }

}