import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mge_ahmadabuhasan/core/utils/storage.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
  }
}

class AuthController extends GetxController {
  final Storage storage = Storage();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxString errorMessageUsername = ''.obs;
  RxString errorMessagePassword = ''.obs;

  String flavor = const String.fromEnvironment('FLAVOR', defaultValue: 'live');

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  bool validateLogin() {
    errorMessageUsername.value = '';
    errorMessagePassword.value = '';

    String username = usernameController.text.trim().toLowerCase();
    if (username != 'mge') {
        errorMessageUsername.value = 'Username tidak ditemukan';
      return false;
    }

    String password = passwordController.text.trim();
    if (password.isEmpty || !RegExp(r'^\d{6,}$').hasMatch(password)) {
        errorMessagePassword.value = 'Password tidak sesuai';
      return false;
    }

    int passwordInt = int.tryParse(password) ?? 0;
    if (passwordInt % 3 != 0) {
        errorMessagePassword.value = 'Password tidak sesuai';
      return false;
    }

    errorMessageUsername.value = '';
    errorMessagePassword.value = '';
    return true;
  }
}