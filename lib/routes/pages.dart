import 'package:get/get.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/auth/auth.controller.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/auth/login.page.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/content/content.controller.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/content/content.page.dart';
import 'package:test_mge_ahmadabuhasan/app/modules/splash.page.dart';

part 'routes.dart';

List<GetPage> pages = [
  GetPage(
    name: Routes.splash, 
    page: () => const SplashPage(),
  ),
  GetPage(
    name: Routes.login, 
    page: () => const LoginPage(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: Routes.content, 
    page: () => ContentPage(),
    binding: ContentBinding(),
  ),
];