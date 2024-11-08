import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mge_ahmadabuhasan/core/theme/colors.dart';
import 'package:test_mge_ahmadabuhasan/core/utils/storage.dart';

import '../../routes/pages.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  final Storage _storage = Storage();
  bool? isLogin;

  @override
  void initState() {
    super.initState();
    
    Future.delayed(const Duration(seconds: 3), () {
      isLogin = _storage.isLogin();
      if (isLogin!) {
        Get.offAllNamed(Routes.content);
      } else {
        Get.offAllNamed(Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: FlutterLogo(
          size: 100,
        ),
      ),
    );
  }
}