import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:test_mge_ahmadabuhasan/core/theme/colors.dart';
import 'package:test_mge_ahmadabuhasan/routes/pages.dart';

void main() async {
  loadingInstance();
  await GetStorage.init();
  runApp(const MyApp());
}

void loadingInstance() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 2)
    ..indicatorType = EasyLoadingIndicatorType.wanderingCubes
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = AppColor.primary
    ..backgroundColor = Colors.white
    ..indicatorColor = AppColor.primary
    ..textColor = AppColor.primary
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..boxShadow = [
      BoxShadow(
        color: Colors.grey.withOpacity(0.8),
        spreadRadius: 2,
        blurRadius: 5,
        offset: const Offset(1, 4),
      )
    ]
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morning Glory Enterprise',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      defaultTransition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      initialRoute: Routes.splash,
      getPages: pages,
      builder: EasyLoading.init(),
    );
  }
}
