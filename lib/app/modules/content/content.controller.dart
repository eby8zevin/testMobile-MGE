import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mge_ahmadabuhasan/app/data/models/photo.model.dart';
import 'package:test_mge_ahmadabuhasan/app/data/services/photo.service.dart';
import 'package:test_mge_ahmadabuhasan/core/utils/storage.dart';

class ContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContentController());
  }
}

class ContentController extends GetxController {
  final Storage storage = Storage();
  final PhotoService service = PhotoService();
  RxList<PhotoModel> listData = <PhotoModel>[].obs;

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerAddress = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> getData() async {
    listData.value = await service.getAll();
  }

}